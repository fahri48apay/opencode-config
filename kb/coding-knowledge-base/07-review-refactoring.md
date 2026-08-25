# 07 · Code Review & Refactoring

> Sumber (riset Agustus 2026):
> - `sources/google-code-review-guide.md` — Google Engineering Practices
> - `sources/refactoring-guru-code-smells.md` — katalog 23 code smells (6 kategori)
> - `sources/grug-brained-dev.md` — aturan refactor aman
> Checklist lengkap siap pakai: skill `code-review` (~/.config/opencode/skills/code-review/).

## 1. Prinsip review ala Google

- **Approve bila perubahan jelas meningkatkan code health** — meski belum sempurna.
  "No perfect code, only better." Jangan blokir demi kesempurnaan kosmetik.
- Fakta/data > opini; style guide absolut; konsistensi codebase = fallback saat guide diam.
- Review SETIAP baris; lihat konteks pemakaian; beri pujian eksplisit untuk yang bagus.
- Komentar kode benar menjelaskan WHY bukan WHAT.
- Kecepatan: respons < 1 hari kerja lebih penting daripada total durasi proses;
  komplain reviewer umumnya hilang kalau proses cepat. `LGTM With Comments` itu sah.

## 2. Yang dicari reviewer (urutan penting Google)

1. **Design** (terpenting) — interaksi antar bagian masuk akal? pass-through method?
2. Functionality — benar utk edge case juga?
3. UI sensible? · 4. Concurrency aman? · 5. Complexity (waspadai over-engineering!)
6. Tests ikut dalam perubahan yang sama
7. Naming · 8. Comments (WHY) · 9. Documentation · 10. Style guide · 11. Consistency

## 3. Katalog code smells (Refactoring.Guru, 23 smell)

| Kategori | Smell |
|---|---|
| **Bloaters** | Long Method · Large Class · Primitive Obsession · Long Parameter List · Data Clumps |
| **OO Abusers** | Switch Statements · Temporary Field · Refused Bequest · Alternative Classes w/ Different Interfaces |
| **Change Preventers** | Divergent Change · Shotgun Surgery · Parallel Inheritance Hierarchies |
| **Dispensables** | Comments (sebagai penutup kode buruk) · Duplicate Code · Lazy Class · Data Class · Dead Code · Speculative Generality |
| **Couplers** | Feature Envy · Inappropriate Intimacy · Message Chains · Middle Man |
| **Other** | Incomplete Library Class |

Cara pakai: smell = gejala, bukan vonis. Perbaiki HANYA bila menyebabkan change
amplification nyata (lihat KB 01). "Speculative Generality" adalah pelanggaran YAGNI
berjenggot — hapus.

## 4. Aturan refactor aman

1. **Sistem tetap jalan di setiap langkah** (grug: refactor besar makin besar makin gagal —
   "terlalu jauh dari pantai").
2. Langkah kecil + verifikasi setelah tiap langkah (test/lint/manual check).
3. Chesterton's Fence: pahami dulu kenapa kode jelek ada — test lama sering petunjuk pagar.
4. Jangan campur refactor dengan perubahan perilaku di satu commit/PR.
5. Tunggu *cut-point* alami sebelum memecah modul — jangan factor prematur.

## 5. Format hasil review

Verdict → temuan per severity (🔴 Critical / 🟡 Major / 🟢 Minor / `Nit:`) →
Top 3 prioritas → pujian. Detail: skill `code-review`.
