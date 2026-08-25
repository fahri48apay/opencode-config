---
name: code-review
description: Structured code review checklist covering correctness, security (OWASP Top 10 2025), error handling, readability, tests, and consistency. Use when reviewing code, a diff, a PR, or a snippet — audit kode, review kode, cek kualitas kode, PR review, atau menilai perubahan sebelum commit.
---

# Code Review

Checklist review terstruktur, dirangkum dari Google Engineering Practices
(`sources/google-code-review-guide.md`), OWASP Top 10:2025 (`owasp-top10-notes.md`),
Refactoring.Guru code smells (`refactoring-guru-code-smells.md`), dan Agans
(`agans-nine-rules.md`). Semua path relatif ke `~/coding-knowledge-base/`.

## Prinsip dasar (ala Google)

- **Approve jika perubahan jelas meningkatkan code health**, meski belum sempurna —
  "no perfect code, only better". Jangan tuntut kesempurnaan yang menunda progress.
- Fakta/data > opini pribadi; style guide absolut; konsistensi codebase jadi fallback.
- Review SETIAP baris; komentar minor ditandai prefix `Nit:`.
- Komentar kode yang benar menjelaskan WHY, bukan WHAT.

## Proses

0. **Pahami dulu**: apa tujuan perubahan ini? Baca deskripsi/issue/user request.
   Review tanpa konteks = nitpick kosong.
1. **Design** (terpenting): apakah interaksi antar bagian kode masuk akal?
   Ada pass-through method / abstraksi tak perlu / shallow module? (KB 01)
2. **Correctness**: logika benar utk kasus normal DAN edge case (input kosong, null,
   data panjang maksimum, network lambat/gagal, race condition, locale/timezone)?
3. **Security**: validasi input di trust boundary? output encoding? authz dicek di
   server? secret bocor ke log/repo? dependency baru bermasalah? (KB 05, OWASP A01–A10)
4. **Error handling**: gagal dengan aman (fail closed)? error informatif tanpa bocor
   internal? resource ditutup? transaksi rollback?
5. **Readability**: nama jujur; fungsi tidak panjang; smell katalog Refactoring.Guru —
   Long Method, Primitive Obsession, Feature Envy, Speculative Generality, Dead Code, dll.
6. **Tests**: ada test utk perilaku baru/perbaikan bug? test-nya nempel implementasi
   atau perilaku? (litmus: jarang berubah saat refactor — KB 03)
7. **Consistency**: mengikuti konvensi codebase (naming, struktur, styling)?
8. **Performance**: hanya hot path nyata, dengan profil/bukti — bukan optimasi spekulatif
   (grug: network hit = jutaan siklus; ukur dulu).
9. **Diff hygiene**: perubahan fokus satu tujuan (small CL ±100 lines ideal, >1000 terlalu
   besar); tidak ada perubahan tak terkait menyusup; tidak ada file debug/secret ikut ter-commit.

## Tingkat keparahan

| Label | Arti |
|---|---|
| 🔴 Critical | Bug, celah security, risiko data loss — HARUS diperbaiki |
| 🟡 Major | Desain salah, error handling lemah, test hilang — harus diperbaiki sebelum merge |
| 🟢 Minor | Gaya, nama, smell kecil — opsional |
| `Nit:` | Preferensi kosmetik — boleh diabaikan |

## Format output

1. **Verdict** satu kalimat: layak merge / perlu revisi / tolak.
2. Temuan per label severity, tiap temuan: lokasi (file:line) + masalah + perbaikan konkret.
3. **Top 3 perbaikan prioritas** di akhir.
4. Pujian untuk bagian yang baik (reviewer Google: beri pujian secara eksplisit).
