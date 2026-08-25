# Debugging: The Nine Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems (David Agans)

> Sumber: http://www.debuggingrules.com/ (situs resmi; halaman "About the Book") + poster resmi 9 rules
> Diakses: 2026-08-24
> Catatan: raw fetch situs resmi TIDAK memuat isi 9 rule di homepage (hanya info buku + PDF excerpt bab 1–2), jadi file ini = daftar rule persis (diverifikasi identik dari Amazon "Look Inside" excerpt resmi & poster debuggingrules.com/download-the-poster) + penjelasan sintesis dari guide detail:
> - binary.phile — "Agans Debugging Guide" (9 Jan 2026) — https://www.binaryphile.com/debugging/software-engineering/2026/01/09/agans-debugging-guide.html
> - Book review Alex Groce (Oregon State) — https://agroce.github.io/passages/DebuggingReview.pdf

---

## Metadata buku

- Judul: *Debugging: The 9 Indispensable Rules for Finding Even the Most Elusive Software and Hardware Problems*
- Penulis: David J. Agans (konsultan PointSource, Milford NH)
- Terbit: AMACOM, 2002; ISBN 978-0-8144-7457-0; ±175–192 halaman.
- Struktur: Ch.1 Introduction; Ch.2 The Rules—Suitable for Framing; Ch.3–11 satu bab per rule; Ch.12 All the Rules in One Story; Ch.13 Exercises; Ch.14 View from the Help Desk; Ch.15 Bottom Line.
- Dua insight pembuka buku: (1) bug lama ketemu karena kita melanggar rule dasar — begitu rule diterapkan, bug cepat ketemu; (2) orang yang jago debugging menerapkan rule ini secara natural; yang kesulitan tidak. Hafal tidak cukup — harus DIINGAT dan DITERAPKAN di bawah tekanan.

## THE 9 RULES (persis seperti poster resmi)

```
1. UNDERSTAND THE SYSTEM
2. MAKE IT FAIL
3. QUIT THINKING AND LOOK
4. DIVIDE AND CONQUER
5. CHANGE ONE THING AT A TIME
6. KEEP AN AUDIT TRAIL
7. CHECK THE PLUG
8. GET A FRESH VIEW
9. IF YOU DIDN'T FIX IT, IT AIN'T FIXED
```

### Rule 1 — Understand the system
Baca manual; tahu apa yang SEHARUSNYA terjadi, bagaimana desainnya, kenapa didesain begitu, apa fungsi tiap blok/interface. Baca cover-to-cover — bagian yang kamu skip adalah tempat bug sembunyi (war story: mikroprosesor abaikan interrupt; jawaban ada di halaman 37 databook: "the chip will interrupt on the first deselected clock strobe"). Kenali apa yang "wajar" (byte order little-endian Intel). Kenali batas tool-mu: debugger source → logic errors tapi buta timing/multithread; profiler → timing; scope analog → noise/glitch; logic analyzer → data banyak tapi buta noise. "Don't guess. Look it up." (Einstein tidak hafal nomor teleponnya sendiri.)

