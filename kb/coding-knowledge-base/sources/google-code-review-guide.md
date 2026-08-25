# Google Engineering Practices — How to Do a Code Review (gabungan)

> Sumber: https://google.github.io/eng-practices/review/reviewer/standard.html , https://google.github.io/eng-practices/review/reviewer/looking-for.html , https://google.github.io/eng-practices/review/reviewer/speed.html , https://google.github.io/eng-practices/review/developer/small-cls.html
> Diakses: 2026-08-24
> Catatan: padatkan — 4 halaman digabung; prinsip kunci, checklist, dan angka dipertahankan

---

## 1. The Standard of Code Review

**Tujuan utama code review: memastikan overall code health codebase membaik seiring waktu.**

Prinsip senior #1 (kutipan kunci):

> **"In general, reviewers should favor approving a CL once it is in a state where it definitely improves the overall code health of the system being worked on, even if the CL isn't perfect."**

- Tidak ada kode "perfect" — hanya kode yang *lebih baik*. Yang dicari adalah *continuous improvement*, bukan kesempurnaan.
- CL yang meningkatkan maintainability/readability/understandability JANGAN ditunda berhari-hari karena tidak sempurna.
- Reviewer boleh selalu memberi komentar perbaikan; jika tidak penting, awali dengan **"Nit: "**.
- Batasan: reviewer boleh menolak CL yang menambah fitur yang tidak diinginkan sistemnya. Tidak ada justifikasi men-merge CL yang jelas-jelas menurunkan code health (kecuali emergency).
- Mentoring: komentar edukatif boleh selalu; tandai "Nit:" jika tidak wajib.

### Principles
1. **Technical facts dan data mengalahkan opini & preferensi personal.**
2. Soal style → style guide adalah otoritas absolut. Style di luar guide = preferensi personal; jika belum ada style sebelumnya, terima gaya author.
3. Aspek software design hampir tidak pernah murni soal selera — dinilai dari prinsip desain. Jika beberapa opsi sama validnya (terbukti via data/prinsip), terima preferensi author.
4. Jika tak ada aturan lain, minta konsistensi dengan codebase yang ada — asal tidak menurunkan code health.

### Resolving conflicts
- Langkah pertama: cari konsensus developer↔reviewer berdasarkan dokumen.
- Sulit → meeting tatap muka/video call; hasil diskusi DICATAT sebagai komentar di CL.
- Masih buntu → eskalasi (diskusi tim lebih luas, Tech Lead, maintainer, Eng Manager). **Jangan biarkan CL menganggur** karena ketidaksepakatan.

---

## 2. What to Look For in a Code Review

Checklist lengkap (list resmi "summary"):

- Kode **well-designed**.
- Fungsionalitas bagus untuk **users** kode tersebut (end-users DAN developers).
- Perubahan UI sensible & tampak bagus.
- Parallel programming dilakukan dengan aman.
- Kode **tidak lebih kompleks** dari yang dibutuhkan.
- Developer tidak meng-implement hal yang "mungkin" dibutuhkan masa depan (*over-engineering*).
- Ada unit test sesuai; test well-designed.
- Nama (variabel/fungsi/class) jelas.
- Komentar jelas & berguna — umumnya menjelaskan **WHY**, bukan WHAT (kecuali regex/algortima kompleks).
- Kode terdokumentasi sesuai.
- Konform ke style guide.

Detail per area:

- **Design** (paling penting): apakah interaksi antar potongan kode masuk akal? Apakah change ini milik codebase ini atau library? Integrate baik? Timing-nya tepat?
- **Functionality**: apakah CL melakukan yang dimaksud developer, dan apakah itu bagus untuk users? Reviewer tetap mikir edge cases, concurrency, "think like a user". Untuk **UI changes** — penting melihat perilakunya (demo). Untuk **parallel programming** — waspadai deadlock/race conditions (sulit dideteksi hanya dengan menjalankan).
- **Complexity**: "too complex" = tidak bisa dipahami cepat oleh pembaca kode; atau rawan bug saat dipanggil/dimodifikasi. Waspadai **over-engineering**: kode lebih generik dari kebutuhan; selesaikan masalah yang diketahui *sekarang*.
- **Tests**: test harus di CL yang sama dengan production code (kecuali emergency). Pastikan test benar, sensible, useful: gagalkah saat kode rusak? false positives? assertion sederhana & berguna? Test juga kode yang dirawat — jangan terima kompleksitas di test.
- **Naming**: nama cukup panjang untuk komunikasi penuh, tidak sampai sulit dibaca.
- **Comments**: jelaskan *why*, bukan *what*; jika kode butuh komentar "what", sederhanakan kodenya. Cek juga komentar lama (TODO bisa dihapus dsb.). Dokumentasi (class/module/function) beda dari komentar.
- **Style**: ikuti style guide; style di luar guide → awali "Nit:". **Jangan block CL hanya karena preferensi style personal.** Author JANGAN mencampur restyling besar dengan perubahan fungsional (pisah CL).
- **Consistency**: style guide = absolut; kalau hanya rekomendasi → judgment call; jika tak ada aturan → konsisten dengan existing code; dorong author file bug + TODO untuk cleanup kode lama.
- **Documentation**: jika CL mengubah cara build/test/interaksi/release → update dokumentasi terkait; hapus dokumentasi untuk kode yang dihapus/deprecated.
- **Every Line**: tinjau **setiap baris** kode yang ditugaskan (generated code/data files boleh discan). Kalau terlalu sulit dipahami → minta developer klarifikasi (kalau kamu tak paham, developer lain kemungkinan juga tidak). Bagian yang tidak kompeten (privacy, security, concurrency, a11y, i18n) → pastikan ada reviewer yang qualified.
- **Context**: lihat konteks file utuh & sistem keseluruhan; **jangan terima CL yang menurunkan code health sistem** — sistem menjadi kompleks lewat banyak perubahan kecil yang menumpuk.
- **Good Things**: beri pujian atas hal baik, terutama saat author merespons komentar dengan bagus — kadang lebih berharga secara mentoring daripada kritik.

