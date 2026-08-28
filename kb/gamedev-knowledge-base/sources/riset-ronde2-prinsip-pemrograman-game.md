# Catatan Riset Game Dev — Ronde 2 (prinsip & domain pemrograman game)

> Tanggal akses: 2026-08-28. Hasil riset online atas permintaan user: "riset juga
> secara online mengenai pemrograman dan pembuatan game". Inti: 8 domain + sumber.

## 1. Game loop & timestep

- **"Fix Your Timestep!"** — Glenn Fiedler (Gaffer On Games, gafferongames.com,
  diterbitkan 2004): kenapa memperbarui game pada frekuensi variabel (framerate)
  menghasilkan jitter dan fisika tidak stabil → pakai fixed timestep untuk update +
  interpolasi untuk render. Artikel paling berpengaruh untuk loop game serius.
- Fiedler juga menulis seri networking-level (lihat bagian 7).

## 2. Design patterns dim game

- **"Game Programming Patterns" — Robert Nystrom** (buku gratis,
  gameprogrammingpatterns.com). Relevan: State, Command, Observer, Prototype,
  Update, Component, Spatial Hash. Keindahannya berbasis contoh game (dipungut
  dari pengalaman AAA) — bukan pola GoF abstrak.
- Inti pesan: pakai pola ketika masalah nyata muncul, jangan pola dulu.

## 3. ECS & data-driven / DOTS

- **Unity DOTS** (dokumentasi) — Entities (ECS), Burst Compiler, Jobs, dan
  Netcode for Entities. Entity/Component/System, determinism, cache-friendly.
- Konsep data-oriented design (data terpisah dari behavior) untuk performa.
- Kesimpulan penerapan: untuk project kecil lebih baik scene-graph tradisional;
  ECS untuk 10k+ entitas.

## 4. Game math & grids

- **Red Blob Games — Amit Patel** (redblobgames.com): tutorial interaktif —
  grids (square/hex/trigonal), pathfinding A* & heuristik, procedural generation
  (noise), poisson disc, dsb. Standar de-facto untuk "interactive tutorial".
- Blog lama Stanford "Amit's Game Programming Information" (analog/visual/network),
  referensi klasik sejak 1990-an.

## 5. Game AI

- Hierarki keputusan: **FSM → Behavior Tree → Utility AI → GOAP**.
  - Behavior Tree: selector/sequence/decorator/blackboard; industri (Unreal); addon
    Godot tersedia (mis. `gtask`, behavior tree plugin).
  - Utility AI: scoring functions (bobot numerik) → pilih skor tertinggi.
  - GOAP: search aksi (preconditions/effects) untuk capai goal.
- **A\*** untuk pathfinding (pelengkap). Navigator engine (NavigationAgent/AStarGrid2D).

## 6. Game feel / Juice

- **GDC 2012 talk "Juice It or Lose It" — Martin Jonasson & Petri Purho**
  (gdcvault.com/play/1016487/Juice-It-or-Lose, versi di YouTube "Juice it or lose it"):
  demo game yang sama di-juice ulang → feel jauh lebih baik padahal mekanik sama.
  Item: screen shake, particles, squash & stretch, flash, floating text, hitstop,
  timing (anticipation/recovery). Hantu dari Ludum Dare yang "candy crush" semua.
- Godot: `Tween`, `Engine.time_scale` untuk hitstop, `GPUParticles2D`, camera shake
  (demo 2d di godot-demo-projects).

## 7. Multiplayer networking

- **Gabriel Gambetta, "Fast-Paced Multiplayer"** (gabrielgambetta.com/
  client-server-game-architecture.html + serial): client-server, client-side
  prediction, entity interpolation, lag compensation — pola dasar game
  online real-time.
- Glenn Fiedler (Gaffer On Games) networking series juga. Prinsip kunci:
  server otoritatif; client predict; interpolate entities lain.
- Godot: `MultiplayerPeer`, `MultiplayerSynchronizer`, `MultiplayerSpawner`,
  `MultiplayerAPI` (High/Scene level). LAN-first untuk belajar.

## 8. Asset gratis & lisensi

- **Kenney.nl** — asset CC0 (dedicated public domain), pack klasik: platformer,
  space, UI, audio. Semua commercial-use tanpa atribusi.
- **OpenGameArt.org** — komunitas; ribuan asset; filter `CC0`/`CC-BY`; koleksi
  "CC0 resources" tersedia. Perhatikan lisensi per-asset (CC0/CC-BY/GPL beda).
- Pendidikan lisensi: CC0 bebas total; CC-BY wajib kredit; GPL turunan wajib
  open (berisiko untuk publishing tertutup).

## Catatan: mengapa ini "domain" (bukan per-x)

Delapan domain di atas adalah blok belajar yang terpisah dari "cara pakai engine X".
Ilustrasi: memahami timestep membuat kamu bisa debug jitter; memahami prediction
membuat kamu paham kenapa lawan "melompat"; memahami juice membuat game kamu dibedakan.
Ini yang diintegrasikan ke file `11-prinsip-dan-domain-pemrograman-game.md`.