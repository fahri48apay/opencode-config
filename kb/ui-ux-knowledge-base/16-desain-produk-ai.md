# 16 — Mendesain Produk AI: PAIR Guidebook + Microsoft HAX

> Sumber utama (dua kanon desain human-AI, gratis):
> - **Google People + AI Guidebook** (pair.withgoogle.com/guidebook) — 6 bab + patterns + worksheets
> - **Microsoft HAX Toolkit** (microsoft.com/haxtoolkit) — 18 Guidelines (CHI 2019 paper Amershi et al.,
>   validasi 49 praktisi × 20 produk AI; Design Library berisi pattern & contoh per guideline)
>
> File ini = sumber #1 saat mendesain fitur AI: chatbot, generator, rekomendasi, autocomplete,
> agen. Melengkapi `03` (bukti pattern umum) dan `11` (agent skills — sisi tooling).

---

## A. Keputusan level-0: apakah butuh AI? (PAIR "User Needs")

- Cari irisan **kebutuhan user × kekuatan AI**. Kalau solusi non-AI sudah menyelesaikan masalah → jangan pakai AI.
- Jangan otomasi tugas yang user nilai tinggi / bangga mengerjakan / tak ada kesepakatan "cara benar"-nya.
  **Automate**: tugas membosankan, repetitif, berbahaya, butuh skala, ada standar benar yang disepakati.
  **Augment**: tugas yang user nikmati, bernilai sosial, atau subjektif.
- Bahkan saat automasi, sediakan **human-on-the-loop**: preview, uji coba, edit, undo.
- Sinyal TIDAK boleh pakai AI: predictability wajib, transparansi penuh dibutuhkan, user eksplisit menolak.

## B. Membangun mental model & onboarding (bab Mental Models)

Framework copy onboarding dari guidebook (pakai pola ini persis):

```
Ini {produk}, dan akan membantumu dengan {manfaat inti}.
Saat ini belum bisa {keterbatasan utama}.
Seiring waktu akan makin relevan untukmu.
Kamu bisa bantu memperbaikinya dengan {aksi feedback}.
```

Aturan turunannya:
- Deskripsikan **manfaat, bukan teknologi**. Hindari janji "AI magic" — over-promise = broken trust.
- Onboard bertahap: nilai inti dulu, fitur baru saat relevan ("inboarding" tepat momen).
- Set ekspektasi adaptasi: sistem akan berubah; jelaskan kapan perlu "re-board" setelah update besar.
- Level humanisasi proporsional dengan kemampuan nyata — jangan menggoda user mengira ada manusia di baliknya.

## C. 18 Guidelines Microsoft HAX (daftar resmi)

**Initially** — sebelum interaksi:
1. Make clear what the system can do
2. Make clear how well the system can do what it can do

**During interaction** — saat dipakai:

3. Time services based on context
4. Show contextually relevant information
5. Match relevant social norms
6. Mitigate social biases

7. Support efficient invocation
8. Support efficient dismissal
9. Support efficient correction
10. Scope services when in doubt

**When wrong** — saat sistem salah:
11. Make clear why the system did what it did

**Over time** — jangka panjang:
12. Remember recent interactions
13. Learn from user behavior
14. Update and adapt cautiously
15. Encourage granular feedback
16. Convey the consequences of user actions
17. Provide global controls
18. Notify users about changes

Terjemahan operasional (paling sering dilanggar):
- G1–G2: contoh kemampuan di empty state; label confidence ("biasanya akurat untuk X, kurang untuk Y").
- G7–G8: cara cepat MEMANGGIL AI (@, shortcut) DAN cara cepat MENGABAIKAN (dismiss permanen per-saran).
- G9: edit hasil inline, regenerate, undo — recovery harus lebih murah daripada mengerjakan manual.
- G10: saat ragu → tanya klarifikasi ATAU degrade gracefully ke mode aman.
- G15: feedback granular (thumbs per-item + alasan) > satu tombol like global.

## D. Explainability + Trust (PAIR)

- **Explain for understanding, not completeness** — jelaskan secukupnya agar user bisa memutuskan;
  detail teknis taruh di progressive disclosure / luar flow aktif.
- **Model confidence display**: tampilkan skor keyakinan + alternatif yang dipertimbangkan — sering
  jadi penjelasan termurah karena hampir semua model punya n-best output.
- **6 lever trust** (worksheet resmi): Benevolence · Character · Authenticity · Integrity · Explainability · Transparency.
  → Map ke momen kritis journey; brainstorm 3 skenario: trust hilang / terjaga / berlebihan (**over-trust sama bahayanya dgn under-trust**).
- Matrix 2×2 untuk prioritas penjelasan: dampak ke user (rendah–tinggi) × confidence AI (rendah–tinggi).

## E. Errors + Graceful Failure

- Definisikan dulu apa itu "error" untuk produkmu; klasifikasikan: **user error / system error / context error**.
- Saat gagal: akui spesifik ("saya tidak yakin dengan dokumen ini") + sediakan jalur maju
  (coba lagi · edit input · lanjut manual) — user harus SELALU punya way forward non-AI.
- Feedback loop error: minta koreksi user, komunikasikan time-to-impact ("laptop ini akan belajar…").

## F. Pola UX khas era generatif (sintesis praktik 2025–2026)

| Pola | Aturan main |
|---|---|
| Streaming output | Tampilkan token mengalir + tombol stop; jangan spinner kosong >2 dtk |
| Grounding/citation | Klaim faktual wajib punya sumber yang bisa diklik; tanpa sumber = framing opini |
| Prompt-as-interface | Placeholder + contoh prompt > instruksi panjang; chip saran cepat |
| Edit vs Regenerate | Regenerate = dadu baru; edit = kontrol presisi. Sediakan dua-duanya |
| Human-in-the-loop | Draft oleh AI, approve oleh manusia untuk aksi berisiko (kirim email, bayar) |
| Progressive autonomy | Mulai suggest-only → auto-run setelah trust terbangun |

## Checklist pre-launch fitur AI

- [ ] Sudah dijawab: kenapa AI (bukan rule-based) untuk masalah ini?
- [ ] Automate/augment dipilih sadar; ada opsi non-AI selalu tersedia?
- [ ] Onboarding menjelaskan kemampuan + keterbatasan + cara feedback?
- [ ] 18 guideline HAX diprioritaskan via workbook (minimal G1,G2,G8,G9,G10)?
- [ ] Penjelasan output secukupnya (explanation strategy diuji ke user)?
- [ ] Error state: klasifikasi + pesan + jalur pulih terdesain (bukan toast generik)?
- [ ] Feedback granular tersedia & terhubung ke personalisasi nyata?
- [ ] Kontrol global: pause, riwayat, hapus data?
