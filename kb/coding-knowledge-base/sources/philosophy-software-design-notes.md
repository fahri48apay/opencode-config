# A Philosophy of Software Design (John Ousterhout) — Notes

> Sumber: buku *A Philosophy of Software Design*, John Ousterhout, Yaknyam Press (2018; 2nd ed. 2021)
> Diakses: 2026-08-24
> Catatan: NOTES sintesis dari 5 sumber ringkasan:
> 1. Gist 8ullyMaguire — chapter-by-chapter notes (bersumber dari catatan Daniel Lebrero Berna / danlebrero.com) — https://gist.github.com/8ullyMaguire/764e7dc375d3f9d34cadb0d668bd518d
> 2. Carsten Behrens — "Summary of A Philosophy of Software Design" — https://carstenbehrens.com/a-philosophy-of-software-design-summary
> 3. Jan Meppe — book summary — https://www.janmeppe.com/blog/a-philosophy-of-software-design-john-ousterhout/
> 4. oehler.dev — summary + key takeaways — https://www.oehler.dev/posts/a-philosophy-of-software-design-summary
> 5. Pragmatic Engineer — wawancara John Ousterhout — https://newsletter.pragmaticengineer.com/p/the-philosophy-of-software-design

---

## 1. Premis: semuanya tentang kompleksitas

- Masalah paling fundamental di ilmu komputer menurut Ousterhout: **problem decomposition** — memecah sistem besar menjadi unit yang bisa dikerjakan independen.
- **Definisi kompleksitas**: "anything related to the structure of a software system that makes it hard to understand and modify the system."
- Rumus praktis: total kompleksitas = Σ (kompleksitas tiap bagian × porsi waktu developer menghabiskan waktu DI bagian itu).
- Tujuan desain baik: **make the system obvious** — meminimalkan pengetahuan yang harus dimiliki programmer untuk melakukan perubahan.

## 2. Gejala (symptoms) kompleksitas — WAJIB

1. **Change amplification**: perubahan yang tampak sederhana butuh modifikasi di BANYAK tempat.
2. **Cognitive load**: developer harus tahu terlalu banyak hal untuk melakukan perubahan (melebihi kapasitas working memory). Contoh load: API yang banyak parameternya.
3. **Unknown unknowns**: tidak jelas apa yang perlu diketahui agar perubahan berhasil; kode compile & tampak beres tapi gagal karena ada sesuatu yang tidak diketahui.

Penyebab (causes): **dependencies** (tak terhindarkan, tapi harus eksplisit & minim) dan **obscurity** (informasi penting tak jelas — nama variabel buruk, dokumentasi hilang, konvensi tak tertulis).

Kompleksitas **terakumulasi secara inkremental** — tidak ada satu perubahan besar penyebabnya; karena itu juga sulit dibuang → adopsi filosofi zero tolerance.

## 3. "Working code isn't enough" — strategic vs tactical programming

- Kode yang jalan BUKAN ukuran sukses; tujuan utama adalah **desain yang bagus** sehingga sistem mudah dimengerti/diubah jangka panjang.
- **Tactical programming**: fokus bikin fitur jalan secepatnya → akumulasi kompleksitas.
- **Tactical tornado** ("product engineer"): tulis kode sangat cepat, produktif jangka pendek, tapi meninggalkan kompleksitas; organisasi sering salah memberi reward.
- **Strategic programming**: desain adalah investasi berkelanjutan — alokasikan ±10–20% waktu dev untuk investasi desain; hasilnya balik modal dengan cepat.
- **Incremental design**: desain software TIDAK PERNAH selesai ("software design is never finished"); desain dilakukan kontinu — setiap kali menyentuh/mengubah kode, ada kesempatan memperbaiki desain; jika saat mengubah kode kamu tidak memperbaiki desain, hampir pasti kamu MEMPERBURUKNYA.

## 4. Deep vs shallow modules — inti buku

- Module = interface + implementation. Interface = pengetahuan yang HARUS diketahui client, mencakup **formal** (signature, parameter — dicek bahasa) dan **informal** (behavior, unit, constraint — mis. fungsi `delete` menghapus file bernama argumen; kalau client perlu tahu info ini, itu bagian dari interface).
- **Deep module**: fungsionalitas kuat, interface SEDERHANA — menyembunyikan kompleksitas besar. Contoh favorit:
  - Unix file I/O: 5 system call sederhana (`open`, `read`, `write`, `lseek`, `close`) menyembunyikan ratusan ribu baris implementasi.
  - Garbage collector: kompleksitas raksasa dengan interface NOL (bekerja tak kasat mata).
- **Shallow module**: interface relatif rumit dibanding fungsionalitas yang diberikan; sedikit menyembunyikan kompleksitas. Red flag: manfaatnya gugur oleh biaya belajar/memakai interfacenya.
- **Classitis** (anti-dogma): conventional wisdom "kelas kecil = baik" sering menghasilkan BANYAK kelas shallow → total kompleksitas sistem NAIK. Kelas lebih besar bisa memperbaiki information hiding.
- Abstraksi = view sederhana yang menghilangkan detail tak penting; abstraksi yang menghilangkan detail PENTING = false abstraction.

## 5. Information hiding (dan leakage)

