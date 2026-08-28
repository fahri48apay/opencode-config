# 06 — Unreal Lyra (starter game)

> Lyra adalah project sementara (starter game) resmi Unreal Engine untuk demo
> praktik-praktik AAA Epic: berpikir data-driven, modular, dan multiplayer.
> Berat & memerlukan toolchain; dilihat sebagai referensi arsitektur, bukan untuk
> dijalankan di Termux.

## Apa uang dibebankan

- **Barangnya gratis** (Unreal Starter Content/Launcher) — tapi **wajib punya akun
  Epic Games & project source build** (source dari GitHub diva dengan EULA Epic).
- **Berat**: butuh PC desktop (Windows/Linux/Mac) dengan disk besar + Epic Games
  Launcher untuk download source + engine binary. **Tidak cocok dijalankan di Termux/**
  HP — ini referensi baca, bukan runtime harian.

## Arsitektur inti yang dipelajari

| Konsep | Peran |
|---|---|
| **Gameplay Feature Plugins** | feature = modular plugin; aktif/nonaktif dikombinasikan per mode |
| **LyraExperienceDefinition** | data asset yang "menata" seluruh aktivasi content (bots, pawn, camera, ability) — satu asset, bukan hardcode di C++ |
| **GAS (Gameplay Ability System)** | sistem ability/data-driven dari Epic: efek, abilitas, attribute; polanya overkill untuk game kecil |
| **Data-driven dulu, kode belakan** | konfig intern tampil sebagai data asset (tidak ditulis hardcode) |
| **GameplayMessageRouter** | komunikasi antar-sistem tanpa coupling kaku |

## Nilai belajar bagi developer kecil (Godot)

Jangan menyalin arsitektur Lyra ke project kecil — itu over-engineering (lihat
KB coding `01-prinsip-engineering.md` · grug). Tapi ekstrak **hasil belajar**:

1. **Desain konfig sebagai data asset** ≠ kebiasaan Godot (export var / Resource).
   Pikirkan: kapan jumlah karakter/mode naik, pisahkan konfig ke `Resource`.
2. **Modularity per-mode**: mode permainan ≠ satu skrip raksasa. Pisahkan "aturan
   permainan" (rules) dan "konten" (scene/asset) — LyraExperienceDefinition ≈
   Godot `Resource` + `MultiplayerSynchronizer` dibaca sebagai paradigma yang sama.
3. **Konsep ability/cooldown/buff** lebih mudah ditiru dengan state machine + timers
   di Godot, bukan sistem GAS utuh.

## Cara membaca Lyra tanpa menjalankan

- Buka folder dokumentasi resmi Lyra di docs.unrealengine.com (search "Lyra sample").
- Pahami flowchart: Experience → GameMode → PlayerState → Pawn/Controller.
- Baca 1 file `.cpp` kecil (mis. `LyraExperienceComponent`) dan lihat bagaimana ia
  memilih data asset berdasarkan tags — bukan barisnya, tapi keputusan desain-nya.

## Checklist singkat

- [ ] Pastikan punya akun Epic & toolchain desktop (lebih dari cukup)
- [ ] Baca arsitektur data-driven Lyra (Experience + GAS + plugins)
- [ ] Ekstrak 3 pelajaran yang bisa ditransfer ke proyek Godot
- [ ] JANGAN coba menjalankan Lyra di Termux (fokus baca & bandingkan)