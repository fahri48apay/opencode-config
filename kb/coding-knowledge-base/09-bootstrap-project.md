# 09 · Bootstrap Project Baru

> Sintesis dari `sources/agents-md-spec.md`, `sources/twelve-factor.md`,
> `sources/semver-dan-changelog.md`, KB `04-git-workflow.md` & `08-stack-selector.md`.
> Tujuan: project baru yang langsung enak dikerjakan agent + manusia.

## 1. Checklist bootstrap (urutan eksekusi)

```
[ ] 1. Tentukan nama + jenis project (KB 08) → init git
[ ] 2. Struktur folder minimum (JANGAN scaffold berlebihan)
[ ] 3. Manifest + tooling dasar: lint, format, typecheck, test runner
[ ] 4. README.md: apa ini, cara jalanin, cara test
[ ] 5. AGENTS.md: instruksi untuk coding agent (template §2)
[ ] 6. .gitignore benar SEBELUM artefak pertama dibuat
[ ] 7. CHANGELOG.md kosong dengan section [Unreleased] (Keep a Changelog)
[ ] 8. Versioning mulai 0.1.0 (SemVer; 0.y.z = boleh breaking)
[ ] 9. CI ringan bila repo online (lint+test saja dulu)
[ ] 10. Commit pertama: conventional commit "chore: initial project setup"
```

## 2. Template AGENTS.md

```markdown
# AGENTS.md

## Overview
<1-3 kalimat: apa project ini, siapa pemakainya>

## Setup commands
<install / env var yang wajib>

## Build & run
<nama command persis, bukan deskripsi>

## Testing instructions
<cara jalankan test + ekspektasi lulus semua sebelum commit>

## Lint / format
<command + apakah auto-fix>

## Code style
<3-8 poin HANYA yang menyimpang dari default bahasa/framework>
<naming, struktur folder, pola error handling>

## PR / commit instructions
<misal: judul [scope] deskripsi; lint+test wajib hijau>

## Security considerations
<jangan commit .env; input validation pattern yang dipakai>
```

Aturan isi (dari spec + Codex guidance): **pendek & akurat > panjang & vagu**;
uji tiap baris "kalau dihapus agent akan salah?"; tambah rule HANYA setelah kesalahan
berulang terbukti. Monorepo → AGENTS.md per subfolder (terdekat menang).

## 3. Struktur folder minimal (contoh umum)

```
src/            # kode utama
tests/          # test (atau src/**/*.test.* co-located)
scripts/        # skrip sekali-pakai/otomasi
docs/           # keputusan penting (ADR mini bila perlu)
```

Anti-pattern: folder kosong penanda arsitektur masa depan (YAGNI),
`utils/` raksasa tanpa tema.

## 4. Backend? Terapkan Twelve-Factor sejak hari pertama

1 Codebase (satu repo, banyak deploy) · 2 Dependencies eksplisit · 3 Config di environment
(bukan di kode) · 4 Backing services = attached resource · 5 Build-release-run terpisah ·
6 Processes stateless share-nothing · 7 Port binding sendiri · 8 Concurrency via proses ·
9 Disposability (start cepat, shutdown graceful) · 10 Dev≈prod parity ·
11 Logs = event stream ke stdout · 12 Admin process = one-off script.

Detail per factor: `sources/twelve-factor.md`.

## 5. Definisi "project siap dikerjakan agent"

- [ ] Agent bisa menjawab: bagaimana build, run, test? (dari AGENTS.md/README)
- [ ] Ada SATU command yang membuktikan semuanya sehat (`make check` / `npm run check`)
- [ ] Konvensi naming & struktur sudah punya contoh ≥1 fitur pertama
- [ ] Secret tidak mungkin masuk git (.gitignore + template .env.example)
- [ ] CHANGELOG + versioning jalan sejak commit pertama
