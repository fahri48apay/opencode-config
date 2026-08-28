# 05 — Unity: Microgames & Sample Unity 6

> Alternatif engine — baca cara tim Unity menyusun project. Gratis untuk belajar,
> tapi berbeda stack (C# + scene graph + Asset Store). Penting dibedah agar pola
> yang dipelajari bisa ditransfer ke proyek Godot user.

## Unity Learn Microgames

- **Gratis** (Unity Personal/Unity ID, tanpa biaya untuk belajar).
- Tersedia: **Karting Microgame**, **FPS Microgame**, **Platformer Microgame**
  (kadang berubah seiring program).
- Durasi mulai ~35 menit sampai selesai; berbasis tutorial step-by-step di editor.
- Nilai belajar: melihat konvensi folder Unity (`Assets/`, `Scripts`, `Scenes`),
  pola `MonoBehaviour`, prefab, dan scene graph — konsep yang muncul di semua engine.

## Sample Unity 6 (relevant 2025–2026)

Set rilis sample yang bisa di-download dari Unity Hub / GitHub org Unity:

- **Megacity Metro** — sample kota besar, DOTS (ECS), cek performa entity-count besar.
- **Gem Hunter Match** — game match-3, UI + audio + monetisasi pola dasar.
- **Happy Harvest** — farming game: input, upgrade, inventory.
- **Boss Room** (Netcode for GameObjects) — sample multiplayer: host-client flow,
  RPC, state syncing, dll.

## Catatan penting per step

1. **Sistem** = tren teknologi yang mengikuti: kode sample Unity 6 mengikuti
   **Input System (new)** (bukan `Input.GetAxis`), object pooling, dan *data-driven*
   (ScriptableObject untuk config), bukan config hardcoded.
2. **Standarisasi** — perhatikan konvensi:
   - MonoBehaviour + serialized fields (`[SerializeField]`) — data editor dan code.
   - Scene graph: GameObject dengan Component (bukan node tree Godot yang lebih
     semantik — ini perbedaan mendasar yang perlu disadari saat membandingkan).
3. **Lisensi & run**: Player via Unity Hub memerlukan Unity ID + Personal; di kepala
   Linux/HP, Unity Editor tidak berjalan native (Windows/macOS/Linux desktop), dengan
   **Unity Hub** — buat evaluasi di PC, bukan di Termux.

## Kaitannya dengan Godot

- Konsep yang sama dengan nama berbeda: GameObject+Component ≈ Node+Script (Godot);
  Prefab ≈ PackedScene; Scenes+Assets ≈ scenes+resources.
- Pola yang bisa ditransfer: state machine, ScriptableObject data-driven ≈ Resource
  (Godot `Resource`), object pooling, event bus (C# events ≈ Godot signals).

## Checklist singkat

- [ ] Login Unity ID, buka Learn (unity.com/learn)
- [ ] Selesaikan 1 Microgame (mis. Platformer) — 35 menit
- [ ] Baca Assets/ folder structure & 1 script MonoBehaviour
- [ ] Baca Sample Unity 6 favorit (Boss Room untuk Multiplayer/Ecs)
- [ ] Buat catatan: Unity vs Godot, konsep apa yang sama dengan nama beda