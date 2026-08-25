# Guidelines Resmi Provider Lain untuk Coding Agent (2025–2026) — NOTES

> Sumber: gabungan NOTES riset web 24-08-2026:
> - https://developers.openai.com/codex/learn/best-practices (OpenAI Codex "Best practices")
> - https://developers.openai.com/codex/guides/agents-md (Codex: Custom instructions with AGENTS.md)
> - https://openai.com/index/introducing-codex/ (system message codex-1)
> - https://google-gemini.github.io/gemini-cli/docs/cli/gemini-md.html + .../cli/custom-commands.html (Gemini CLI docs resmi) + https://cloud.google.com/blog/topics/developers-practitioners/gemini-cli-custom-slash-commands (Google Cloud blog, Jul 2025)
> Diakses: 2026-08-24
> Catatan: notes/padatkan. Fokus: praktik konkret yang membuat output agent lebih baik (context management, verifikasi, iterasi).

## A. OpenAI Codex — Best Practices (resmi)

### Struktur prompt per task (4 komponen)
- **Goal**: apa yang diubah/dibangun.
- **Context**: file/folder/docs/error mana yang relevan (@-mention file).
- **Constraints**: standar, arsitektur, safety requirement, konvensi.
- **Done when**: kondisi yang harus benar sebelum task selesai (test lolos, perilaku berubah, bug tak reproduce).

### AGENTS.md sebagai durable guidance
- `/init` scaffold starter AGENTS.md → EDIT agar cocok cara tim build/test/review/ship.
- Layering: global `~/.codex/AGENTS.md` (preferensi personal) → repo root (standar tim) → nested subdirectory (rule lokal); file LEBIH DEKAT ke cwd menang.
- Keep it practical: "A short, accurate AGENTS.md is more useful than a long file full of vague rules." Mulai dari dasar; tambah rule hanya setelah melihat kesalahan berulang.
- Jika membengkak: main file tetap ringkas, referensikan file markdown terpisah per topik (planning, code review, architecture).
- Feedback loop eksplisit: saat Codex salah dua kali → minta retrospective → update AGENTS.md.
- Isi AGENTS.md yang bagus: repo layout & direktori penting; cara run project; build/test/lint commands; konvensi engineering & ekspektasi PR; constraints & do-not rules; definisi "done" + cara verifikasi.

### Mekanika discovery AGENTS.md di Codex (detail teknis)
- Instruction chain dibangun sekali per run/session. Urutan: (1) global `~/.codex`: `AGENTS.override.md` jika ada, else `AGENTS.md` (hanya satu non-empty pertama); (2) project scope: walk dari git root turun ke cwd; per direktori max SATU file (`AGENTS.override.md` → `AGENTS.md` → fallback names); (3) merge: concat root→bawah dengan blank line — file lebih dekat muncul belakangan sehingga override.
- Empty file di-skip; stop bila total mencapai `project_doc_max_bytes` (default **32 KiB**) — bisa dinaikkan atau pecah ke nested dir.
- Fallback filename configurable via `project_doc_fallback_filenames` di `config.toml`.
- Verifikasi setup: `codex --ask-for-approval never "Summarize the current instructions."`; audit log TUI di `.codex-log/codex-tui.log`.

### Dari system message codex-1 (publikasi Introducing Codex)
- "If the AGENTS.md includes programmatic checks to verify your work, you MUST run all of them and make a best effort to validate that the checks pass AFTER all code changes have been made" — BERLAKU juga untuk perubahan sepele seperti dokumentasi.
- Scope AGENTS.md = seluruh directory tree di bawah folder pemiliknya; nested lebih dalam menang saat konflik; instruksi langsung system/user prompt > AGENTS.md.
- Git hygiene default: jangan buat branch baru, commit perubahan, kalau pre-commit gagal → fix & retry, worktree harus clean, jangan amend commit lama.

### Reliability loop (verifikasi)
- Jangan berhenti di "mintalah perubahan". Siklus: tulis/update test → jalankan test suite yang tepat → lint/format/typecheck → konfirmasi perilaku akhir sesuai request → review diff sendiri untuk bug/regresi/risky pattern.
- Agent hanya bisa melakukan ini jika tahu seperti apa "good": taruh di prompt ATAU AGENTS.md.
- Pattern team-scale: `code_review.md` direferensikan dari AGENTS.md → perilaku review konsisten lintas repo & contributor.

