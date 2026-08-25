# 06 · Debugging: Metodologi Sistematis

> Sumber utama: `sources/agans-nine-rules.md` — David Agans, *Debugging: The 9 Indispensable
> Rules...* (AMACOM 2002). Pelengkap: grug (logging, race condition), Tar Pit (state),
> KB `01-prinsip-engineering.md`.

## 9 Rule Agans (diterapkan ke cara kerja agent)

| # | Rule | Terjemahan praktis |
|---|---|---|
| 1 | **Understand the System** | Baca dulu kode/docs sebelum menebak. "Don't guess. Look it up." Kenal batas tool-mu (debugger buta timing; log buta state internal). |
| 2 | **Make It Fail** | Reproduksi reliable SEBELUM memperbaiki. Bug intermitten → kontrol faktor acak, bandingkan run bagus vs jelek. "That can't happen" = tanda kamu belum paham. |
| 3 | **Quit Thinking and Look** | Berhenti berteori, MULAI MENGAMATI. Tebakan hanya untuk mempersempit pencarian, bukan kesimpulan. Sadari instrumen mengubah perilaku (efek Heisenberg). |
| 4 | **Divide and Conquer** | Binary search masalahnya: injeksi pola/log di tengah alur data, cari sisi upstream/downstream yang salah. Mulai dari sisi yang rusak. Fix "noise" dulu (race, uninitialized). |
| 5 | **Change One Thing at a Time** | Rifle, bukan shotgun. Back-out perubahan yang tidak menolong SEGERA. Tanya: "what changed since it worked?" |
| 6 | **Keep an Audit Trail** | Catat apa, urutan, hasil — terutama saat percobaan banyak. Catatan agent: todo list + NOTES.md adalah audit trail-nya. |
| 7 | **Check the Plug** | Question assumptions paling dasar: colokan nyambung? file benar? build terbaru yang jalan? Test TOOL-nya juga (gauge bisa macet). |
| 8 | **Get a Fresh View** | Laporkan GEJALA, bukan teorimu (jangan racuni sudut pandang helper/subagent). Setelah ±30 menit mentok → minta fresh eyes / mulai context baru. |
| 9 | **If You Didn't Fix It, It Ain't Fixed** | Protokol emas: gagal → fix → hilang → REMOVE FIX → muncul lagi → apply final. Verifikasi di kondisi kegagalan eksak. "Kalau tak tahu kenapa sekarang jalan, kemungkinan besar belum." |

## 3 Kesalahan debugging paling umum agent

1. **Mengubah banyak hal sekaligus lalu klaim berhasil** → langgar R5+R9.
   Satu perubahan, satu verifikasi.
2. **Memperbaiki gejala tanpa root cause** → guard di tiap caller alih-alih fungsi bersama;
   try/catch yang menelan error. Grep semua pemakai sebelum patch.
3. **Berteori panjang tanpa menjalankan apa pun** → langgar R3.
   Satu print/log/test > lima paragraf hipotesis.

## Praktik logging (ala grug)

- Log semua branch mayor + request ID lintas layanan.
- Log level dinamis (bisa dinaikkan saat insiden), per-user/per-module.
- Error dicatat dengan context (input, state) — tapi JANGAN pernah log secret
  (lihat KB `05-keamanan.md`).

## Hubungan dengan kompleksitas

Bug favorit lahir dari **mutable state** (Tar Pit): tiap bit state menggandakan ruang
kemungkinan. Saat debugging state asing:
- Cetak snapshot state pada titik-titik kunci (R3: look, don't think).
- Kurangi variabel bebas: hardcode input yang dikontrol sampai gagal ter-reproduce,
  baru lepaskan satu per satu (R4 divide & conquer).

## Ritual debug agent

```
1. Reproduksi (R2)          → command/langkah persis + output error PERSIS
2. Hipotesis ≤2 kalimat (R3)
3. Eksperimen SATU variabel (R5) → observasi
4. Ulangi 2–3 sampai root cause ketemu
5. Fix root cause → verifikasi protokol emas (R9)
6. Regression test untuk bug tsb (KB 03 §3)
```