---

## 3. Speed of Code Reviews

- Google mengoptimalkan **kecepatan tim secara keseluruhan**, bukan kecepatan individual.
- Review lambat → velocity tim turun; developer protes proses review; tekanan menerima CL berkualitas rendah; code health terganggu.
- **Kutipan kunci:** *"Most complaints about the code review process are actually resolved by making the process faster."*

Angka/guideline:

- **Maksimal satu business day** untuk merespons request code review (misal pagi berikutnya).
- Dengan begitu CL tipikal dapat multiple rounds of review dalam satu hari.
- **Speed vs interruption:** jika sedang dalam focused task (menulis kode), JANGAN interupsi diri sendiri; respons di break point. Biaya konteks-switch lebih mahal bagi tim.
- Yang penting cepat adalah **waktu respons individual** (response latency), bukan hanya durasi total proses.
- Sibuk → kirim quick response: kapan akan review, sarankan reviewer lain, atau initial broad comments.
- LGTM harus bermakna "kode ini memenuhi standar".
- Cross-time-zone: usahakan review tiba sebelum jam kerja author habis.
- **LGTM With Comments** (percepat): berikan approval meski ada komentar tersisa jika (a) yakin author akan menangani komentar dengan tepat, ATAU (b) komentar tidak wajib diselesaikan, ATAU (c) saran minor (sort imports, typo, apply suggested fix, remove unused dep). Sebutkan opsi mana yang dimaksud. Sangat berguna lintas time zone.
- **Large CLs**: minta developer split menjadi beberapa CL kecil yang saling membangun; jika tak bisa, beri komentar desain tingkat tinggi agar developer ter-unblock. Tujuan reviewer: selalu unblock developer tanpa mengorbankan code health.
- Proses review cenderung makin cepat over time jika standar dipegang teguh — tapi **jangan kompromikan standar demi velocity imajiner**.
- Emergencies: proses review dipercepat dan guideline direlaksasi — hanya untuk situasi emergensi sungguhan.

---

## 4. Small CLs (panduan untuk developer)

Kenapa CL kecil:

1. Di-review lebih cepat.
2. Di-review lebih menyeluruh.
3. Lebih kecil kemungkinan memperkenalkan bug.
4. Kerja terbuang lebih sedikit bila ditolak.
5. Lebih mudah di-merge.
6. Lebih mudah didesain baik.
7. Mengurangi blocking (bisa lanjut coding sambil menunggu review).
8. Lebih mudah di-rollback.

**Reviewer berhak menolak CL hanya karena ukurannya terlalu besar.**

### Berapa "kecil"?

- Ukuran yang benar = **one self-contained change** (minimal, hanya satu hal; biasanya satu bagian fitur, bukan fitur utuh).
- Err on the side of too small vs too large.
- Harus include related test code.
- Semua yang reviewer perlukan ada di CL/deskripsi/codebase/CL yang sudah direview.
- Sistem tetap bekerja baik setelah CL masuk.
- Tidak kecil sampai implikasinya sulit dipahami (API baru → sertakan pemakaian di CL yang sama).

Guideline angka:

- **~100 lines** biasanya ukuran CL yang reasonable; **1000 lines biasanya terlalu besar** — finalnya judgment call reviewer.
- Sebaran file berpengaruh: 200 lines di 1 file mungkin oke; tersebar di 50 files biasanya terlalu besar.
- Kalau ragu, buat lebih kecil dari perkiraanmu; reviewer jarang komplain CL terlalu kecil.

### Kapan CL besar masih oke?

- Penghapusan satu file utuh ≈ hitung satu line (cepat direview).
- Refactoring otomatis oleh tool yang sepenuhnya dipercaya (reviewer cukup verifikasi).

### Strategi splitting CLs

- **Stacking**: tulis CL kecil, kirim review, langsung tulis CL berikutnya DI ATAS CL pertama.
- **Splitting by files**: per kelompok file dengan reviewer berbeda tapi self-contained (mis. proto vs kode pemakai proto) — keduanya bisa direview paralel.
- **Splitting horizontally**: pisahkan per layer tech stack (client / API / service / data model) via shared signature/stub.
- **Splitting vertically**: pecah per full-stack vertical feature (mis. operator kali vs bagi), tiap vertical track independen.
- **Gabungan horizontal × vertical**: tiap sel matriks layer×feature = satu CL mandiri.

Aturan tambahan:

- **Pisahkan refactoring dari feature/bugfix** (move/rename class ≠ fix bug di class itu); small cleanup lokal boleh menyatu.
- **Related test code di CL yang sama.** Pure-refactoring CL juga harus ter-cover test (tambahkan bila belum ada). Modifikasi test independen boleh CL terpisah (validasi pre-existing behavior sebelum refactor, refactor helper test, framework test besar).
- **Don't break the build**: rangkaian CL dependen harus menjaga sistem tetap bekerja setelah tiap submission.
- "Can't make it small enough": sangat jarang benar-benar harus besar; coba refactoring-only CL pendahuluan; diskusi dengan rekan; jika tetap besar → minta consent reviewer di muka.
