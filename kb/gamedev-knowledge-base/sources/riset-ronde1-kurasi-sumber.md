# Catatan Riset Game Dev — Ronde 1 (kurasi sumber)

> Tanggal akses: 2026-08-28 (semua diakses kembali saat riset). Catatan mentah,
> versi diringkas; detail kuat ada di file KB.

## GitHub

- **`Calinou/awesome-gamedev`** (github.com/Calinou/awesome-gamedev) — daftar terkurasi
  resource gamedev (engines, libraries, tools, tutorials, free assets). Di-maintain
  Calinou (kontributor Godot). Fokus pada alat/bahan, bukan katalog project game.
- **`FronkonGames/Awesome-Gamedev`** (github.com/FronkonGames/Awesome-Gamedev) —
  kumpulan tema: AI, Procedural Generation, Networking, Performance, DSB. Per-domain.
- **`Trilarion/opensourcegames` / OpenSourceGames 4.400+** (github.com/Trilarion/opensourcegames) —
  database game open-source dengan metadata (status, lisensi, genre, platform).
  Repo-nya adalah indeks (bukan codebase untuk dipelajari).

## itch.io

- Filter tag `open-source`: **2.683+ hasil** (itch.io/games/tag-open-source).
- Contoh populer: Mindustry (Java, open source), Friday Night Funkin'.
- Konvensi lisensi beragam (MIT/GPL/CC-BA), perlu cek per-game.

## Godot

- **`godotengine/godot-demo-projects`** (github.com/godotengine/godot-demo-projects):
  9.418+⭐, MIT, folder `2d/` & `3d/`. Branch `master` = Godot 4.x (versi lama di
  branch tag lain). Per-mekanik per-folder → paling bagus untuk belajar.
  - `2d/platformer`, `2d/topdown` (isometric + y-sort), `2d/screen_shake`,
    `2d/kinematic_character`, `3d/platformer`, `3d/` dll.
- **GDQuest**: `GDQuest/learn-gdscript` (2.756+⭐) kursus GDScript dari nol;
  `godot-open-rpg` project tutorial utuh.

## Unity

- **Unity Learn Microgame** (learn.unity.com): Karting / FPS / Platformer microgame,
  gratis, mulai ~35 menit. Update program berjalan.
- **Sample Unity 6** (rilis bersamaan Unity 6, 2024–2025; sample di Hub / repos org
  Unity): Megacity Metro (DOTS), Gem Hunter Match, Happy Harvest (farming),
  Boss Room (Netcode for GameObjects — multiplayer).
- Sistem baru yang dipakai sample: **Input System (new)**, object pooling, ScriptableObject
  data-driven.

## Unreal

- **Lyra Starter Game** — project resmi Epic sebagai referensi arsitektur AAA: modular
  (Gameplay Feature Plugins), data-driven Experience (mis. `LyraExperienceDefinition`),
  GAS (Gameplay Ability System), GameplayMessageRouter. Butuh akun Epic + source
  (EULA) + toolchain desktop. Cocok dibaca/dianalisa, bukan dijalankan di Termux.

## Kanal YouTube

- **Code Monkey** (unitycodemonkey.com): 800+ video Unity, gaya langsung-how-to,
  sering update pola.
- **Brackeys** (github.com/Brackeys): repos aktif; top languages = GDScript & C#;
  pindah fokus ke Godot sejak 2023.
- **GDQuest** (github.com/GDQuest): kurikulum Godot terstruktur; `learn-gdscript`,
  `godot-open-rpg`.
- **Sebastian Lague** (github.com/SebLague): `Pathfinding` seri A* (10 episode),
  Slime Simulation, Chess (C#).

## Raylib

- raylib.com — library C; **120+ contoh** di halaman examples (tiap contoh runnable
  dalam satu mekanik); **binding 60+ bahasa**; lisensi **zlib**.
- Prinsip: explicit, no hidden deps, "always works" (developer raylib-ray 4.x makin
  produktif; contoh `core_basic_window`, `core_input_mouse`, `core_2d_camera`, dll).

## OpenGL

- **learnopengl.com** — buku online modern OpenGL (core-profile). Repo
  `JoeyDeVries/LearnOpenGL`. Bab: Getting Started (window, triangle, shader),
  Coordinate systems (MVP), Lighting, Advanced (shadow), PBR/IBL.
- Di Termux bisa pakai paket `glfw` (klone repo, bangun sample).