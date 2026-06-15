"use client";

import { useRef, useState } from "react";
import Image from "next/image";
import { supabase } from "@/lib/supabase";
import { Upload, XMark } from "@/components/icons";

async function uploadToStorage(file: File): Promise<string> {
  const ext = file.name.split(".").pop() ?? "jpg";
  const path = `packages/${Date.now()}_${Math.random().toString(36).slice(2)}.${ext}`;

  const { error } = await supabase.storage.from("images").upload(path, file, {
    cacheControl: "3600",
    upsert: false,
  });
  if (error) throw new Error(error.message);

  const { data } = supabase.storage.from("images").getPublicUrl(path);
  return data.publicUrl;
}

export default function ImageInput({
  label,
  hint,
  value,
  onChange,
}: {
  label: string;
  hint?: string;
  value: string;
  onChange: (url: string) => void;
}) {
  const [tab, setTab] = useState<"upload" | "url">("upload");
  const [uploading, setUploading] = useState(false);
  const [uploadError, setUploadError] = useState("");
  const [urlInput, setUrlInput] = useState(value.startsWith("http") ? value : "");
  const fileRef = useRef<HTMLInputElement>(null);

  const handleFile = async (file: File) => {
    if (!file.type.startsWith("image/")) {
      setUploadError("Please select an image file.");
      return;
    }
    setUploadError("");
    setUploading(true);
    try {
      const url = await uploadToStorage(file);
      onChange(url);
    } catch (e: unknown) {
      setUploadError((e as Error).message);
    } finally {
      setUploading(false);
    }
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    const file = e.dataTransfer.files[0];
    if (file) handleFile(file);
  };

  const handleUrlApply = () => {
    const u = urlInput.trim();
    if (u) onChange(u);
  };

  const clear = () => {
    onChange("");
    setUrlInput("");
    if (fileRef.current) fileRef.current.value = "";
  };

  return (
    <div>
      <label className="block text-sm font-semibold text-ink">{label}</label>
      {hint && <p className="mt-0.5 text-xs text-ink/45">{hint}</p>}

      {/* Current image preview */}
      {value && (
        <div className="mt-2 relative inline-block">
          <div className="relative h-28 w-48 overflow-hidden rounded-xl border border-ink/10">
            <Image src={value} alt="Preview" fill sizes="192px" className="object-cover" />
          </div>
          <button
            type="button"
            onClick={clear}
            className="absolute -top-2 -right-2 grid h-6 w-6 place-items-center rounded-full bg-red-500 text-white shadow"
          >
            <XMark className="h-3.5 w-3.5" />
          </button>
        </div>
      )}

      {/* Tab switcher */}
      <div className="mt-3 flex gap-1 rounded-xl bg-ivory p-1 w-fit border border-ink/10">
        {(["upload", "url"] as const).map((t) => (
          <button
            key={t}
            type="button"
            onClick={() => setTab(t)}
            className={`rounded-lg px-4 py-1.5 text-xs font-semibold transition-colors capitalize ${
              tab === t
                ? "bg-white text-blue shadow-sm"
                : "text-ink/50 hover:text-ink"
            }`}
          >
            {t === "upload" ? "Upload File" : "Paste URL"}
          </button>
        ))}
      </div>

      {tab === "upload" ? (
        <div
          onDrop={handleDrop}
          onDragOver={(e) => e.preventDefault()}
          className="mt-2 flex flex-col items-center justify-center gap-2 rounded-xl border-2 border-dashed border-ink/15 bg-ivory px-6 py-8 text-center hover:border-blue/40 transition-colors cursor-pointer"
          onClick={() => fileRef.current?.click()}
        >
          <Upload className="h-6 w-6 text-ink/30" />
          <p className="text-sm text-ink/50">
            {uploading ? "Uploading…" : "Drag & drop or click to upload"}
          </p>
          <p className="text-xs text-ink/30">JPG, PNG, WebP — max 5 MB</p>
          <input
            ref={fileRef}
            type="file"
            accept="image/*"
            className="hidden"
            onChange={(e) => { const f = e.target.files?.[0]; if (f) handleFile(f); }}
          />
        </div>
      ) : (
        <div className="mt-2 flex gap-2">
          <input
            type="url"
            value={urlInput}
            onChange={(e) => setUrlInput(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && (e.preventDefault(), handleUrlApply())}
            placeholder="https://example.com/image.jpg"
            className="flex-1 rounded-xl border border-ink/15 bg-white px-3 py-2.5 text-sm text-ink placeholder:text-ink/35 focus:border-blue focus:outline-none transition-colors"
          />
          <button
            type="button"
            onClick={handleUrlApply}
            className="rounded-xl bg-blue px-4 py-2.5 text-sm font-semibold text-white hover:bg-blue-deep transition-colors shrink-0"
          >
            Use URL
          </button>
        </div>
      )}

      {uploadError && (
        <p className="mt-1.5 text-xs text-red-500">{uploadError}</p>
      )}
    </div>
  );
}
