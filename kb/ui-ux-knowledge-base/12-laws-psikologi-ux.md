# 12 — Laws of UX: Hukum Psikologi Kanonik + Cara Pakainya

> Sumber utama: **lawsofux.com** (Jon Yablonski; edisi ke-2 buku terbit dengan konsep baru:
> Choice Overload, Flow, Paradox of the Active User, Selective Attention, Cognitive Bias).
> 30 hukum/konsep. Lisensi CC BY-NC-ND — kutip sumbernya saat dipakai.
> Pasangan di KB: `04-psikologi-case-studies.md` (studi kasus produk) — file ini = teori dasarnya.

---

## Peta mental: 4 kelompok hukum

| Kelompok | Hukum | Dipakai untuk |
|---|---|---|
| **Keputusan & pilihan** | Hick's, Choice Overload, Paradox of Choice, Pareto, Parkinson's | Menyederhanakan menu, form, pricing |
| **Memori & beban kognitif** | Miller's, Chunking, Working Memory, Cognitive Load, Mental Model, Paradox of Active User | Onboarding, navigasi, copy UI |
| **Persepsi visual (Gestalt)** | Common Region, Proximity, Prägnanz, Similarity, Uniform Connectedness, Von Restorff | Layout, grouping, penekanan CTA |
| **Motivasi & pengalaman** | Goal-Gradient, Zeigarnik, Peak-End, Flow, Doherty Threshold, Aesthetic-Usability | Progress, loading state, polish |

## Hukum inti + implikasi desain konkret

### Keputusan & pilihan
- **Hick's Law** — waktu keputusan naik seiring jumlah/kompleksitas pilihan.
  → Batasi opsi per layar; pecah flow panjang jadi langkah; tombol utama 1, sisanya sekunder.
  ⚠️ Tidak berlaku untuk task yang sudah terlatih (user ahli membaca menu penuh lebih cepat).
- **Choice Overload / Paradox of Choice** — kebanyakan opsi → overwhelm → tidak memilih sama sekali.
  → Default cerdas + filter; kurasi > katalog mentah.
- **Pareto (80/20)** — 80% efek dari 20% penyebab.
  → Prioritaskan fitur yang 20% user pakai 80% waktu; sisanya progressive disclosure.
- **Parkinson's Law** — tugas mengembang mengisi semua waktu tersedia.
  → Beri deadline/perkiraan waktu realistis di progress (mis. "±2 menit"), jangan kosong.

### Memori & beban kognitif
- **Miller's Law (7±2)** — batas working memory. ⚠️ Sering disalahartikan sebagai "max 7 item menu";
  makna benarnya: **chunking**, bukan memotong list sembarangan.
- **Chunking** — kelompokkan info jadi unit bermakna (nomor telepon 3-4-4; form jadi section "Alamat" vs field per-field).
- **Cognitive Load** — total resource mental untuk pakai interface.
  → Kurangi: intrinsic (sederhanakan tugas), extraneous (buang dekorasi tak relevan),
  germane (bangun skema via pola familiar).
- **Mental Model** — user membawa model dari produk lain (**Jakob's Law**: mereka lebih banyak
  main di produk lain daripada punyamu). → Ikuti konvensi; inovasi hanya di value prop, bukan di navigasi.
- **Paradox of the Active User** — user tidak baca manual, langsung coba-coba.
  → Desain untuk eksplorasi: affordance jelas, error yang bisa pulih, empty state yang mengajarkan
  (selaras checklist D di `07-playbook.md`).

### Persepsi visual (Gestalt)
- **Common Region** — boundary bersama = grup (card dengan border/background).
- **Proximity** — dekat = related. Jarak antar-elemen adalah sinyal relasi #1 (Practical UI setuju, lihat `13`).
- **Prägnanz** — ambigu dipersepsi sebagai bentuk paling sederhana. → Ikon/gambar sederhana > detail.
- **Similarity** — mirip (warna/bentuk) = satu grup meski terpisah lokasi.
- **Uniform Connectedness** — garis/panah/warna nyambung = related (stepper, timeline).
- **Von Restorff (Isolation)** — yang beda dari sekumpulan serupa paling diingat.
  → Satu CTA berwarna di antara tombol netral; tapi kalau SEMUA ditekankan, tidak ada yang menonjol.

