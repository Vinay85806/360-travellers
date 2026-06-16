"use client";

import { useRef, useState } from "react";
import Image from "next/image";
import { supabase } from "@/lib/supabase";
import { Upload, XMark } from "@/components/icons";

/** Reads natural pixel width/height without altering the file. */
async function getImageDimensions(file: File): Promise<{ width: number; height: number }> {
  return new Promise((resolve) => {
    const img = new window.Image();
    const objectUrl = URL.createObjectURL(file);
    img.onload = () => {
      URL.revokeObjectURL(objectUrl);
      resolve({ width: img.width, height: img.height });
    };
    img.src = objectUrl;
  });
}

/** Below this width the photo will look visibly blurry once stretched on a desktop page. */
const MIN_SHARP_WIDTH = 1000;

/** Compress to JPEG, max 1200px wide, 82% quality — reduces 3-8 MB photos to ~200-400 KB */
async function compressImage(file: File): Promise<File> {
  return new Promise((resolve) => {
    const img = new window.Image();
    const objectUrl = URL.createObjectURL(file);
    img.onload = () => {
      URL.revokeObjectURL(objectUrl);
      const MAX = 1200;
      const ratio = img.width > MAX ? MAX / img.width : 1;
      const canvas = document.createElement("canvas");
      canvas.width = Math.round(img.width * ratio);
      canvas.height = Math.round(img.height * ratio);
      const ctx = canvas.getContext("2d")!;
      ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
      canvas.toBlob(
        (blob) => {
          const compressed = new File(
            [blob!],
            file.name.replace(/\.[^.]+$/, ".jpg"),
            { type: "image/jpeg" }
          );
          resolve(compressed);
        },
        "image/jpeg",
        0.82
      );
    };
    img.src = objectUrl;
  });
}

async function uploadToStorage(file: File): Promise<string> {
  const compressed = await compressImage(file);
  const path = `packages/${Date.now()}_${Math.random().toString(36).slice(2)}.jpg`;

  const { error } = await supabase.storage.from("images").upload(path, compressed, {
    cacheControl: "31536000",
    upsert: false,
    contentType: "image/jpeg",
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
  const [uploadInfo, setUploadInfo] = useState("");
  const [uploadWarning, setUploadWarning] = useState("");
  const [urlInput, setUrlInput] = useState(value.startsWith("http") ? value : "");
  const fileRef = useRef<HTMLInputElement>(null);

  const handleFile = async (file: File) => {
    if (!file.type.startsWith("image/")) {
      setUploadError("Please select an image file.");
      return;
    }
    setUploadError("");
    setUploadInfo("");
    setUploadWarning("");
    setUploading(true);
    const originalKB = Math.round(file.size / 1024);
    try {
      const { width, height } = await getImageDimensions(file);
      if (width < MIN_SHARP_WIDTH) {
        setUploadWarning(
          `This photo is only ${width}×${height}px — it will look blurry when stretched on the page. ` +
            `Tip: avoid saving images from Google search results (those are low-res previews). ` +
            `Click through to the source site, or use Unsplash/Pexels, for a sharp ${MIN_SHARP_WIDTH}px+ wide photo.`
        );
      }
      const url = await uploadToStorage(file);
      onChange(url);
      setUploadInfo(`Uploaded & compressed (was ${originalKB} KB)`);
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
            {uploading ? "Compressing & uploading…" : "Drag & drop or click to upload"}
          </p>
          <p className="text-xs text-ink/30">
            Any size — auto-compressed to save storage
          </p>
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
      {uploadWarning && !uploadError && (
        <p className="mt-1.5 text-xs text-amber-600">⚠ {uploadWarning}</p>
      )}
      {uploadInfo && !uploadError && (
        <p className="mt-1.5 text-xs text-green-600">{uploadInfo}</p>
      )}
    </div>
  );
}
