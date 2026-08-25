# 04 · Git Workflow & Versioning

> Sumber (riset Agustus 2026):
> - `sources/conventional-commits-spec.md` — Conventional Commits v1.0.0
> - `sources/trunk-based-development.md` — Trunk-Based Development
> - `sources/semver-dan-changelog.md` — SemVer 2.0.0 + Keep a Changelog
> - `sources/google-code-review-guide.md` — bagian Small CLs

## 1. Conventional Commits (format commit)

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

- Tipe inti: `feat` (fitur baru), `fix` (bug). Tambahan umum: `build`, `chore`, `ci`,
  `docs`, `style`, `refactor`, `perf`, `test`.
- Mapping SemVer otomatis: `fix` → PATCH · `feat` → MINOR ·
  **BREAKING CHANGE** (footer, atau `!` sebelum `:`) → MAJOR.
- Breaking change footer wajib uppercase `BREAKING CHANGE:`; description wajib setelah `: `;
  body dipisah baris kosong.
- Revert: `revert: <judul asli>` + footer berisi SHA yang di-revert.

## 2. Branching: trunk-based development

- Semua dev kolaborasi di **satu trunk** (`main`). Feature branch = short-lived,
  hidup hitungan hari untuk review+CI saja, bukan artefak jangka panjang.
- Bukti skala: Google — 35.000 dev, satu monorepo trunk.
- GitFlow (multiple long-running branches) = merge hell + rilis lambat; hindari untuk
  tim kecil dan product app.
- Kode belum siap diekspos? → **feature flags**: merge dulu dalam keadaan mati,
  aktifkan saat siap. Pitfall: flag terlupakan jadi tech debt — beri tanggal kadaluarsa.
- Rilis: release branch just-in-time lalu DIHAPUS, atau rilis langsung dari trunk dengan
  "fix forward".

## 3. Ukuran perubahan (Small CLs ala Google)

- **±100 baris = reasonable · 1000 baris = terlalu besar.**
  200 baris di 1 file oke; 50 file sekecil apa pun = terlalu besar.
- Reviewer berhak menolak perubahan karena ukuran. Split: stacking (berlapis),
  by-files, horizontal (per layer), vertical (per fitur).
- Perubahan fokus SATU tujuan — jangan selipkan refactor tak terkait ke PR fitur.

## 4. Semantic Versioning

- Format `MAJOR.MINOR.PATCH`: MAJOR = API breaking · MINOR = fitur backward-compatible ·
  PATCH = bugfix.
- `0.y.z` = fase dev unstable — bebas breaking. Pre-release `-rc.1` < versi normal.
- Build metadata `+abc` diabaikan dalam precedence. `"v1.2.3"` (dengan v) bukan semver murni.

## 5. CHANGELOG.md (Keep a Changelog)

- Ditulis "for humans not machines"; section `[Unreleased]` di atas.
- Enam kategori: **Added / Changed / Deprecated / Removed / Fixed / Security**.
- Tanggal ISO `YYYY-MM-DD`; rilis dibatalkan → tag `[YANKED]`.
- Anti-pattern: dump git log mentah, mengabaikan deprecation, format tanggal ambigu.

## 6. Ritual git agent

```
git status --porcelain        # lihat state ringkas
git diff                      # baca ulang SEMUA yang akan di-commit
git log --oneline -10         # ikuti gaya pesan commit repo
git add <file spesifik>       # jangan blind-add; waspadai secret/debug file
commit hanya jika diminta     # ATURAN: tidak commit proaktif
```

- Pesan commit menjawab WHY, bukan daftar mekanis ("ubah beberapa file").
- Jangan pernah commit secret/key/artefak build. `.gitignore` dulu sebelum generate artefak.
