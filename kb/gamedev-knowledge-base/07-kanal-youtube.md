# 07 — Kanal YouTube

> Empat kanal yang dipelajari saat riset: Code Monkey, Brackeys, GDQuest, Sebastian
> Lague. Tiap kanal beda sudut: production-value tinggi, kurikulum terstruktur, dan
> eksplorasi mendalam.

## Code Monkey (unitycodemonkey.com)

- **800+ video Unity**; gaya = tutorial langsung ("how to"), sering meng-update pola
  ke versi Input System baru.
- Fokus: **kebenaran teknis & practice**, bukan hype. Sering ada update video
  "cara lama vs cara baru".
- Cara pakai: search di channel untuk mekanik spesifik (platformer/jump/UI); tonton
  bagian penyetupannya, lalu baca kodenya di pastebin/website (tautan di deskripsi).

## Brackeys (github.com/Brackeys)

- Kanal legendaris Unity; sejak 2023 pindah visibilitas ke **Godot** (repo GitHub
  mereka sangat aktif: top languages = GDScript + C#).
- Repo GitHub berisi project mini per video → bagus untuk di-clone & dibedah.
- Nilai utama: **rasa "room temperature"** — penonton baru paham, tapi kodenya solid.

## GDQuest (github.com/GDQuest)

- Kanal Godot murni, kurikulum terstruktur (bukan per-mechanic acak).
- Repo kunci: **`GDQuest/learn-gdscript`** (2.756+⭐) — kursus GDScript dari nol:
  variabel → fungsi → objek → nodes.
- Ada **`godot-open-rpg`** — project "open game" yang ditulis tutorial-demi-tutorial
  (membedah RPG: inventory, combat, dialog).
- Cara pakai: mulai dari `learn-gdscript` untuk latihan GDScript serius, lanjut
  `godot-open-rpg` untuk melihat project *utuh* (bukan sample per-mekanik).

## Sebastian Lague (github.com/SebLague)

- Eksplorasi mendalam satu topik per seri; bukan rutin tutorial.
- Seri unggulan: **Pathfinding/A\*** (`SebLague/Pathfinding`, 10 episode), **Slime
  Simulation**, **Chess** (C#), **Coding Adventures**.
- Nilai: belajar meneliti & memvisualkan — kebiasaan membaca kode orang (github di
  repo-nya), bukan speed demo. Cocok untuk mindset "pahami dulu, lalu tulis".

## Tabel pembanding

| Kanal | Engine | Gaya | Terbaik untuk |
|---|---|---|---|
| Code Monkey | Unity | Tutorial langsung | Praktek mekanik spesifik |
| Brackeys | Godot + Unity | Pendahuluan ramah | Memulai, struktur project |
| GDQuest | Godot | Kurikulum | Kedalaman GDScript & project utuh |
| Sebastian Lague | — (C#/Godot) | Eksplorasi mendalam | Pemahaman fundamental (A*, sim) |

## Kerja yang disarankan

1. Pilih 1 seri yang relevan dengan proyek user (platformer di Godot) —
   mis. GDQuest `godot-open-rpg` atau seri Godot Brackeys.
2. Tonton 1 episode, catat konsep + nama method/class yang muncul.
3. Clone repo pendamping, bedah 1 mekanik (pakai langkah file 02).
4. Repeat per episode — jangan menonton 20 episode tanpa memegang keyboard.

## Checklist singkat

- [ ] Pilih kanal & seri relevan dengan proyek Godot
- [ ] 1 episode → catat konsep + method → bedah repo-nya
- [ ] Ulangi maksimal 1 seri per minggu (fokus > banyak)