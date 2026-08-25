# Refactoring.Guru — Code Smells (Notes)

> Sumber: https://refactoring.guru/refactoring/smells
> Diakses: 2026-08-24
> Catatan: notes — daftar lengkap smell per kategori sesuai katalog situs. Situs mengelompokkan **23 smell** dalam 5 kategori + 1 "Other" (bukan 21; Incomplete Library Class tampil di blok Couplers pada halaman index tapi masuk "Other Smells" di sidebar). Deskripsi dipadatkan dari definisi kanonik katalog.

## Definisi

Code smell = indikasi bermasalah yang biasanya berujung pada lebih dari satu refactor di class/function. Smells bukan bug — tidak menghambat program jalan; mereka menaikkan technical debt dan mempersulit modifikasi.

---

## Kategori 1 — Bloaters (5)

Kode/method/class membengkak sampai sulit dikerjakan; menumpuk perlahan seiring program berevolusi.

1. **Long Method** — method yang panjangnya membuat isi sulit dipahami dan dimodifikasi; penyembuh utamanya Extract Method, plus reduksi variabel lokal & kondisional kompleks.
2. **Large Class** — class yang mencoba melakukan terlalu banyak sehingga field/method-nya berlebihan; solusinya Extract Class / Extract Subclass.
3. **Primitive Obsession** — terlalu bergantung pada primitive types untuk data domain (string untuk nomor telepon, int untuk uang) alih-alih object kecil yang semestinya; menyebabkan logika validasi tersebar.
4. **Long Parameter List** — parameter list yang panjang membuat pemanggil rawan salah dan sulit dirawat; ganti dengan object/parameter object atau pertahankan objek utuh.
5. **Data Clumps** — kelompok variabel yang selalu muncul bersama di beberapa tempat (firstName+lastName+address...) seharusnya dijadikan satu class.

## Kategori 2 — Object-Orientation Abusers (4)

Penerapan prinsip OOP yang tidak lengkap atau salah.

6. **Alternative Classes with Different Interfaces** — dua class punya fungsi sama tetapi interface berbeda; samakan/duplikasikan interface lalu izinkan substitusi.
7. **Refused Bequest** — subclass mewarisi method/data yang tidak dipakainya, menandakan hirarki inheritance yang salah; perbaiki dengan Push Down Method/Field atau Replace Inheritance with Delegation.
8. **Switch Statements** — switch/case besar atau if-chain yang duplikat di banyak tempat; ganti dengan polymorphism (Replace Conditional with Polymorphism) atau State/Strategy pattern.
9. **Temporary Field** — field yang hanya bernilai/dipakai dalam situasi tertentu sehingga class membawa state kosong sebagian waktu; ekstrak logika terkait ke class sendiri.

## Kategori 3 — Change Preventers (3)

Ubah satu tempat → harus mengubah banyak tempat lain; development jadi mahal.

10. **Divergent Change** — satu class sering berubah karena banyak alasan berbeda (kontekstual: tiap fitur baru menyentuh class yang sama); pisahkan tanggung jawab via Extract Class.
11. **Parallel Inheritance Hierarchies** — setiap kali subclass A dibuat, kamu juga harus membuat subclass B (dua hirarki paralel); satukan atau hilangkan salah satu via Move Method/Field.
12. **Shotgun Surgery** — satu perubahan logika memaksa edit kecil di banyak class sekaligus; konsolidasikan kode yang berubah bersamaan via Move Method/Field + Inline Class.

## Kategori 4 — Dispensables (6)

Sesuatu yang tak berguna; kehadirannya bisa dihilangkan supaya kode lebih bersih, efisien, mudah paham.

13. **Comments** — komentar sebagai penutup rasa malu atas kode buruk ("komentar bukan deodorant"); refaktor kodenya sampai tidak butuh komentar penjelas.
14. **Duplicate Code** — kode sama di beberapa tempat; ekstrak (Extract Method / Pull Up) agar ada satu sumber.
15. **Lazy Class** — class yang terlalu kecil sehingga biaya perawatannya melebihi manfaat; Inline Class / Collapse Hierarchy.
16. **Data Class** — class yang hanya berisi data + getter/setter tanpa perilaku; pindahkan logika yang memakai datanya ke dalam class tersebut.
17. **Dead Code** — kode yang tidak pernah dieksekusi (parameter tak terpakai, class tak terpakai); hapus total — version control sudah menyimpan riwayat.
18. **Speculative Generality** — abstraksi/kode dibuat untuk kebutuhan masa depan yang "mungkin" tidak pernah datang (unused generality); hapus, sederhanakan.

## Kategori 5 — Couplers (4 + 1 Other = 5 item)

Coupling berlebih antar class, atau coupling diganti delegasi berlebihan.

19. **Feature Envy** — method lebih tertarik pada data class lain daripada class-nya sendiri; pindahkan method ke class yang paling diminati (Move Method).
20. **Inappropriate Intimacy** — dua class saling mengintip bagian private satu sama lain terlalu sering; gunakan Move Method/Field atau Hide Delegate untuk memisah.
21. **Message Chains** — client memanggil rantai `a.getB().getC().getD()`; rapuh terhadap perubahan struktur; pecah dengan Hide Delegate.
22. **Middle Man** — class yang hanya meneruskan panggilan ke class lain tanpa kerja nyata; kurangi dengan Remove Middle Man (client panggil langsung) atau biarkan sebagian delegasi.
23. **Incomplete Library Class** *(di halaman index termuat dalam blok Couplers; di navigasi situs masuk kategori "Other Smells")* — library tidak menyediakan fungsi yang kamu butuhkan dan tidak boleh diubah; tambah lewat Introduce Foreign Method / Introduce Local Extension.

---

## Cara pakai ringkas

- Smell adalah gejala, bukan diagnosis final: konteks menentukan apakah refactor layak dilakukan.
- Tiap smell di situs dipetakan ke teknik refactoring spesifik (katalog /refactoring/techniques): mis. Long Method→Extract Method; Duplicate Code→Extract Method/Pull Up Method; Switch Statements→Replace Conditional with Polymorphism; Message Chains→Hide Delegate; Middle Man→Remove Middle Man.
