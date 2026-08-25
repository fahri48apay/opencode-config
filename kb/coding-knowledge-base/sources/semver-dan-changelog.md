# Semantic Versioning 2.0.0 + Keep a Changelog 1.1.0

> Sumber: https://semver.org/spec/v2.0.0.html dan https://keepachangelog.com/en/1.1.0/
> Diakses: 2026-08-24
> Catatan: padatkan — aturan inti masing-masing spesifikasi digabung satu file

---

# BAGIAN 1 — Semantic Versioning 2.0.0 (SemVer)

## Inti format

```
MAJOR.MINOR.PATCH   →   X.Y.Z
```

Naikkan:

1. **MAJOR** saat membuat perubahan API yang tidak kompatibel (backward-incompatible).
2. **MINOR** saat menambah fungsionalitas secara backward-compatible.
3. **PATCH** saat melakukan bug fix backward-compatible.

Label tambahan: pre-release (`-`) dan build metadata (`+`).

## Aturan inti (ringkasan spec)

- Wajib mendeklarasikan **public API** yang presisi.
- Versi normal = `X.Y.Z`, non-negative integer, tanpa leading zero; naik numerik (1.9.0 → 1.10.0).
- Setelah rilis, isi versi TIDAK boleh diubah — perubahan = versi baru.
- **0.y.z** = fase initial development: apa pun bisa berubah, API belum stabil. Mulai umumnya dari 0.1.0.
- **1.0.0** = mendefinisikan public API stabil.
- **PATCH Z** naik jika hanya ada backward-compatible bug fixes.
- **MINOR Y** naik jika ada fungsionalitas baru backward-compatible ATAU ada API yang di-deprecate; reset PATCH ke 0.
- **MAJOR X** naik jika ada perubahan backward-incompatible pada public API; MINOR & PATCH reset ke 0.
- **Pre-release**: `-` + identifiers dot-separated `[0-9A-Za-z-]`; precedence LEBIH RENDAH dari versi normal. Contoh: `1.0.0-alpha`, `1.0.0-alpha.1`, `1.0.0-beta.11`, `1.0.0-rc.1`.
- **Build metadata**: `+` + identifiers; diabaikan dalam precedence. Contoh: `1.0.0-alpha+001`, `1.0.0+20130313144700`.
- **Urutan precedence**: `1.0.0-alpha < 1.0.0-alpha.1 < 1.0.0-alpha.beta < 1.0.0-beta < 1.0.0-beta.2 < 1.0.0-beta.11 < 1.0.0-rc.1 < 1.0.0`. Numeric < non-numeric identifier; lebih banyak field > lebih sedikit (bila prefix sama).

## Poin FAQ penting

- Kapan 1.0.0? Jika dipakai production / API stabil / kamu sudah khawatir soal backward compatibility → seharusnya sudah 1.0.0.
- Deprecation: update dokumentasi + rilis minor dengan deprecation; minimal satu rilis minor berisi deprecation SEBELUM penghapusan di major baru.
- Salah rilis breaking change sebagai minor → rilis minor baru yang mengembalikan kompatibilitas; jangan pernah memodifikasi rilis yang sudah keluar.
- "v1.2.3" BUKAN semantic version — "v" hanya konvensi penamaan tag git.

RegEx validasi resmi (ECMAScript/PCRE/Python/Go):
```
^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$
```

Penulis asli: Tom Preston-Werner (co-founder GitHub). Lisensi CC BY 3.0.

---

# BAGIAN 2 — Keep a Changelog 1.1.0

## Filosofi

Tagline: **"Don't let your friends dump git logs into changelogs."**

Changelog = file berisi daftar perubahan penting (*curated*, chronologically ordered) untuk setiap versi project — dibuat untuk MANUSIA, bukan mesin.

## Guiding principles

- Changelogs are *for humans*, not machines.
- Ada entry untuk setiap versi.
- Jenis perubahan yang sama dikelompokkan bersama.
- Versions & sections linkable.
- Versi terbaru paling atas (reverse chronological).
- Tanggal rilis ditampilkan (format ISO 8601: `2017-07-17`).
- Sebut apakah project memakai Semantic Versioning.

## Format file

Nama file: `CHANGELOG.md`.

Template header standar:

```markdown
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
```

Struktur:

```markdown
## [Unreleased]
## [1.1.2] - 2024-09-27
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security
```

## Types of changes (kategori resmi)

- `Added` — fitur baru.
- `Changed` — perubahan pada fungsi yang sudah ada.
- `Deprecated` — fitur yang akan segera dihapus.
- `Removed` — fitur yang kini dihapus.
- `Fixed` — bug fix apa pun.
- `Security` — bila ada kerentanan.

## Praktik yang dianjurkan

- Pegang section **`Unreleased`** di atas: orang bisa melihat perubahan mendatang; saat rilis tinggal rename jadi nomor versi + tanggal.
- Release yanked (ditarik karena bug/security serius): tetap masuk changelog dengan tag `## [0.0.5] - 2014-12-13 [YANKED]`.
- GitHub Releases bagus tapi non-portable & kurang discoverable — CHANGELOG.md tetap standar.
- Changelog boleh di-rewrite/diperbaiki bila ada entri yang terlewat (misal breaking change).

## Bad practices (anti-pattern)

1. **Commit log diffs sebagai changelog** — penuh noise (merge commit, judul obskur, doc changes). Commit mendokumentasikan langkah evolusi kode; changelog entry mendokumentasikan perbedaan penting antar versi bagi end users.
2. **Ignoring deprecations** — upgrade harus jelas kapan sesuatu akan rusak. Minimal: cantumkan deprecation, removal, dan breaking changes.
3. **Confusing dates** — pakai format ISO `YYYY-MM-DD` (urut besar→kecil, tidak ambigu).
4. **Inconsistent changes** — changelog yang hanya menyebut sebagian perubahan sama bahayanya dengan tidak punya changelog; harus konsisten menjadi single source of truth.
