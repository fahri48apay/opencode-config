# 09 — LearnOpenGL (jalur 3D)

> LearnOpenGL (learnopengl.com) adalah kursus online modern **OpenGL core-profile**
> (not legacy). Ini jembatan dari "mengirimkan model" ke "mengerti apa yang engine
> buat saat render 3D".

## Fakta yang terverifikasi

- Situs: **learnopengl.com** — buku gratis, belajar dengan membaca + praktik.
- Repo GitHub: **`JoeyDeVries/LearnOpenGL`** — semua contoh & fragment shading code.
- Lisensi sumber: bebas dipelajari; kode contoh dirilis untuk dipakai (baca LICENSE
  repo untuk aturan tepat — umumnya contoh bebas dipakai sekolah/pribadi).
- Cakupan: modern core-profile (shader berbasis GLSL), bukan "fungsi tetap lama"
  (glBegin/glEnd) yang sudah deprecated.

## Peta bab yang penting

| Bagian | Isi | Nilai eksternal |
|---|---|---|
| Getting Started | window, triangle, shader | pahami pipeline render minimal |
| Coordinate systems | model-view-projection, camera | paham transform — dipakai semua engine |
| Lighting | phong/lighting models | dasar material & karakter |
| Advanced | framebuffer, shadow mapping | efek; shadow & tangent space dasar untuk 3D |
| PBR/IBL | physically-based rendering | paham gambar modern (render di Godot/Unity) |

## Cara mengambil keuntungan (bukan menyalin)

1. **Jangan baca semua bab** — targetkan 3 bab dasar (Getting Started, Coordinate
   systems, Lighting) lalu pilih 1 advanced (shadow).
2. **Jalankan contoh yang sudah jadi** di repo (kompilasi C++ biasanya butuh
   GLFW/GLAD — di Termux bisa pakai paket `glfw` dan develop dengan X11/termux-x11
   atau bahkan oleh karena `gl_compatibility` renderer Godot).
3. **Tulis ulang 1 contoh** dari nol tanpa menyalin — cara tercepat menyerap.
4. **Hubungkan ke Godot**: setelah paham MVP dan lighting, error "model pink/gelap"
   di Godot (material/shaders) langsung masuk akal: itu shader yang tidak menerima
   normal/texture dari model, dst.

## Kapan tidak perlu

- User sudah pakai Godot dengan aset dari Kenney (lihat file 11) — tidak perlu
  OpenGL untuk *membuat game*. OpenGL penting sebagai *landasan* baca error & struktur
  pipeline 3D, dan kalau ingin membuat engine/tools sendiri.
- Untuk belajar 3D gameplay (bukan rendering), Godot 3D demo (file 04) lebih relevan.

## Checklist singkat

- [ ] Kerjakan 3 bab dasar (Getting started → coordinate systems → lighting)
- [ ] Kompilasi & jalan contoh dari repo (atau lewat web editor)
- [ ] Tulis ulang 1 contoh dari nol
- [ ] Bandingkan dengan Godot 3D: paham transform & shader