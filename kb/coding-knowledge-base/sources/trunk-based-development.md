# Trunk-Based Development (TBD)

> Sumber: https://trunkbaseddevelopment.com/ (+ https://trunkbaseddevelopment.com/feature-flags/)
> Diakses: 2026-08-24
> Catatan: padatkan + notes — intro, perbandingan GitFlow, feature flags, short-lived branches

## Definisi (one-line, dari situs)

Model branching source-control di mana developer berkolaborasi di **satu branch bernama 'trunk'** (`main` di Git sejak 2020) dan **menolak tekanan membuat long-lived branch lain** dengan teknik yang terdokumentasi. Tujuan: menghindari *merge hell*, tidak merusak build.

## Klaim utama situs

- Lakukan TBD **alih-alih GitFlow** dan model branching lain yang punya banyak long-running branch.
- Bisa langsung commit/push ke trunk (tim sangat kecil) ATAU Pull-Request workflow **asalkan feature branch pendek umurnya** (short-lived), hasil satu dev-workstation (solo/pair/mob).
- TBD adalah enabler kunci **Continuous Integration** (semua anggota commit ke trunk minimal 1x/24 jam) dan by extension **Continuous Delivery**; codebase selalu releasable on demand.
- Bukti skala: Google melakukan TBD dengan **35.000 developers + QA automators** dalam satu monorepo trunk.
- Dipromosikan buku "Continuous Delivery" & "DevOps Handbook".

## Elemen praktik

### Short-lived feature branches
- Dipakai tergantung ukuran tim & commit rate, untuk **code review dan CI check** saja — bukan untuk pembuatan/publikasi artifact.
- Umurnya sangat pendek (di-merge/di-integrasikan cepat ke trunk); memungkinkan *eager and continuous code review* sebelum kode masuk trunk.
- Tim sangat kecil boleh **commit langsung ke trunk** tanpa branch.
- Pre-integrate build wajib: compile + unit test + integration test di workstation sebelum push.

### Feature flags
- Cara mengontrol kapabilitas aplikasi secara besar/biner (atau aditif) lewat flag — Martin Fowler menyebutnya "Feature Toggles".
- Fungsi: merge kode yang **belum aktif** ke trunk; release urutan fleksibel (hedging order of releases); A/B testing & beta groups; runtime-switchable flags (state persist via Consul/Etcd untuk cluster).
- Granularitas bebas: dari UI besar sampai `--temp=F|C|K`.
- Implementasi ideal via abstraction/DI, hindari if/else tersebar.
- **CI harus menjaga permutasi flag** yang meaningful (fan-out pipeline setelah unit test).
- **Pitfall tech debt**: flag sering dilupakan; rencanakan penghapusan (misal review-for-delete date ~1 bulan pasca rilis).

### Branch by abstraction
Teknik untuk perubahan panjang: implementasi bertahap di balik abstraksi sehingga trunk tetap konsisten — dipakai bersama feature flags.

### Release
- Release branch dipotong dari trunk **just-in-time**, di-harden, lalu **dihapus setelah rilis**; ATAU rilis langsung dari trunk dengan strategi **"fix forward"** (tanpa release branch).
- Tim >2 orang butuh **build server** untuk verifikasi commit tidak break the build.

## Perbandingan dengan GitFlow

- Praktisi Gitflow akan menemukan TBD "**very different**": GitFlow punya multiple long-running branches (`develop`, `release/*`, `feature/*` jangka panjang), sedangkan TBD hanya trunk (+ branch pendek umur / release branch sementara).
- Shared branches off mainline yang lama = buruk pada segala release cadence (ilustrasi inti situs).
- GitHub-flow mirip TBD; satu-satunya beda kecil ada di titik asal rilis (releasing from trunk vs tag/branch).
- Dampak: dengan TBD, tim bisa flex up/down ukuran tanpa menurunkan throughput/kualitas; hindari merge hell.

## Konteks historis

Bukan model baru: dikenal sejak pertengahan 90-an (taktis sejak 80-an); dipraktikkan skala besar oleh Google & Facebook. Situs milik Paul Hammant (© 2017–2020), 25 diagram penjelas.
