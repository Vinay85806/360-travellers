import { NextResponse } from "next/server";
import { supabase } from "@/lib/supabase";

type Body = {
  name?: string;
  email?: string;
  phone?: string;
  travelDate?: string;
  travellers?: number | string;
  message?: string;
  packageTitle?: string;
  packageSlug?: string;
};

export async function POST(request: Request) {
  let body: Body;
  try {
    body = await request.json();
  } catch {
    return NextResponse.json({ error: "Invalid request" }, { status: 400 });
  }

  const name = body.name?.trim();
  const email = body.email?.trim();
  const phone = body.phone?.trim();

  if (!name || !email || !phone) {
    return NextResponse.json(
      { error: "Name, email and phone are required." },
      { status: 400 }
    );
  }

  const travellers =
    body.travellers != null && body.travellers !== ""
      ? Number(body.travellers)
      : null;

  // 1) Store in Supabase (RLS allows anonymous insert).
  const { error } = await supabase.from("enquiries").insert({
    name,
    email,
    phone,
    travel_date: body.travelDate?.trim() || null,
    travellers: Number.isFinite(travellers) ? travellers : null,
    message: body.message?.trim() || null,
    package_title: body.packageTitle?.trim() || null,
    package_slug: body.packageSlug?.trim() || null,
  });

  if (error) {
    console.error("Enquiry insert failed:", error.message);
    return NextResponse.json(
      { error: "Could not submit enquiry. Please try again." },
      { status: 500 }
    );
  }

  // 2) Email notification via Resend (skipped gracefully if not configured).
  await sendEnquiryEmail({ name, email, phone, body, travellers });

  return NextResponse.json({ ok: true });
}

async function sendEnquiryEmail({
  name,
  email,
  phone,
  body,
  travellers,
}: {
  name: string;
  email: string;
  phone: string;
  body: Body;
  travellers: number | null;
}) {
  const apiKey = process.env.RESEND_API_KEY;
  const to = process.env.ENQUIRY_NOTIFY_EMAIL;
  const from = process.env.RESEND_FROM_EMAIL || "onboarding@resend.dev";
  if (!apiKey || !to) return; // email not set up yet — DB record already saved

  try {
    const { Resend } = await import("resend");
    const resend = new Resend(apiKey);
    await resend.emails.send({
      from: `360 Travellers <${from}>`,
      to,
      replyTo: email,
      subject: `New enquiry — ${body.packageTitle ?? "General"} (${name})`,
      text: [
        `New enquiry from the website:`,
        ``,
        `Package:    ${body.packageTitle ?? "—"}`,
        `Name:       ${name}`,
        `Email:      ${email}`,
        `Phone:      ${phone}`,
        `Travel date:${body.travelDate ?? "—"}`,
        `Travellers: ${travellers ?? "—"}`,
        ``,
        `Message:`,
        body.message ?? "—",
      ].join("\n"),
    });
  } catch (e) {
    // Don't fail the request if email errors — the enquiry is already saved.
    console.error("Enquiry email failed:", e);
  }
}