### Motivasi & pengalaman
- **Goal-Gradient** — effort meningkat mendekati tujuan.
  → Progress bar yang mulai "sudah terisi" (pre-filled) menaikkan completion (dibuktikan juga teardown Growth.design di `04`).
- **Zeigarnik** — tugas tak selesai lebih diingat. → Checklist onboarding yang tersisa nampak; reminder email cart.
- **Peak-End Rule** — pengalaman dinilai dari puncak emosi + akhirnya.
  → Investasikan motion/delight di momen sukses (checkout complete, save berhasil) dan pastikan akhir flow manis,
  bukan cuma halaman rata-rata yang enak.
- **Flow** — imersi penuh saat challenge ≈ skill.
  → Hilangkan interupsi (dialog tak penting), feedback langsung, tujuan jelas.
- **Doherty Threshold** — produktivitas melonjak bila respon sistem <400ms.
  → Skeleton screen + optimistic UI + animasi progress agar *terasa* cepat walau network lambat.
- **Aesthetic-Usability Effect** — desain cantik dipersepsi lebih usable; toleransi error lebih tinggi.
  ⚠️ Bukan alasan mengabaikan usability — cantik menutupi masalah kecil, bukan masalah besar
  (prinsip #8 playbook: audit gaya dan fungsi terpisah).

### Lainnya
- **Fitts's Law** — waktu mencapai target = fungsi jarak × ukuran.
  → Target sentuh besar & dekat; area klik diperluas melebihi visual; aksi destruktif DIJAUHKAN dari aksi aman.
- **Postel's Law** — liberal menerima input, konservatif mengirim output.
  → Toleran pada format input (telepon/spasi/huruf kapital), rapikan sendiri; validasi longgar, normalisasi ketat.
- **Serial Position Effect** — first & last dalam deret paling diingat.
  → Item penting di awal/akhir menu & nav bar (bukan tengah); harga termahal pertama atau terakhir, bukan tengah.
- **Selective Attention** — orang hanya memperhatikan stimulus sesuai goal-nya.
  → Banner promosi diabaikan ("banner blindness"); error message harus dekat titik masalah, bukan di atas halaman.
- **Occam's Razor** — pilih solusi asumsi tersedikit. **Tesler's Law** — kompleksitas ada batas minimalnya;
  memindahkan kompleksitas dari user ke sistem biasanya kerja designer.
- **Cognitive Bias** — daftar bias sistematis; gunakan sebagai lensa review (mis. sunk cost saat user
  ragu hapus data, anchoring saat menampilkan harga coret).

## Cara pakai dalam workflow

1. Saat review desain (skill `ux-review`): identifikasi hukum mana yang dilanggar → kutip namanya, jelaskan mekanisme psikologisnya, tunjukkan perbaikannya.
2. Saat mempertahankan keputusan desain ke stakeholder: "Ini Jakob's Law" lebih kuat daripada "rasanya lebih pas".
3. Jangan tumpuk semua hukum sekaligus — 2–3 hukum paling relevan per masalah.

## Anti-pola

- ❌ "7±2 → nav maksimal 7 item" (salah kaprah Miller; chunking-lah intinya).
- ❌ Pakai Von Restorff untuk membenarkan SEMUA elemen menonjol.
- ❌ Menganggap laws sebagai aturan mati — Yablonski sendiri menyebutnya *considerations*, bukan commandments.
- ❌ Dark pattern memanfaatkan Goal-Gradient/Zeigarnik (progress palsu, FOMO buatan) — rugi trust jangka panjang (lihat `04` §cancel flow).
