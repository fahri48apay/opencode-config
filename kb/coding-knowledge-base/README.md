# 📚 Coding Knowledge Base

> Hasil riset mendalam tentang cara coding dengan benar — prinsip engineering klasik +
> praktik resmi AI coding agent 2025–2026 (terakhir diperbarui Agustus 2026).
> Disusun agar agent `coding` (dan manusia) punya landasan yang konsisten lintas project.
> Bahasa komunikasi: Indonesia.

## Cara pakai knowledge base ini

| Situasi | Buka file |
|---|---|
| Desain arsitektur, bingung struktur, mau tahu kenapa kode terasa berat | `01-prinsip-engineering.md` |
| Mengatur kerja coding agent / memulai sesi kerja besar | `02-agent-coding-workflow.md` |
| Mau menulis test, debat unit vs integration, verifikasi sebelum klaim selesai | `03-testing-verifikasi.md` |
| Format commit, branching, versioning, changelog | `04-git-workflow.md` |
| Menulis kode yang aman, audit security, aturan secret | `05-keamanan.md` |
| Bug susah ketemu / intermitten / debugging maraton | `06-debugging.md` |
| Review PR, refactor aman, code smell | `07-review-refactoring.md` |
| Mulai project baru, bingung pilih bahasa/framework | `08-stack-selector.md` |
| Bootstrap project baru dari nol | `09-bootstrap-project.md` |

## Peta sumber → peran

```
PRINSIP (kenapa)
├── Grug Brained Developer ── kompleksitas = musuh; 80/20; Chesterton's Fence
├── Philosophy of Software Design ── deep module, pull complexity downwards
└── Out of the Tar Pit ── essential vs accidental; mutable state = penyebab #1

CARA KERJA AGENT (bagaimana)
├── Anthropic Claude Code best practices ── explore→plan→code→commit; verification loop
├── OpenAI Codex + Gemini CLI guidance ── struktur prompt Goal/Context/Constraints/Done-when
├── Spec AGENTS.md (Linux Foundation) ── instruksi repo untuk agent, nested monorepo
├── Anthropic context engineering ── context rot; JIT retrieval; compaction; subagent
└── ponytail/caveman/stop-slop (ui-ux KB file 11) ── ladder YAGNI; hemat token; anti-slop

KUALITAS (bukti & standar)
├── Testing Trophy + Kent C. Dodds ── mostly integration; stop mocking
├── Google Engineering Practices ── review: approve-if-improves; small CL ±100 lines
├── OWASP Top 10:2025 ── risiko keamanan terukur + mitigasi
├── Refactoring.Guru ── katalog 23 code smells
├── David Agans 9 rules ── metodologi debugging
│
STANDAR PROJECT META
├── Conventional Commits v1.0.0 ── format commit → SemVer otomatis
├── Trunk-Based Development ── satu trunk, short-lived branch, feature flag
├── SemVer 2.0.0 + Keep a Changelog ── versi & catatan rilis untuk manusia
└── The Twelve-Factor App ── checklist backend portabel
```

## Workflow riset yang disarankan

1. Definisikan masalahnya dulu ("test saya rapuh tiap refactor") → buka file KB yang
   relevan → baru baca `sources/` bila butuh argumen lengkap.
2. Saat memberi rekomendasi: kutip file KB-nya (mis. "KB 01 · grug: solusi 80/20").
3. Sumber mentah semua ada di `sources/` (17 file, header berisi URL + tanggal akses).

## File index

- `01-prinsip-engineering.md` — grug + Ousterhout + Tar Pit dalam satu teori kompleksitas
- `02-agent-coding-workflow.md` — workflow empat fase, AGENTS.md, context engineering, failure patterns
- `03-testing-verifikasi.md` — Testing Trophy, kapan test dulu, ritual verifikasi
- `04-git-workflow.md` — conventional commits, trunk-based, SemVer, changelog, ritual git agent
- `05-keamanan.md` — OWASP Top 10:2025 + non-negotiable agent + checklist cepat
- `06-debugging.md` — 9 rule Agans + kesalahan umum agent + ritual debug
- `07-review-refactoring.md` — prinsip Google + katalog smells + aturan refactor aman
- `08-stack-selector.md` — matriks jenis project → stack default + biayanya (+ Termux)
- `09-bootstrap-project.md` — checklist bootstrap + template AGENTS.md + twelve-factor
- `sources/` — teks mentah/notes 17 sumber (lihat `sources/README.md`)
