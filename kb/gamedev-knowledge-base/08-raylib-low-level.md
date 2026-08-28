# 08 — Raylib (low-level)

> Raylib = library C untuk membuat game, bukan engine (tidak ada editor, scene graph,
> atau scripting). Dipelajari agar memahami apa yang engine lakukan di bawah kap —
> game loop, input polling, rendering, resource loading — dan untuk proyek kecil
> yang ingin kode minim tapi "jelas".

## Fakta yang terverifikasi

- Situs resmi **raylib.com** — library C dengan gaya "C99 + raymath".
- **120+ contoh** di halaman examples (masing-masing runnable, satu mekanik per contoh).
- **Binding 60+ bahasa** (list di raylib.com/bindings) — bahasa lain (Go, Rust,
  Python, Lua, zig) memakai binding ini, inti tetap C.
- Lisensi **zlib** — permissive, bebas untuk komersial & belajar.
- Prinsip desain: "no hidden dependencies", "everything is explicit", "always
  compiles/runs" — dirancang untuk pembuat game yang tidak mau lawan toolchain.

## Raylib vs engine (Godot/Unity/Unreal)

| Aspek | Raylib | Engine (Godot) |
|---|---|---|
| Editor visual | ✗ | ✓ (scene editor) |
| Game loop | Kamu tulis sendiri (`while !WindowShouldClose()`) | engine menyediakan (`_process`/`_physics_process`) |
| Input | polling eksplisit (`IsKeyPressed`) | input map + action abstraction |
| Physics | tidak built-in (pakai raylib + box2d manual) | PhysicsBody, Area, joints |
| Panel dekorasi | minimal | lengkap (animation, particles, audio, shader layer) |
| Ukuran/LOC | kecil & linear | besar, framework-y |
| Cocok untuk | Belajar cara kerja, prototipe cepat, jam / open jam | Proyek dengan mekanik kompleks, UI, assets, physics |

Kesimpulan: Raylib cocok untuk **belajar fundamental** dan **prototipe** (lihat seri
"Raylib examples" untuk memahami input/render/audio). Engine (Godot) dipakai untuk
proyek aktual user (karena scene management, editor, physics, dan asset pipeline
sudah tersedia).

## Workflow belajar dengan Raylib

1. Contoh pertama: `core_basic_window` → pahami siklus: init → loop (handle input →
   update → draw) → shutdown.
2. Contoh kedua: `core_input_mouse` → polling input eksplisit.
3. Contoh ketiga: `core_2d_camera` → kamera & transform (dasar sebelum grafik 3D).
4. Contoh 2D: `shapes_drawing_primitives` (membuat game pakai shapes geometri −
   tanpa art asset → fokus ke gameplay math).
5. Buat prototipe kecil: paddle bounce / breakout dengan rect + circle + collision
   manual. Ini mengajarkan apa yang engine (Godot 4.7) sembunyikan dari kamu.

## Kaitannya dengan Godot

Setelah paham "load→loop→render", error/behavior Godot lebih masuk akal:
- `_physics_process` adalah titik di mana kamu menempatkan game loop logika (GDScript
  lebih tinggi-level tapi konsep sama).
- Input map Godot ≈ poll `IsKeyPressed` dengan nama action.
- Konsep delta time (fix your timestep → file 11) langsung relevan: Raylib tidak
  punya `CharacterBody2D.move_and_slide()`; kamu hitung movement manual × delta.

## Checklist singkat

- [ ] Install raylib (paket termux `libraylib`) atau pakai web raylib examples
- [ ] Kerjakan 3 contoh pertama (window, input, camera)
- [ ] Buat 1 prototipe geometri (breakout / pong) manual
- [ ] Catat apa yang Godot sediakan sebenarnya vs manual