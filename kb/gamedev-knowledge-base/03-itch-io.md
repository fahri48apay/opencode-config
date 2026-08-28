# 03 — itch.io (tag open-source)

> itch.io adalah platform distribusi game indie. Filter tag **open-source** dipakai
> untuk menemukan game yang source-nya bisa diunduh & dibedah. Bagus untuk melihat
> game *selesai* (bukan demo maintainer) dengan berbagai skala.

## Fakta yang terverifikasi

- Filter `itch.io/games/tag-open-source` menampilkan **2.683+ game** (terverifikasi
  saat riset, Agustus 2026). Angka berubah seiring upload baru.
- Yang muncul di pencarian adalah game yang *ditandai* open-source & menyediakan
  download source (zip / link repo).
- Contoh populer hasil pencarian: Mindustry (open source, Java - game industri
  pertambangan), Friday Night Funkin', dsb.

## Fitur-filter yang berguna

| Filter | Nilai |
|---|---|
| Tag | `open-source` + genre (platformer, puzzle, dsb.) |
| Engine | Godot / Unity / lainnya (untuk relevant dengan `~/games/*`) |
| Sort | **Top rated** / **Most popular** (menandakan kualitas diterima komunitas) |
| Classification | Games (bukan tools/assets) |
| Browse | Desktop (agar bisa dirun di Termux via Xvfb/Wayland bila perlu) |

## Konvensi lisensi yang perlu diketahui

- Dua game bisa sama-sama "open source" tapi lisensi berbeda: **MIT/ISC/zlib** =
  bebas dipakai & ditiru tanpa atribusi; **GPL** = bebas dipakai tapi turunan wajib
  open-source juga; **CC-BY** = bebas dipakai wajib atribusi.
- Baca LICENSE di akar zip/repo sebelum menyentuh kode.
- Strip/screenshot JANGAN diambil dari game ber-NDA — cek halaman game untuk
  persetujuan penggunaan aset.

## Cara eval kualitas (sebelum download)

1. **Cek halaman**: screenshots & GIF `gif.gif` asli (bukan render) → ini gap
   "quality bar" yang nyata: game bagus menampilkan gameplay aktual.
2. **Cek rating & jumlah download** — ratusan download dengan rating bintang 5
   mengindikasikan fun; tapi bintang tidak menjamin *kode*-nya bagus.
3. **Cek tanggal update** — abandon 4 tahun = pola lama yang tidak wajib ditiru.
4. **Baca comment** (bisa mengindikasikan fitur rusak / crash yang belum diperbaiki).

## Workflow singkat

1. Filter itch.io open-source → sort Top Rated → pilih 1 yang paling kecil (LOC
   kecil lebih cepat dipahami).
2. Download source, unzip ke folder kerja (jangan di `~/games/` kalau proyek net).
3. Gunakan 5-langkah bedah repo (lihat file 02): README → struktur → run → 1 mekanik.
4. Bandingkan polanya dengan yang kamu baca di godot-demo-projects (file 04) —
   mana yang lebih rapi, dan mengapa.

## Batas & gotcha

- Game itch.io berskala indie: struktur belum tentu "kanonik" seperti demo resmi
  engine. Ambil sebagai sampel "salah satu cara yang berhasil", bukan standar.
- Sering asset bundel besar menyatu dengan source → repositori bisa berat; pilih yang
  menyediakan zip source terpisah.
- Beberapa game open-source hanya lisensi untuk source, aset visual/audio tetap
  copyright pencipta — cek licence turunan sebelum memakai assetnya.

## Checklist singkat

- [ ] Filter open-source + engine Godot + sort Top Rated
- [ ] Verifikasi lisensi (MIT/ISC/CC0 ideal untuk dipelajari)
- [ ] Download source, unzip ke folder kerja
- [ ] Run + bedah 1 mekanik end-to-end