### Skills & automasi
- Workflow yang repeatable → package jadi skill (`SKILL.md`): scope SATU pekerjaan, mulai 2–3 use case konkret, input/output jelas, deskripsi menuliskan WHAT + WHEN + trigger phrase nyata. Iterasi dari satu task representatif dulu; baru plugin-kan saat matang.
- Scheduled tasks: HANYA setelah workflow reliabel dijalankan manual. Masih butuh steering banyak → jadikan skill dulu.
- Slash commands berguna: `/compact` (ringkas chat panjang), `/resume`, `/fork`, `/agent` (paralel).

### Common mistakes versi Codex docs
1. Membanjiri prompt dengan durable rules (harusnya pindah ke AGENTS.md/skill).
2. Tidak memberi tahu cara menjalankan build/test → agent tak bisa melihat hasil kerjanya.
3. Skip planning pada task multi-step/kompleks.
4. Memberi full permission ke komputer sebelum paham workflow.
5. Task live paralel pada file sama tanpa git worktrees.
6. Scheduling recurring task sebelum manual-nya reliabel.
7. Mengawasi step-by-step alih-alih membiarkan agent jalan paralel dengan kerja sendiri.
8. SATU chat untuk seluruh project → context bloated, hasil makin buruk. Gunakan satu chat per coherent outcome.

## B. Gemini CLI — Context & Commands (docs resmi Google)

### Hierarki GEMINI.md (context files)
- Dimuat & DI-CONCAT lalu dikirim ke model dengan SETIAP prompt. Urutan muat: global `~/.gemini/GEMINI.md` → project root + ancestor hingga folder `.git` → sub-directory di bawah cwd (respect `.gitignore` / `.geminiignore`).
- Footer CLI menampilkan jumlah context file aktif (visual cue).
- Import modular: sintaks `@file.md` (relative/absolute) untuk pecah GEMINI.md besar.
- Nama file dapat diganti/dilist: `"context": { "fileName": ["AGENTS.md", "CONTEXT.md", "GEMINI.md"] }` — artinya Gemini CLI bisa langsung pakai AGENTS.md.
- Manajemen: `/memory show` (lihat raw text persis yang diterima model — debugging rule "diabaikan"), `/memory refresh|reload` (re-scan setelah edit), `/memory add <teks>` (append persisten on-the-fly).

### Best practices penulisan context (Gemini docs)
- Keep it focused: actionable & relevan untuk code generation saja.
- **Negative constraints sering lebih efektif** daripada instruksi positif vagu (contoh: "Do not use class components").
- Review rutin: hapus rule kadaluarsa.

### Custom slash commands (.toml)
- Lokasi: project `.gemini/commands/*.toml` (shareable via git) vs user `~/.gemini/commands/*.toml`; project mengalahkan user saat nama bentrok. Subdir → namespace titik dua (`git/commit.toml` → `/git:commit`).
- Field minimal: `prompt` (wajib), `description`. Placeholder: `{{args}}` injeksi argumen user; `!{cmd}` eksekusi shell + injeksi stdout (argumen di dalamnya otomatis di-shell-escape; ada dialog konfirmasi keamanan; error stderr + exit code ikut diinjeksi agar model paham konteks failure); `@{path}` injeksi isi file/dir listing (multimodal utk image/PDF/audio/video; hormati .gitignore).
- Contoh command `/plan` resmi (strategist pattern): role = strategist BUKAN implementer; "You MUST NOT write, modify, or execute any code"; investigasi dulu via read/search tools; output plan markdown terstruktur 5 bagian: Understanding the Goal → Investigation & Analysis → Proposed Strategic Approach → Verification Strategy → Anticipated Challenges.
- Tips komunitas (best-practice repo): tuangkan goal bukan tool spesifik; inject live state via `!{...}` (mis. `git status --short`) sebelum model berpikir; pakai `@path` untuk konteks file (lebih murah dari paste); taruh section `Rules:` di PALING BAWAH (lebih tahan paraphrase); sertakan output contract (path file, shape JSON, headings); jaga prompt < ~300 baris; hindari command do-everything — buat command kecil yang composable.

## C. Pola lintas provider (sintesis singkat)

- Semua provider konvergen pada stack yang sama: file instruksi persisten berlapis (global → repo → nested; terdekat menang) + workflow ter-package (skill/slash command) + MCP untuk sistem eksternal + verifikasi programatik sebagai syarat "selesai".
- Aturan emas verifikasi: agent harus punya check yang bisa dijalankan sendiri (test/lint/typecheck/build) dan WAJIB menjalankannya setelah semua perubahan — bahkan untuk perubahan dokumen.
- Iterasi terstruktur: kesalahan berulang → retrospective → codify ke file instruksi; context dibatasi per-outcome; planning dipisah dari eksekusi (plan mode / command /plan).
