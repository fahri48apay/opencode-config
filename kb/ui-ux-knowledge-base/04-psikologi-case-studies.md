# 04 — Psikologi & Studi Kasus: Growth.design, Built for Mars

> Tiga lensa saling melengkapi:
> **Growth.design** = psikologi-first (hipotesis) · **Built for Mars** = benchmark terukur
> (diagnosa friksi) · **PageFlows/Mobbin** = bukti mentah (imitasi/benchmark).
>
> Workflow kombinasi: PageFlows untuk referensi → metode BFM untuk mengukur gap vs kompetitor
> → prinsip Growth.design untuk hipotesis perbaikan psikologis → uji.

---

## Growth.design

**Apa**: teardown komik beranotasi flow nyata (Duolingo, Headspace, Netflix, dll).
Metodologi: satu flow di-bedah panel demi panel dengan anotasi bias psikologis.

### Prinsip psikologi yang paling sering muncul
| Prinsip | Satu kalimat |
|---|---|
| Loss aversion | Kehilangan terasa 2× lebih menyakitkan dari keuntungan setara |
| Social proof | Orang meniru tindakan orang lain saat tidak yakin |
| Endowment effect | Sesuatu terasa lebih berharga begitu dimiliki/dipersonalisasi |
| Zeigarnik effect | Task yang belum selesai lebih mudah diingat → progress bar memotivasi |
| Curiosity gap | Celah informasi menciptakan dorongan untuk klik |
| Goal gradient | Semakin dekat target, semakin cepat usaha |
| Anchoring | Angka pertama yang terlihat menjadi acuan semua penilaian berikutnya |
| Reactance | Menekan kebebasan memicu perlawanan; paksa input = data buruk + churn |

---

## Built for Mars

**Apa**: teardown TERUKUR — Peter Orvetter menjalankan task script identik di
3–5 produk kompetitor (signup → core action → payment → cancel), mencatat semua:
klik, layar, kata/layar, waktu penyelesaian, load time. Format TechCrunch-nya:
**Wins / Fails / Fixes** per temuan.

### 10 pelajaran konkret
1. **Hapus semua navigasi saat signup** (Disney+ strip header/footer di checkout) — setiap link adalah exit ramp.
2. **Framing diskon absolut**: "60 hari gratis" > "16% off" — orang jelek memperkirakan persentase.
3. **Label tombol eksplisit**: "Add to watchlist" Netflix mengalahkan ikon "+" ambigu.
4. **Desain untuk semua metode input** (mouse wheel, trackpad gesture, touch, device aksesibilitas).
5. **Jangan ambil "aha moment" metric terlalu harfiah** — pre-follow 50 akun ala Clubhouse tanpa menjelaskan konsekuensi = backfire.
6. **Timing komitmen itu keputusan desain** (anchor Twitch sub tiers) — A/B kapan meminta komitmen.
7. **Friksi bisa MENAIKKAN konversi ~25%** (kasus BFM sendiri): personalisasi wajib-tapi-terasa-skippable > penghapusan friksi buta. Langkah opsional direframe jadi sekadar data collection.
8. **Batasi pilihan saat user belum punya preferensi** — kurasi item tak dikenal sebelum bayar = beban tanggung jawab.
9. **Peer-to-peer support = social proof ultimatif** (Airbnb hubungkan calon host ke superhost sungguhan via live chat).
10. **Cantik ≠ usable** (HBO Max) & **waspadai dark pattern** (Substack menguntungkan penulis atas pembaca) — audit gaya dan fungsi TERPISAH.

### Metode audit diri (resep BFM)
```
Pilih 3–5 kompetitor → jalankan task script identik
(signup → core action → payment → cancel)
→ catat: jumlah langkah, kata per layar, waktu, load time
→ benchmark numerik SEBELUM membentuk opini
→ lalu layer judgment kualitatif ("cepat tapi kotor" bukan kemenangan)
```
Catatan: analytics melewatkan frustrasi & kerusakan word-of-mouth —
pasangkan metrik dengan common sense.

---

## PageFlows × psikologi implisit

| Pattern sukses | Prinsip di baliknya |
|---|---|
| Progressive disclosure | Cognitive load — less overwhelm = faster competence |
| Progress ring/checklist | Goal gradient + Zeigarnik |
| Feed variabel (TikTok) | Variable reward / curiosity gap |
| Setup personalisasi | Endowment — produk terasa "milikku", switching cost naik |
| Invite/follow di awal | Social proof — nilai network front-loaded |
| Cancel flow dengan pause + preserve data | Loss aversion — defer loss |

---

## Checklist psikologi untuk flow kritis project

**Onboarding**
- [ ] ≤5 langkah sampai first value; semua lainnya skippable
- [ ] Personalisasi ≤5 pertanyaan yang sudah diketahui jawabannya
- [ ] Progress terlihat (bar/ring/checklist dismissible)
- [ ] Pre-permission dengan alasan sebelum dialog OS
- [ ] Empty state mengajarkan langkah pertama

**Paywall/Upgrade**
- [ ] Muncul di batas kontekstual (saat dibutuhkan), bukan jadwal
- [ ] Value stack + social proof + framing trial jelas
- [ ] Harga dianchor dengan baik (tiering)
- [ ] Tidak ada dark pattern (cancel sama mudahnya dengan subscribe)

**Cancel/Downgrade**
- [ ] Tawarkan pause & preserve-data (loss aversion, bukan hostage)
- [ ] Alasan keluar dikumpulkan dengan satu pertanyaan ringan
- [ ] Konfirmasi akhir tetap mudah — trust jangka panjang > retensi paksaan
