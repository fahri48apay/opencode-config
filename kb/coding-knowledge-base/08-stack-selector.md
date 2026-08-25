# 08 · Matriks Pemilihan Stack

> Prinsip pemilih: grug ("simple beats complex", KB `01`) + "do the simplest thing that
> works" (Anthropic) + stdlib-first (ponytail ladder rung #3). Environment dev utama kita:
> **Termux/Android** — pertimbangkan resource & ketersediaan runtime.
> Sumber pendukung: `sources/twelve-factor.md` (untuk backend), free tier: KB ui-ux `05`.

## 1. Tabel keputusan cepat

| Jenis project | Default | Kapan pilih lain |
|---|---|---|
| Landing page / web statis | **HTML + CSS + vanilla JS**, tanpa build step | Butuh konten dinamis dari banyak penulis → static site generator (Astro) |
| Web app 1–5 halaman interaktif | HTML/CSS/JS + fetch, tanpa framework | State antar halaman rumit → Vite + TS + Preact/Svelte |
| SPA besar / dashboard kompleks | **Vite + TypeScript + React** (ekosistem terbesar) | Tim kecil & mau simpel → Svelte; SSR SEO-critical → Next.js/Nuxt |
| Fullstack MVP cepat | Server-rendered sederhana: **Hono/Express + template engine**, satu repo | Realtime/kolaborasi → tambah WebSocket; butuh admin instan → framework full-batteries |
| REST/JSON API | **Hono atau Fastify (Node/TS)** — ringan, jalan di mana saja | Data-heavy/scientific → Python **FastAPI**; perf & deploy tunggal → **Go** (chi/stdlib) |
| CLI tool | **Go** (single binary cross-platform) atau **Bun/Node** skrip | Glue sekali pakai → Python/bash langsung |
| Otomasi/scripting harian | **Python** atau **bash/zsh** + jq | Sudah ada ekosistem JS → Bun/tsx |
| Mobile-lite (jangkau luas, murah) | **PWA** (manifest + service worker) | Butuh API native dalam → belakangan pakai Capacitor/Tauri |
| Desktop tool GUI ringan | **Tauri** (webview, binary kecil) | Web-only cukup → jangan buat desktop |

## 2. Aturan memilih (urutan tangga)

1. Tanpa dependency sama sekali bila bisa (HTML murni menang untuk landing page).
2. Stdlib > library populer > framework besar.
3. Satu bahasa per project bila mungkin — dua runtime = dua set tooling.
4. Build step adalah biaya: tiap build step harus membuktikan nilainya.
5. Database mulai dari SQLite (file tunggal, backup gampang); naik ke Postgres saat ada
   alasan nyata (concurrency tinggi, tipe data spesifik).

## 3. Catatan environment Termux

- Runtime yang enak di Termux: **Node/Bun, Python, Go** (compile native aarch64).
  Rust bisa tapi compile lama di HP.
- Hindari stack yang bergantung Docker/native module berat — Docker tidak native di Termux;
  proot/chroot = friksi harian.
- Single-binary (Go) paling ramah: copy satu file, jalan.
- Port <1024 butuh root → dev server selalu port tinggi (3000/8000/8080).

## 4. Konsekuensi yang ikut dipilih

| Pilihan | Biaya yang harus disadari |
|---|---|
| React | bundle size, re-render discipline, churn ekosistem |
| TypeScript | friction awal types, tapi typecheck = lapisan test gratis (Testing Trophy) |
| Go | verbose error handling; imbalan: deploy 1 binary, concurrency mudah |
| Python | packaging buruk untuk distribusi end-user; bagus untuk internal/tools |
| SQLite | tulis konkuren terbatas; backup = copy file (keuntungan sekaligus risiko) |

Kalau ragu: mulai dari kolom "Default", upgrade SAAT rasa sakitnya nyata,
bukan karena FOMO arsitektur.
