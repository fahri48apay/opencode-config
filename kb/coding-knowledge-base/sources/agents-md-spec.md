# Spec AGENTS.md — Standar Instruksi Repo untuk Coding Agent

> Sumber: https://agents.md/ (utama, situs resmi spec) + https://agentsmd.net/ (suplementer, situs panduan pihak ketiga berfokus OpenAI Codex)
> Diakses: 2026-08-24
> Catatan: raw/padatkan dari agents.md (situs resmi, disteward Agentic AI Foundation di bawah Linux Foundation); agentsmd.net hanya menambah template praktik.

## Apa itu AGENTS.md?

- Format markdown terbuka & sederhana untuk **memberi instruksi dan context kepada coding agent** — dijuluki "README for agents": tempat yang dedicated dan predictable untuk konteks yang dibutuhkan AI coding agent.
- Dipakai oleh **60.000+ project open-source** (per Aug 2026, GitHub search `path:AGENTS.md`).
- Alasan dipisah dari README: README untuk manusia (quick start, deskripsi), AGENTS.md untuk agent (build steps, test commands, konvensi yang akan mengacaukan README).
- Tidak ada format wajib — murni standard Markdown; agent cukup mem-parsing teksnya. Tidak ada required fields/headings.

## Ekosistem pendukung (satu file, banyak agent)

Codex (OpenAI), Jules (Google), Factory, Aider, goose, opencode, Zed, Warp, VS Code, Devin (Cognition), UiPath Autopilot, Junie (JetBrains), Amp, Cursor, RooCode, Gemini CLI, Kilo Code, Phoenix, Semgrep, GitHub Copilot coding agent, Ona, Windsurf, Augment Code.

## Contoh struktur isi (dari situs resmi)

```markdown
# AGENTS.md

## Setup commands
- Install deps: `pnpm install`
- Start dev server: `pnpm dev`
- Run tests: `pnpm test`

## Code style
- TypeScript strict mode
- Single quotes, no semicolons
- Use functional patterns where possible

## Testing instructions
- Run `pnpm turbo run test --filter <project_name>` untuk semua check paket tsb.
- Fokus satu test: `pnpm vitest run -t "<test name>"`.
- Fix semua test/type error sampai suite hijau SEBELUM merge.
- Setelah move file / ganti import: `pnpm lint --filter <project_name>`.
- Add/update tests untuk kode yang diubah, walau tidak diminta.

## PR instructions
- Title format: [<project_name>] <Title>
- Selalu `pnpm lint` + `pnpm test` sebelum commit.
```

Contoh nyata besar: openai/codex, apache/airflow, temporalio/sdk-java.

## Cara pakai (4 langkah resmi)

1. Buat `AGENTS.md` di root repo (agent kebanyakan bisa scaffold kalau diminta).
2. Isi bagian yang penting — populer: **project overview, build/test commands, code style guidelines, testing instructions, security considerations**.
3. Instruksi ekstra: aturan commit message/PR, security gotcha, dataset besar, deployment steps — "apa pun yang akan kamu katakan ke teammate baru".
4. Monorepo → pakai **nested AGENTS.md per subproject**: agent otomatis membaca file TERDEKAT dalam directory tree; yang terdekat menang (menang atas konflik). Contoh: repo OpenAI saat itu punya 88 file AGENTS.md.

## FAQ / aturan perilaku penting

- Konflik instruksi: **AGENTS.md terdekat dengan file yang diedit menang; prompt eksplisit user di chat meng-override semuanya.**
- Agent AKAN menjalankan command testing yang tercantum di AGENTS.md secara otomatis — mencoba menjalankan check programatik dan memperbaiki failure sebelum selesai task.
- Living documentation: boleh dan memang dianjurkan diupdate terus.
- Migrasi nama lama: `mv AGENT.md AGENTS.md && ln -s AGENTS.md AGENT.md`.
- Config khusus provider: Aider → `.aider.conf.yml` `read: AGENTS.md`; Gemini CLI → `.gemini/settings.json` `{ "context": { "fileName": "AGENTS.md" } }`.

## Best practice penulisan (gabungan situs resmi + agentsmd.net)

- agentsmd.net (panduan Codex) merekomendasikan 5 blok isi: (1) project structure/navigation, (2) coding conventions, (3) testing protocols + commands persis, (4) PR guidelines, (5) programmatic checks (lint, type-check, build) yang harus pass sebelum merge.
- Template agentsmd.net juga contohkan: larangan modifikasi folder tertentu (`/public` jangan diubah langsung), konvensi penamaan file (`PascalCase.tsx`), batasi styling pada Tailwind utility-first, PR single-concern + screenshot untuk perubahan UI.
- Dari sumber provider (Codex docs): keep it short & akurat — AGENTS.md pendek lebih berguna daripada panjang penuh rule vagu; tambah rule baru HANYA setelah melihat kesalahan berulang; jika agent membuat asumsi salah tentang codebase → perbaiki di AGENTS.md agar fix persisten (feedback loop).
