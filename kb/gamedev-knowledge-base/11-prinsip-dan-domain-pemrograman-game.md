# 11 — Prinsip & Domain Pemrograman Game

> Ringkasan praktis hasil riset ronde 2: prinsip lintas engine dan genre. Tiap bagian
> berisi "kenapa penting" + "cara menerapkan di Godot/GDScript".
> Detail lengkap & kutipan di `sources/`.

## 1. Game loop & "Fix Your Timestep"

Sumber: **Glenn Fiedler, "Fix Your Timestep!"** (gafferongames.com, 2004) — esai paling
dikutip soal game loop. Inti:

- Game loop ideal = **fixed timestep untuk update logika + variabel untuk render**.
- Jangan jalankan update di tick yang langsung mengikuti framerate (jitter, physics
  tak stabil). Solusi klasik:
  1. Akumulasi waktu (`accumulator += delta`) dan jalankan hop update sebesar
     `dt` tetap (mis. 1/60) berulang.
  2. Radius interpolasi untuk state antara dua tick bila perlu rendering.

Di Godot:
- `_physics_process(delta)` sudah fixed timestep (default 60Hz, set di
  ProjectSettings `physics/common/physics_ticks_per_second`) — ini separuh pekerjaan.
- `_process(delta)` untuk visual (animasi, UI) — bisa langsung pakai delta.
- **Jangan menaruh logika movement berat di `_process`** (variabel frame) kalau butuh
  konsistensi physics — Godot node physics memakai `_physics_process`.
- Pelajaran transfer: kalau nanti pakai Raylib (file 08) atau mesh engine lain, kamu
  harus menulis akumulator sendiri — penting karena determinisme networking (bagian 7).

## 2. Game Programming Patterns (Robert Nystrom)

Sumber: **gameprogrammingpatterns.com** (buku gratis online). Pola yang relevan:

| Pola | Kapan dipakai | Di Godot/GDScript |
|---|---|---|
| **State** | tokoh/entitas dengan mode berbeda (idle/run/jump) | `enum` + `match` di `_physics_process`, atau kelas state kecil |
| **Command** | remappable input / undo | Input action → perintah yang bisa dibatalkan (queue) |
| **Observer / Event** | sistem berkomunikasi tanpa saling kenal | **Signals** (built-in) — jangan rebuild manual |
| **Component** | entitas dengan banyak ability saling independen | Node anak + script per komponen |
| **Update** | banyak entitas di-update tiap frame | `_process` + object pooling (jangan instansiate tiap frame) |
| **Prototype** | menyalin konfig objek | `duplicate()` / Resource sharing |
| **SpatialHash / QuadTree** | banyak objek perlu cek collision | Optimasi opsional setelah profiler menunjukkan masalah |

Aturan pakai: selain "State" dan "Signals", jangan pasang pola sebelum ada masalah
nyata (lihat KB coding 01 · grug: kompleksitas = musuh).

## 3. ECS & Data-Oriented Design (Unity DOTS)

Sumber: dokumentasi Unity DOTS (Entities + Burst + Netcode) & konsep data-oriented.

- **ECS = Entity (id) + Component (data) + System (logic)** — pisahkan data dari
  perilaku; cocok untuk ribuan entitas.
- Unity DOTS memakai Burst compiler & struct layout; hasil: cache-friendly, deterministik.
- **Kapan ini bukan untuk kamu**: game kecil/interaktif (Godot scene-graph + physics
  node lebih produktif). DOTS/ECS relevan bila 10k+ entitas simulasi, skala MMO,
  atau determinisme ketat.
- **Yang bisa diambil di Godot 2D/3D**: pola "data terpisah dari kode" bisa
  diimplementasi ringkas dengan `Resource` + `@export` (lihat file 05 · data-driven),
  dan **object pooling** manual. Jangan mengejar ECS dulu — itu kompleksitas untuk
  masalah yang belum kamu punya.

## 4. Game Math & Pathfinding (Red Blob Games / Amit Patel)

Sumber: **redblobgames.com** + blog Stanford "Amit's Game Programming Information".
Konten utama:

- **Grids**: square / hexagonal / triangular; koordinat & offset; pilih yang tepat
  untuk tipe map (hex sering untuk strategy/wargame).
- **Pathfinding A\***: konsep open set / closed set, heuristik (Manhattan/Euclidean),
  & cara implementasi. Untuk map besar → hirarki (HPA\*, navmesh untuk kontinu).
- **Procedural generation** dasar: noise (Perlin), terrain gen, maze (cell
  automata dikombinasi dengan A\* di atas).

Penerapan sederhana:
- Godot punya **`AStarGrid2D` / `NavigationRegion2D`** — jangan tulis A\* manual
  sebelum butuh.
- Untuk prototipe procedural map: `FastNoiseLite` bawaan Godot.
- Kapan perlu memahami teori: saat `NavigationAgent2D` gagal di kasus spesifik
  (ketika saya butuh custom cost / obstacles dinamis).

## 5. Game AI

Tingkat keputusan dijabarkan sebagai hierarki (sederhana → kompleks):