### Rule 2 — Make it fail
Reproduksi secara reliable — tidak bisa fix apa yang tidak bisa dilihat. Tiga alasan: (1) bisa mengamatinya saat terjadi, (2) bisa fokus ke penyebab, (3) bisa memverifikasi fix. Mulai dari kondisi awal yang diketahui (fresh reboot/cold engine). Stimulasi kegagalan TANPA mengubah mekanisme (semprot jendela bocor dengan hose = bagus; program test disk-writing yang menimbulkan bug BARU = buruk — "You have enough bugs already; don't try to create new ones."). Bug intermitten: kontrol faktor acak, catat info tiap run, bandingkan run bagus vs jelek, cari yang SELALU muncul bersama kegagalan (story mobil: derit hanya pagi dingin, 25–30 mph, 10 menit pertama — dealer jam 11 siang tak bisa reproduksi = tak berpeluang menemukan). Kalau engineer bilang "that can't happen", maksudnya mekanisme KEBAYANGANNYA tak mungkin — failure tetap terjadi; buktikan gagal di depan dia (story es krim: Volare '76 mogok setelah beli es krim rasa aneh → rasa unik dikemas manual, lama antre → vapor lock mesin karburator musim panas).

### Rule 3 — Quit thinking and look
Stop menebak, pasang instrumen, amati. "It is a capital mistake to theorize before one has data." — Sherlock Holmes. War story inti: slave CPU kadang gagal checksum; junior tebak timing memory, habis berbulan-bulan buat fix board — sia-sia; senior pasang logic analyzer dengan pola `00 55 AA FF` → data tertulis DUA KALI (`00 55 55 AA FF`): noise di jalur write membuat 1 pulse terlihat 2; loopback test tak bisa menangkapnya. "We lost several months chasing the wrong thing because we guessed at the failure instead of looking at it." Lihat FAILURE-nya langsung (cerita janitor: server mati tiap malam jam 11 — staf nginep, ternyata janitor cabut colokan untuk vacuum). Instrumentasi dibangun sejak desain: debug log verbosity switchable, status message bertimestamp, test point hardware, perf monitor. Sadari efek Heisenberg: instrumen mengubah sistem — setelah pasang, buat gagal lagi untuk membuktikan bug tak tertutup. Menebak hanya BOLEH untuk mempersempit area pencarian, konfirmasi dengan observasi. Exception light bulb: kalau sangat mungkin DAN murah, coba langsung. (Catatan guide binary.phile: rule ini bukan larangan berhipotesis — hipotesis untuk MENENTUKAN mana yang diinstrumentasi; mata yang mengonfirmasi.)

### Rule 4 — Divide and conquer
Binary search: tebak angka 1–100 cukup 7 tebakan; 100 lokasi bug → 7 percobaan. Ketahuilah range penuh (kalau jawaban 135 dan asumsimu 1–100, tak akan ketemu). Tahu posisimu: upstream data bagus, downstream data rusak — cari titik pergantian (hotel reservation Macs lambat → scope di breakout box: keluar bagus, masuk rusak → cold solder joint; setelah itu masih ada terminal lambat kedua: kabel salah pin). Suntikkan pola mudah dikenali (`00 55 AA FF`, roda warna berputar, klik+flash serentak) — data acak susah dianalisis. Mulai dari sisi RUSAK, jangan verifikasi semua yang benar (furnace: mulai dari unit, 3 cek ketemu, bukan 12 dari tangki). Fix bug yang sudah diketahui & "noise" lebih dulu (race condition, variabel uninitialized, sinyal/glitch clock) — bug lain sering hilang sendiri. Caveat: search space kecil atau bug sudah terlihat → investigasi langsung lebih cepat.

### Rule 5 — Change one thing at a time
Metode ilmiah: kendalikan variabel. Story audio: engineer tambah "fix" framing, tak berhasil, LUPA diback-out; whiz temukan buffer pointer error; audio tetap jelek — karena framing fix palsu masih nempel; clobbered twice ≠ worse than once; hapus non-fix → perfect. "When it didn't fix the problem, he should have backed it out immediately." Rifle, not shotgun: ganti banyak komponen sekaligus = tidak tahu mana yang salah + bisa merusak yang sehat ("If you think you need a shotgun to hit the target, the problem is that you can't see the target clearly."). Brass bar kapal selam nuklir: saat alarm, pegang bar sampai PAHAM — quick fix membingungkan recovery system dan menimbun fault asli (story pesta: kabel speaker kebakaran → fuse; ganti kabel → fuse kedua pecah; dua-duanya mati). Bandingkan dengan yang baik: log bagus vs log jelek, side by side, bedakan variabel sebanyak mungkin. "What changed since it worked?": turntable rusak pasca-ganti cartridge → cartridge baru magnetic vs ceramic → flip switch amplifier; 30 detik. Version control menunjukkan persis apa yang berubah.

### Rule 6 — Keep an audit trail
Catat: APA yang dilakukan, urutannya, hasilnya. Detail yang kamu abaikan adalah yang penting ("The detail you ignore will be the one that matters."). Story flanel: chip video compression drop 30fps→2fps acak; pemicunya BERDIRI di depan kamera memakai kemeja flanel kotak-kotak — pattern rumit; bug report ke vendor lengkap dengan fotokopi motif kemeja. Story floppy: disk customer jebol → dia nempel disk ke filing cabinet PAKE MAGNET. Spesifik: "It's broken" tidak berguna; catat gejala persis, durasi/besaran, kondisi sistem, urutan event (story korsleting: cuma dia yang kena kejut — karena cuma dia tanpa alas kaki). Korelasikan: sinkronkan jam antar sistem, anotasi log dengan gejala yang tak ada di log (story Fred: garbage characters berkorelasi shift Fred — perutnya menekan keyboard saat ngambil kopi).

### Rule 7 — Check the plug
Question assumptions — mulai dari yang paling obvious: colokan masuk? on? initialized? kode/driver yang benar running? (Story water heater: thermostat 140° tampak normal — ternyata furnace cadangan diset 165°, setting primary 190°; asumsi "sumber panas memadai" salah.) Test TOOL-nya juga: benchmark read konsultan lebih lambat dari write berbulan-bulan → default file type TEXT (konversi newline), set BINARY → selesai. Gauge oli macet ¼ → diketuk senter → nol. Sebelum percaya hasil: sentuh probe scope ke tegangan yang diketahui, print message baik event terjadi maupun tidak, cek baterai meter.

### Rule 8 — Get a fresh view
Minta bantuan; jelaskan GEJALA, bukan TEORI ("Report symptoms, not theories" — teorimu sudah gagal, jangan racuni sudut pandang segar helper; dokter mau dengar "pinggang sakit saat membungkuk", bukan diagnosis pribadi). Tiga hal yang didapat: fresh view (keluar dari rut), expertise (pengetahuan yang tak sempat kamu pelajari), experience ("itu sering terjadi"). Kadang menjelaskan saja sudah membuat jawaban muncul — ada kantor yang sediakan mannequin untuk diceritai. Sumber bantuan: rekan kerja, vendor, forum/user group, troubleshooting guide, buku. Jangan sombong; expert pun bisa salah bila datamu bertentangan. Taking it too far: minta bantuan TERLALU dini menghambat pertumbuhan — guideline guide binary.phile: usahakan minimal ~30 menit sendiri sambil mendokumentasikan upaya.

### Rule 9 — If you didn't fix it, it ain't fixed
Verifikasi fix dengan kondisi kegagalan EXAK — lihat dengan mata kepala sendiri failure BERHENTI. Verifikasi buruk: "sepertinya membaik", "customer belum telepon lagi". Protokol emas: buat bug muncul dengan kode lama → apply fix → test sama persis → bug tidak muncul → remove fix → bug MUNCUL lagi (buktikan korelasinya). Pahami MENGAPA fix bekerja: "If you don't know why it works now, it probably doesn't." Waspadai: test kasus yang salah, environment salah (works on my machine), kebetulan (bug intermittitent), fix yang cuma menyembunyikan (ubah timing). Fix satu hal bisa mengekspos bug lain — jangan anggap failure baru = bug yang sama (story mobil: stall di tanjakan disalahkan ke bensin, lalu "masalah listrik" $75, akhirnya bad ground connection — dan tetap belum tuntas sampai ground dirutekan jauh dari panas).

## Common traps (ringkasan)

| Jebakan | Rule yang dilanggar |
|---|---|
| Menebak tanpa melihat | Rule 3 |
| Fix tanpa reproduksi | Rule 2 |
| Mengubah banyak hal sekaligus | Rule 5 |
| Tidak mencatat apa yang terjadi | Rule 6 |
| Menganggap hal obvious | Rule 7 |
| Test di konfigurasi berbeda | Rule 9 |

## Kutipan kunci

- "When it took us a long time to find a bug, it was because we had neglected some essential, fundamental rule."
- "Don't guess. Look it up."
- "There are more ways for something to be broken than even the most imaginative engineer can imagine."
- "The detail you ignore will be the one that matters."
- "If you don't know why it works now, it probably doesn't."
- "It is a capital mistake to theorize before one has data." (Sherlock Holmes — epigraf berulang di buku)

## Koneksi lintas-disiplin (dari guide binary.phile, opsional untuk KB)

- Ke testing (Khorikov): Make It Fail ≈ tests reproduce; Divide and Conquer ≈ tests isolate; Change One Thing ≈ control variables; good tests = debugging tools.
- Ke Ousterhout: Understand the System ↔ deep modules hide complexity; Divide and Conquer ↔ interfaces isolate modules; build instrumentation in ↔ design for debuggability.
- Ke XP (Beck): test-first = "Make It Fail" proaktif; pair programming = "Get a Fresh View" institusional; small releases = Change One Thing at a Time.
