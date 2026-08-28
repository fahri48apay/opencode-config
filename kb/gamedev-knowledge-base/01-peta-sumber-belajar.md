# 01 — Peta Sumber Belajar

> Ringkasan seluruh sumber dari KB ini dalam satu tabel. Detail tiap sumber di file-nya
> masing-masing. Gunakan tabel ini untuk memilih "mulai dari mana".

## Tabel keseluruhan

| # | Sumber | Kategori | Format | Biaya | 2D | 3D | Bahasa/kode | Gatekeeper |
|---|---|---|---|---|---|---|---|---|
| 02 | GitHub: awesome-gamedev, OSGL | Kurasi repo | Daftar | $0 | ✓ | ✓ | semua | — |
| 03 | itch.io tag open-source | Game jadi | Web game + source | $0 | ✓ | ✓ | banyak; Godot/Unity umum | perlu tahu GS/dev mode |
| 04 | godot-demo-projects | Sample engine | Repo Godot (GDScript) | $0 (MIT) | ✓ | ✓ | GDScript | Godot 4.x terpasang |
| 05 | Unity Learn Microgame + sample Unity 6 | Sample engine | Project Unity + kursus | $0 (lisensi Unity Personal) | ✓ | ✓ | C# | Unity Hub/Editor diinstall |
| 06 | Unreal Lyra | Sample engine | Project Unreal (C++/BP) | $0 | ~ | ✓ | C++ + Blueprint | Toolchain Epic + source build |
| 07 | Kanal YouTube | Video tutorial | Video | $0 | ✓ | ✓ | GDScript/C#/C++ | — |
| 08 | Raylib | Library low-level | Kode C | $0 (zlib) | ✓ | ✓ | C + binding 60+ bahasa | Tahu bahasa C/pemula |
| 09 | LearnOpenGL | Buku online | Web + repo | $0 | — | ✓ | C++/GLSL | Paham C++ dasar |
| 11 | Prinsip & domain | Konsep | Buku/web/talk | $0 | ✓ | ✓ | — | — |

## Rekomendasi berdasarkan tujuan

| Kalau kamu ingin… | Mulai dari |
|---|---|
| Lanjutin proyek Godot di `~/games/*` (tap-sprint, cool-platformer) | `04` + `10` + `11` |
| Tahu cara developer profesional menyusun project | `04` (Godot), `05` (Unity), `06` (Unreal) |
| Ngerti "kenapa game terasa enak" / kontrol & feel | `11` (juice, timestep) |
| Bikin game tapi belum pilih engine | `01` + `08` (bandingkan), lalu `04` untuk Godot |
| Belajar 3D serius / pengin jadi graphics programmer | `09` → `06` |
| Cari asset gratis legal | `11` (bagian aset) + OpenGameArt |
| Baca kode game orang lain yang utuh | `03` (game jadi) → `04` (sample resmi) |

## Catatan singkat tiap domain

- **Sample resmi > game fan-made** untuk belajar pola kanonik: demo Godot ditulis
  maintainer, Lyra ditulis tim Epic, sample Unity 6 ditulis tim Unity. Game opensource
  di itch.io lebih "nyata" tapi kualitasnya sangat bervariasi.
- **Engine utama user = Godot** (lihat `~/games/*`, project.godot pakai Godot 4.7,
  renderer `gl_compatibility` — penting: renderer mobile-friendly, cocok Termux/HP).
- **Jalur dari bawah** (Raylib/OpenGL) bukan pengganti engine, tapi pencerahan: setelah
  paham load-loop-render, error engine jadi mudah dibaca.
- **Biaya nyata** skill: Godot = GDScript + Godot API; Unity = C# + scene graph; Unreal =
  C++ + Blueprint + GAS. Pindah antar engine = pindah API, bukan pindah konsep.