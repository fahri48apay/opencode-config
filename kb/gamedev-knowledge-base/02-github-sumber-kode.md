# 02 — GitHub: Sumber Kode

> Rute terstruktur untuk menemukan & membedah kode game open-source di GitHub.

## Repo kunci

- **`Calinou/awesome-gamedev`** (github.com/Calinou/awesome-gamedev) — daftar terkurasi
  resource games & gamedev (engine, library, tutorial, gratis). Bagus untuk menemukan
  alat, bukan untuk belajar struktur project.
- **`FronkonGames/Awesome-Gamedev`** (github.com/FronkonGames/Awesome-Gamedev) —
  katalog raksasa bertema per-domain: AI, procedural generation, networking,
  performance, dsb. Tiap section = topik engineering yang ingin dipelajari.
- **`Trilarion/opensourcegames`** (github.com/Trilarion/opensourcegames, alias OSGL) —
  database 4.400+ game open-source dengan metadata (status pengembangan, lisensi,
  genre, platform). Repo-nya adalah *data*, jangan melihatnya sebagai codebase untuk
  dibedah — tapi sebagai indeks: bisa `grep` untuk "dead" → game yang masih aktif, dst.

## Cara memilih game untuk dibedah

| Kriteria | Kenapa | Cara cek |
|---|---|---|
| Aktif (bukan abandonware) | belajar pola modern, issue dijawab | commit < 1 tahun, release terakhir |
| Issue/PR terbuka & aktif | komunitas hidup, belajar dari PR review orang | tab Issues/PR |
| Enginemu (Godot) | kode langsung relevan dengan `~/games/*` | Cari `project.godot` di root |
| Lisensi permissive (MIT) | bebas ditiru/dipelajari tanpa batas | Baca LICENSE |
| README jujur | tahu scope & batas project | Baca README bagian status |

Cara cepat cek engine dari GitHub browser: cari file `project.godot` (Godot),
`Assets/` + `.csproj` (Unity), `.uproject` (Unreal), `Makefile`/`CMakeLists.txt`
(pure C++/rust/raktor).

## Workflow membedah repo game (5 langkah)

1. **Baca README + LICENSE dulu** — scope, cara run, lisensi. Jangan baca kode belum.
2. **Struktur folder** — tarik kesimpulan architecture dari nama folder:
   `scenes/` + `scripts/` (Godot = scene-based), `Plugins/` + `Source/` (Unreal),
   `Assets/` + `Packages/` (Unity).
3. **Jalankan** — pahami dulu cara kerja aplikasi secara nyata; error di konsol saat
   interaksi = peta ke lokasi kode.
4. **Baca 1 mekanik** — ambil satu hal kecil (mis. input jump), telusuri dari
   input → state → world → feedback visual/audio. Satu fitur, end-to-end.
5. **Bandingkan dengan cerita yang sudah kamu tulis** — setelah buat fitur tipikal
   (gerakan player, lompat, koins), bandingkan strukturmu vs repo bagus. Itu moment
   belajar terbaik: "oh, mereka pisahkan State machine di sini".

## Anti-pola saat belajar dari repo

- Jangan baca file acak urutan GitHub (biasanya mulai dari `main`/utils — sesat).
- Jangan menyalin asset berlisensi CC-BY tanpa atribusi; CC0 boleh bebas.
- Jangan bedah game dengan 100k+ LOC "murni rekreasi" — sinyal kompleksitas vs nilai
  belajar. Pilih yang kompak: struktur jelas < 30k LOC.
- Repo sample (Godot demo / microgame) dibedah sebagai "cara kanonik"; repo indie
  dibedah sebagai "salah satu cara".

## Checklist singkat

- [ ] Tentukan engine target (Godot, karena proyekmu)
- [ ] Cari game aktif, kecil, MIT/ISC, engine Godot
- [ ] Baca README/LICENSE → struktur → jalankan → 1 mekanik end-to-end
- [ ] Baca ulang repo 2x dalam jarak 2 minggu (setelah bikin fitur sendiri)