1. **FSM (Finite State Machine)** — dingin (idle/chase/attack), gampang, cocok untuk
   musuh sederhana. Di Godot: state machine sederhana (lihat demo).
2. **Behavior Tree** — **selector/sequence/decorator/blackboard**; lebih fleksibel
   untuk AI dengan banyak interaksi; dipakai di industri (Unreal), ada addon Godot
   (`gtask` / behavior tree plugins).
3. **Utility AI** — memberi *skor* ke opsi (best scoring) — cocok untuk keputusan
   realistis / banyak faktor (pakai bobot matematis).
4. **GOAP (Goal-Oriented Action Planning)** — cari urutan aksi untuk capai goal
   (action ia preconditions/effects), mis. untuk NPC yang "murid" — overkill untuk
   project kecil.

Aturan praktis: **mulai dengan FSM**; naik ke behavior tree hanya ketika FSM
ribet (melebihi ~8 state dengan transisi). Utilitas AI > tree untuk balance gampang
numeric. Terakhir, **navigation ≠ AI**: kejar player pakai navigation (`AStarGrid2D`
/ `NavigationAgent2D`) + state, jangan hardcode patroli manual.

## 6. Game Feel / "Juice" (GDC "Juice It or Lose It")

Sumber: talk **Martin Jonasson & Petri Purho (2012)** — gdcvault.com/play/1016487
(youtube "Juice it or lose it" | GDC Vault). Prinsip yang paling viral:

- **Feel > correctness visual**: hal kecil (screen shake, particles, flash) membuat
  game feel hidup walau hitbox sama.
- Tool: **tween & easing**, freeze-frame (hitstop), screen shake, squash & stretch,
  floating score text, particles, screen flash, timing (anticipation & recovery).
- **Jangan "juice" berlebihan** — gunakan untuk aksi penting (hit, jump), bukan setiap
  detik; ada komedi & rhythm.

Di Godot:
- **`Tween`** (built-in, bahasa Godot 4.x): `tween.tween_property(...).set_trans(...)` —
  animasi timings tanpa state manual.
- **Camera shake**: blog/demo `2d/screen_shake` (godot-demo). Derajat shake
  harus dikontrol agar tidak pusing.
- **Hitstop**: `Engine.time_scale = 0.05` selama sejenak lalu pulihkan — trik termudah
  memberi impact tanpa script kompleks.
- **Particles**: `GPUParticles2D` (bawaan). Gunakan satu atau dua efek kunci.

## 7. Multiplayer & Networking

Sumber: **Gabriel Gambetta "Fast-Paced Multiplayer"** (gabrielgambetta.com) + Gaffer
(Fiedler).

Arsitektur dasar (tidak bergantung pada engine):

- **Client-server**: satu otoritas; client kirim input, server otoritatif.
- **Client-side prediction**: client menerapkan input lokal → visual responsif; server
  koreksi bila off.
- **Entity interpolation**: objek lawan tampil "maju" antara state yang diterima
  (render posisi di masa lalu = smooth).
- **Lag compensation**: server menolak input berdasarkan momen traveler — teknik
  ketat untuk FPS (raycast/melee).

Di Godot:
- Multiplayer bawaan: **`MultiplayerPeer` / `MultiplayerSynchronizer` / `MultiplayerSpawner`**
  — untuk seri belajar gunakan mode LAN pertama.
- **Kalau hanya "dua pemain lokal"** (coop atau versus di HP): cukup local input +
  banyak character, tanpa networking — pindah jaringan hanya jika butuh pemain di
  device berbeda (riset: mbak dulu "network physics" di Godot docs).
- Kunci belajar pada prototipe: **satu server otoritatif + client prediction** untuk
  movement sederhana; ini pola yang paling sering disalahpahami.

## 8. Aset (bebas lisensi)

Sumber: **Kenney.nl** (CC0 — dedicated public domain) & **OpenGameArt.org** (beragam
lisensi; filter CC0/CC-BY).

- **CC0** = bebas semua (komersial, tanpa atribusi). **CC-BY** = bebas, wajib atrisi.
  GPL (untuk aset) = bebas tapi turunan wajib share — hati-hati.
- Kenney: "classic" packs (platformer, space, UI) all CC0. Sempurna untuk prototipe.
- OpenGameArt: koleksi besar, filter `CC0` + tag (2D/3D/UI); cek licence di halaman
  (cc0 collection ada di situs).

Rekap penting untuk proyek user (Godot di Termux):
- Pilih aset CC0 (nyaman); CC-BY juga aman asal simpan kredit di `NOTICE`/README.
- Jangan menyalin aset ber-hak cipta (dari game populer) untuk dipublish.

## Ringkasan "kapan pakai apa"

| Domain | Mulai dari | Naik ke | Jangan sebelum ada masalah |
|---|---|---|---|
| Game loop | `_physics_process` Godot | akumulator manual (Raylib) | — |
| Arsitektur | signals + state | component pattern | ECS penuh |
| AI | FSM | behavior tree | GOAP |
| Path | `AStarGrid2D`/Navigation | custom cost | tulis A\* manual |
| Networking | LAN co-op | prediction + lag comp | full authoritative |