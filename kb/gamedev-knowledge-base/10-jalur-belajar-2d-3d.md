# 10 — Jalur Belajar 2D → 3D (untuk proyek user)

> Roadmap praktis untuk developer Godot di Termux: dari proyek 2D yang ada
> (`~/games/cool-platformer/`, `~/games/tap-sprint/`) ke 3D. Engine = **Godot 4.7**,
> renderer `gl_compatibility`, dijalankan di HP.

## Status user (terverifikasi)

- **`~/games/tap-sprint/`** — project.godot: Godot 4.7, `gl_compatibility`, main
  scene `scenes/main.tscn`, input map (jump: Space/W/A + mouse/touch), stretch
  `canvas_items` aspect expand. Ada `export_presets.cfg` (sudah pernah setup export).
- **`~/games/cool-platformer/`** — Godot 4.7, ada `scenes/`, `scripts/`, `tilesets/`,
  `assets/`. Belum ada `export_presets.cfg`.
- Environment: **Termux (Android)** — GODOT headless/x11, no gamepad, budget optim.

## Fase 1 — Fondasi mekanik (2D, 2–4 minggu)

Diperkuat lewat bedah demo resmi (file 04) + praktik di proyek:

1. **Movement & feel** (di `cool-platformer`):
   - `CharacterBody2D.move_and_slide()` + gravity tersentralisasi (export vars).
   - Jump buffer + coyote time (praktik: input action map di project.godot).
   - Varibles & math kecil (lerp) untuk akselerasi/berhenti.
2. **State machine**: idle / run / jump / double-jump / wall-slide — State pattern (`11`).
3. **Camera & screen shake** (game feel, contoh `2d/screen_shake` di demo):
   - camera lerp, clamping, shake. Evaluasi feel dengan mengubah 1 parameter lalu mainkan.
4. **Scoring & restart** loop (dipakai untuk `tap-sprint`).

## Fase 2 — Prototipe & polish (2–4 minggu)

1. **Jadikan game "lengkap" kecil**: menu, skor tinggi, sfx/musik, particles
   (dampak, jump, dust) — belajar "Juice It" (file 11 · game feel).
2. **Latihan wawasan arsitektur**: pisahkan konfig angka (gravity, speed, dsb.) ke
   `Resource` atau `@export var` — jangan hardcode.
3. **Beda "feels good" dari "feels broken"**: uji tiap perubahan 1 parameter; catat
   sebelum/sesudah. (Cara tercepat: `@export_range` di editor → mainkan → tune.)

## Fase 3 — Menjembatani ke 3D (4–8 minggu)

Godot 3D menggunakan konsep yang sama dengan 2D tapi dengan **transform 3D** dan
**camera**:

1. Kerjakan demo `3d/` di godot-demo-projects (mis. `3d/platformer`).
2. Pelajari konsep **transform (position/rotation/scale) & camera** lewat file 09
   (LearningOpenGL: koordinat & MVP) — pahami asal-usul, lalu lihat bagaimana Godot
   menyederhanakan.
3. Buat prototipe 3D minimal: sphere roll + kamera follow + target pick-up.
   (Pakai geometri primitif; asset nanti.) Renderer `gl_compatibility` mendukung 3D
   dengan budget cukup.
4. **Highlight di sini (Termux)**: FPS & baterai terbatas — ukur menggunakan
   Godot profiler; target 60fps; kurangi mesh & limiter lights.

## Checklist milestone

- [ ] `cool-platformer`: movement + jump buffer + coyote time selesai
- [ ] `tap-sprint` (score/restart loop) → export & diuji di HP
- [ ] 1 prototipe "lengkap" kecil (menu + skor + sfx + particles)
- [ ] Bedah 1 demo 3D Godot + paham camera/transform
- [ ] Prototipe 3D: sphere roll + pick-up, 60 fps di HP

## Prinsip pendamping (dari KB lain)

- **Fokus 80/20** (KB coding 01): selesaikan 1 mekanik selesai daripada 5 setengah.
- **Game feel adalah loop: value → play → adjust**; tidak ada nilai "benar" universal.
- **Jangan deep-dive ke Lyra/ECS sebelum fondasi 2D matang.** (KB coding grug:
  kompleksitas menunggu masalah nyata.)