- Information hiding = teknik utama membuat deep module: tiap module mengenkapsulasi beberapa **design decision** dalam implementasinya, tak terlihat di interface.
- Manfaat: interface lebih sederhana (cognitive load turun) + dependency antar modul berkurang (perubahan yang hanya menyentuh detail tersembunyi tak merambat).
- **Information leakage**: design decision tersebar/diduplikasi di banyak modul → change amplification & coupling. Bisa lewat dokumen formal MAUPUN implicit (client harus tahu format file, urutan eksekusi).
- Culprit klasik: **temporal decomposition** — memecah modul berdasar urutan waktu alur data (contoh ML: modul pembuat dataset train, modul training, modul dataset test, modul evaluasi → dua modul "pembuat dataset" harus tahu hal sama; design decision seharusnya satu modul).

## 6. General-purpose modules are deeper

- Buat modul "somewhat general-purpose": interface general-purpose, implementasi special-purpose untuk kebutuhan sekarang.
- Pertanyaan penyeimbang generality: (1) Apa interface paling sederhana yang menutup kebutuhan SEKARANG? (2) Berapa kali method ini dipakai? (3) Apakah API mudah dipakai untuk kebutuhan sekarang? Kalau tidak → terlalu general.

## 7. Different layer, different abstraction

- Layer/lapisan bertetangga dengan abstraksi serupa = red flag (mis. pass-through method/decorator yang cuma meneruskan).
- Perbaiki pass-through dengan: expose langsung, menggabungkan class, atau context object.

## 8. Pull complexity downwards

- Golden rule: **lebih penting interface sederhana daripada implementasi sederhana** — tarik kompleksitas KE DALAM modul (downward), bukan dorong ke user modul.
- Strive to make life easy for your USERS even if harder for yourself.
- **Configuration parameters** = contoh memindah kompleksitas ke atas; hindari sebisa mungkin, hitung default yang masuk akal otomatis.
- Jangan overdone: pull downward masuk akal bila menghasilkan pengurangan kompleksitas total.

## 9. Better together or better apart

- Gabungkan bila: berbagi informasi, dipakai bersama, tumpang tindih konseptual, atau menggabungkan menyederhanakan interface / menghapus duplikasi.
- Developer sering MEMECAH method terlalu banyak; setiap method harus "do one thing and do it completely". Method panjang TIDAK APA-APA bila signature simpel & kode mudah dibaca (= deep).
- Red flag: satu komponen tak bisa dipahami tanpa membaca implementasi komponen lain.
- Sulit memberi nama yang tepat pada sebuah method = indikator desain kurang bersih.

## 10. Define errors out of existence

- Exception handling menyumbang kompleksitas DISPROPORTIONATE: mengganggu alur normal, menambah kasus, sering ditulis asal (swallow/log-and-continue).
- Strategi mengurangi: (1) **define errors out of existence** — desain API sehingga kasus exceptional TIDAK ADA (mis. `get()` return null vs Java `remove` melempar); (2) tangani exception di layer rendah semampunya (masking); (3) agregasi: satu handler untuk banyak error dengan tipe umum; (4) crash bila memang appropriate.
- Special cases umumnya harus dihindari — desain yang baik mengeliminasinya.

## 11. Design it twice

- Sebelum memilih desain, EKSPLORASI minimal DUA desain yang benar-benar berbeda (radically different), bandingkan trade-off-nya.
- Contoh Ousterhout: desain kedua API Tk Toolkit terbukti jauh lebih baik daripada desain pertamanya. "Not going with your first idea."
- Desain pertama selalu "acceptable enough" untuk menghentikan pemikiran — sadari bias itu.

## 12. Comments & names

- Komentar punya dua tujuan: menambah **precision** (informasi persis) dan **intuition** (konteks tingkat tinggi, kenapa). Dokumentasikan interface DAN implementasi.
- Empat excuses anti-komentar, semua ditolak: (1) "good code is self-documenting" (salah — kode tak bisa menyampaikan kenapa/kontrak informal); (2) "no time" (itu investasi); (3) "komentar cepat basi" (berarti update — komentar usang lebih baik daripada tidak ada); (4) "komentar tak berguna" (belajar menulis yang lebih baik).
- **Comment-first development**: tulis komentar SEBELUM kode — analog dengan TDD; membantu desain, pacing, dan kejelasan. (Ousterhout menyelesaikan dengan comment-first apa yang orang selesaikan dengan TDD.)
- Nama harus precise & consistent. Sulit menamai = desain kemungkinan tidak clean.
- Komentar hidup di kode, BUKAN di commit log.

## 13. Consistency & performance

- Konsistensi (naming, struktur, convention) mengurangi cognitive load: jangan "memperbaiki" konvensi existing tanpa alasan kuat.
- Kode yang lebih sederhana cenderung LEBIH CEPAT; desainlah di sekitar critical path. (Di wawancara 2024–2025 ia juga memperingatkan AI coding tools berisiko jadi "tactical tornado".)

## 14. Kesimpulan buku

- Zero tolerance terhadap kompleksitas; perbaiki desain pada SETIAP perubahan.
- Poor designers spend most of their time chasing bugs in brittle code (desainer buruk menghabiskan waktu memburu bug di sistem rapuh).
- Buku direkomendasikan grugbrain.dev sendiri (masuk daftar "Reads") — pasangan yang cocok dengan filosofi "simple beats complex".
