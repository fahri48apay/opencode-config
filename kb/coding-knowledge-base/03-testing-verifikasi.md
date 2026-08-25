# 03 · Testing & Verifikasi

> Sintesis (riset Agustus 2026):
> - `sources/testing-trophy.md` — Kent C. Dodds, Testing Trophy
> - `sources/kentcdodds-write-tests.md` — "Write tests. Not too many. Mostly integration."
> - `sources/grug-brained-dev.md` — bagian testing
> - Prinsip verifikasi agent: KB `02-agent-coding-workflow.md`

## 1. Peta ROI: Testing Trophy

Dari bawah ke atas (proporsi terbalik dari pyramid klasik):

```
┌─────────────┐
│   E2E       │  kecil, dikurasi ketat (mahal, paling meyakinkan)
│ ┌─────────┐ │
│ │Integration│ │  TERBESAR — badan piala; titik seimbang confidence vs biaya
│ └─────────┘ │
│    Unit     │  tipis — hanya logika murni yang rumit
│ ─────────── │
│ Static      │  dasar: typecheck + lint (bukan test, tapi lapisan pertama)
└─────────────┘
```

Definisi Dodds: unit = satu fungsi/class tanpa collaborator (atau collaborator di-mock);
integration = banyak unit saling bekerja; e2e = mocking seminimal mungkin.

Prinsip pemandu: **"The more your tests resemble the way your software is used,
the more confidence they can give you."**

## 2. Aturan jumlah & jenis

- Judul = tweet Guillermo Rauch (2016): **Write tests. Not too many. Mostly integration.**
- **100% coverage mandate = ide buruk.** Diminishing returns mulai terasa jauh di bawahnya
  (~70% angka intuitif Dodds). Mengejar coverage memaksa testing implementation details.
- **Litmus refactor**: kamu seharusnya SANGAT JARANG perlu mengubah test saat refactoring.
  Kalau sering → test nempel implementasi, bukan perilaku.
- Grug: unit test hanya bernilai awal proyek; rapuh saat refactor.
  **Integration test = sweet spot** — cukup tinggi untuk correctness, cukup rendah untuk debug.
- E2E sedikit dan dikurasi ketat (jalur emas saja).
- **Stop mocking sebanyak mungkin**: setiap mock menghapus confidence integrasi.
  Pengecualian sah: email nyata / charge kartu nyata / hal berbahaya atau eksternal mahal.
- Debat persentase jenis test = distraction (Justin Searls). Yang langka: tim yang menulis
  test ekspresif, boundary jelas, cepat, reliabel, dan hanya gagal karena alasan berguna.

## 3. Kapan test DITULIS dulu

- Regression test bug baru: **wajib sebelum fix** (protokol Agans R9 butuh reproduce;
  regression test adalah reproduksi permanen).
- Logika murni kompleks (parser, kalkulasi, state machine): test-first bagus.
- Prototype/eksplorasi domain: TUNDA test sampai desain stabil (grug: tolak "first test"
  sebelum paham domain).
- YAGNI juga berlaku untuk test: satu check runnable (assert/skrip) > suite formal
  untuk skrip sekali pakai.

## 4. Ritual verifikasi sebelum klaim selesai

1. Temukan command resmi project (package.json scripts / Makefile / AGENTS.md).
2. Jalankan lint + typecheck + test. Laporkan ANGKA hasilnya, bukan perasaan.
3. Tidak ada infra test? Tulis check minimal runnable untuk logika non-trivial.
4. Bug fix: bukti reproduce gagal → fix → lulus → remove fix → gagal lagi → final.
5. Baca ulang diff sendiri sebagai reviewer asing (skill `code-review`).

## 5. Anti-pattern testing

| Anti-pattern | Kenapa buruk |
|---|---|
| Test nempel implementasi (mock segalanya) | pecah tiap refactor → orang matikan test |
| Mengejar coverage % | test kosong tanpa assert bermakna |
| Snapshot test segala hal | lulus otomatis, tak mendeteksi regresi perilaku |
| E2E untuk semua jalur | lambat, flaky, dirawat malas |
| Test tanpa nama perilaku jelas | gagal = tidak tahu apa yang rusak |
