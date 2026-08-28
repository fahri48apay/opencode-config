# 🎮 Game Development Knowledge Base

> Hasil riset mendalam tentang membuat game 2D dan 3D — dari kurasi sumber (GitHub,
> itch.io, engine sample, kanal YouTube, Raylib, OpenGL) + prinsip pemrograman game
> klasik (game loop, design patterns, ECS, game AI, networking, game feel).
> Terakhir diperbarui Agustus 2026.
> Disusun agar agent `game` (dan manusia) punya peta sumber terverifikasi + cara
> praktis membedah kode game nyata. Bahasa komunikasi: Indonesia.

## Cara pakai knowledge base ini

| Situasi | Buka file |
|---|---|
| Bingung mulai dari mana, mau lihat peta semua sumber | `01-peta-sumber-belajar.md` |
| Mau baca & membedah kode game open-source | `02-github-sumber-kode.md` |
| Mau cari game open-source yang bisa dibedah / dimodifikasi | `03-itch-io.md` |
| Game engine utama user (Godot di Termux) — demo resmi 2D/3D | `04-godot-samples.md` |
| Alternatif engine — sample Unity gratis (Microgame, Unity 6) | `05-unity-samples.md` |
| Alternatif engine — sample Unreal Lyra (shotokan arsitektur AAA) | `06-unreal-lyra.md` |
| Belajar lewat video — Code Monkey, Brackeys, GDQuest, Sebastian Lague | `07-kanal-youtube.md` |
| Ingin ngerti engine dari bawah / library C C-like (Raylib) | `08-raylib-low-level.md` |
| Jalur 3D / game programming serius (OpenGL/LearnOpenGL) | `09-learnopengl-3d.md` |
| Jalur belajar 2D → 3D untuk proyek user di `~/games/*` (+Termux) | `10-jalur-belajar-2d-3d.md` |
| Prinsip pemrograman game lintas engine & genre | `11-prinsip-dan-domain-pemrograman-game.md` |

## Peta sumber → peran

```
PETA & KURASI (temukan)
├── awesome-gamedev (Calinou) + Awesome-Gamedev (FronkonGames) ── daftar terkurasi
├── opensourcegames (Trilarion) ── 4.400+ game open-source katalog
└── itch.io tag open-source ── 2.683+ game, bisa di-download & dibedah

SAMPLE ENGINE (baca kode engine resmi)
├── godot-demo-projects ── 9.400+⭐ demo 2D/3D resmi Godot (MIT)
├── Unity Learn Microgame + sample Unity 6 ── gratis, struktur project nyata
└── Unreal Lyra ── arsitektur AAA: Gameplay Feature, GAS, data-driven experience

TUTORIAL VIDEO (belajar konsep & ekspektasi)
├── Code Monkey ── 800+ video Unity, fokus kebenaran teknis bukan hype
├── Brackeys ── repo Godot + Unity (pindah ke Godot sejak 2023)
├── GDQuest ── kurikulum terstruktur Godot, learn-gdscript
└── Sebastian Lague ── eksplorasi mendalam (A*, slime sim, chess)

DARI BAWAH (paham cara kerja)
├── Raylib ── library C, 120+ contoh, "selalu berfungsi" tanpa boilerplate
└── LearnOpenGL ── buku online modern OpenGL, jembatan ke seluruh engine

PRINSIP & DOMAIN (kenapa + teknik)
├── Game Programming Patterns (Nystrom) ── pola desain khusus game
├── Fix Your Timestep (Gaffer/Glenn Fiedler) ── game loop & determinisme
├── Juice It or Lose It (GDC 2012) ── game feel & polish terukur
├── Red Blob Games (Amit Patel) ── math: grids, pathfinding, procedural
├── Game AI ── FSM, behavior tree, GOAP, utility AI
├── Fast-Paced Multiplayer (Gabriel Gambetta) ── prediction, interpolation, lag comp
└── ECS / Data-Oriented Design ── Unity DOTS & seluk-beluk performa

ASET (biaya rendah) ── Kenney (CC0), OpenGameArt, lisensi CC0 vs CC-BY
```

## Workflow riset yang disarankan

1. Definisikan masalah dulu ("perasaan kontrol lompat asi di platformer") → buka file
   KB yang relevan (mis. `11` untuk game loop/juice, `04` untuk sample) → baru baca
   `sources/` bila butuh rumusan lengkap.
2. Saat memberi rekomendasi: kutip file KB-nya (mis. "GKB 04 · godot-demo: ini cara
   Godot resmi bikin coyote time").
3. Sumber mentah semua ada di `sources/` (header berisi URL + tanggal akses + verifikasi).

## File index

- `01-peta-sumber-belajar.md` — peta kategoris semua sumber + biaya/target/format
- `02-github-sumber-kode.md` — awesome list, OSGL, cara memilih & membedah repo game
- `03-itch-io.md` — tag open-source, filter, konvensi lisensi, cara eval kualitas
- `04-godot-samples.md` — godot-demo-projects: demo 2D/3D unggulan + cara jalan di Termux
- `05-unity-samples.md` — Microgames gratis + sample Unity 6 + catatan lisensi & sistem
- `06-unreal-lyra.md` — Lyra starter game: arsitektur, prasyarat, apa yang bisa dipelajari
- `07-kanal-youtube.md` — Code Monkey, Brackeys, GDQuest, Sebastian Lague + video kunci
- `08-raylib-low-level.md` — Raylib vs engine, contoh, binding, kapan cocok
- `09-learnopengl-3d.md` — jalur belajar GL modern + jembatan ke engine 3D
- `10-jalur-belajar-2d-3d.md` — roadmap praktis for proyek user (`~/games/*`) di Termux
- `11-prinsip-dan-domain-pemrograman-game.md` — game loop, patterns, ECS, math, AI, juice, multiplayer, aset
- `sources/` — catatan mentah riset ronde 1 & 2 (lihat `sources/README.md`)