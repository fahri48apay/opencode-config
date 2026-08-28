# 04 — Godot: godot-demo-projects (sample resmi)

> Repo `github.com/godotengine/godot-demo-projects` adalah koleksi demo resmi Godot
> yang ditulis/di-review maintainer. Ini "cara kanonik" Godot bikin mekanik tertentu.

## Fakta yang terverifikasi

- **9.418+⭐**, status aktif (update reguler mengikuti rilis Godot).
- Folder `2d/` dan `3d/` — demo terpisah per engine, mudah dicari.
- Branch **`master` = Godot 4.x** (versi lama tersimpan di branch/commit lain).
- **Lisensi MIT** — bebas dibedah, ditiru, dan dipakai aset/codenya.
- Yang penting untuk user: semua demo terorganisir mini — tiap folder = 1 mekanik
  (platformer `2d/platformer`, top-down `2d/topdown`, dsb.), bukan satu project besar.

## Demo 2D unggulan untuk dibedah

| Folder | Mekanik yang dipelajari |
|---|---|
| `2d/platformer` | move-and-slide, jump buffer, coyote time, double jump |
| `2d/topdown` | isometric + sorting y-sort |
| `2d/portal` | rendering portal (teknikan perspektif) |
| `2d/finite_state_machine` / `character_body_2d` | state machine dari karakter |
| `2d/kinematic_character` | `CharacterBody2D.move_and_slide()` vs kinematic body |
| `2d/screen_shake` | screen shake (game feel!) |
| `3d/platformer` | CharacterBody3D, camera follow, coyote parallax |

## Cara jalan di Termux

Godot headless bisa diinstall di Termux (paket `godot` tersedia di repos
termux-root/community) — demo project cukup `godot --path <folder>`. Untuk menjalankan
dengan window di HP, pakai X11 (termux-x11) atau wayland; verifikasi langkah pastinya
di `~/games/*` karena user sudah punya Godot 4.7 aktif.

Catatan: renderer default Godot di project user = `gl_compatibility` (lihat
`project.godot`), cara paling ringan untuk HP. Demo 3D yang butuh Vulkan kadang perlu
renderer `mobile` di project settings — cek `rendering/renderer/rendering_method`.

## Workflow belajar per mekanik

1. Buka folder demo → run → mainkan, amati feel-nya secara nyata.
2. Baca scene `.tscn`: node apa saja, hirarkinya (Player > Sprite > Collision, dst).
3. Baca script GDScript: 
   - `_physics_process()` untuk physics & gerakan; `_process()` untuk visual.
   - cari idiom: `move_and_slide()`, `Input.is_action_pressed`, timer untuk buffer.
4. Ubah 1 angka (Jump Height / Gravity) → jalankan → bandingkan feel. Ini latihan
   game feel yang paling cepat.

## Kaitan ke proyek user

user sudah punya `~/games/cool-platformer/` dan `~/games/tap-sprint/`. Saat bikin
mekanik serupa (lompat, gerak player), bandingkan struktur plotnya dengan demo resmi:
- apakah menggunakan `CharacterBody2D` + `move_and_slide()` dan bukan logika manual?
- apakah input action terdefinisi di `project.godot` (InputMap) atau inline keycode?
- apakah gravity & jump values dikonsentrasi di satu tempat (export vars)?

Lapis terakhir: tulis ulang satu mekanik dari nol mengacu demo, bandingkan diff.

## Checklist singkat

- [ ] Clone godot-demo-projects (shallow: `git clone --depth 1`)
- [ ] Pilih 1 demo 2D relevan dengan proyekmu (mis. platformer/topdown)
- [ ] Run → baca `.tscn` → baca script → ubah 1 angka
- [ ] Bandingkan dengan struktur proyekmu sendiri di `~/games/*`