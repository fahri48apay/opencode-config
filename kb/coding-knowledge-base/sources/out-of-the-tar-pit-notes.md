# Out of the Tar Pit — Notes

> Sumber: http://curtclifton.net/papers/MoseleyMarks06a.pdf — paper asli Ben Moseley & Peter Marks, 6 Februari 2006 (juga tersedia via papers-we-love: https://github.com/papers-we-love/papers-we-love/blob/master/design/out-of-the-tar-pit.pdf)
> Diakses: 2026-08-24
> Catatan: NOTES sintesis (bukan teks penuh; PDF asli sulit diparse) dari 5 sumber ringkasan:
> 1. Kyle M. Douglass — "Out of the Tar Pit: a Summary" — http://kmdouglass.github.io/posts/summary-out-of-the-tar-pit/ (2020)
> 2. Elvis Chidera — "Out Of The Tar Pit" (summary lengkap per-seksi) — https://elvischidera.com/papers/2022-01-02-summary-out-of-the-tar-pit.html
> 3. Abilian Innovation Lab — "Out of the tar pit (2006)" — https://lab.abilian.com/Tech/Papers/Out%20of%20the%20tar%20pit%20(2006)/
> 4. Schalk Venter reading-notes — https://github.com/schalkventer/reading-notes/blob/main/notes/out-of-the-tar-pit.md
> 5. Eric Normand — podcast "Out of the Tar Pit" — https://ericnormand.me/podcast/out-of-the-tar-pit

---

## 1. Tesis utama

> "Complexity is the single major difficulty in the successful development of large-scale software systems."

- Abstrak paper: setelah Brooks, dibedakan *accidental* vs *essential* difficulty — TAPI paper **menolak premis Brooks bahwa sebagian besar kompleksitas tersisa itu esensial**. Sebagian besar justru accidental dan bisa dieliminasi.
- Kompleksitas = derajat kesulitan memahami sistem ("hard to understand"), bukan kompleksitas algoritmik (big-O).
- "Software crisis" diidentifikasi 1968 dan sejak itu memburuk, bukan mereda.

## 2. Dua cara memahami sistem

| Pendekatan | Sifat | Kelemahan |
|---|---|---|
| **Testing** | dari luar (black box) | tes dengan satu set input memberi tahu **apa-apa** tentang perilaku pada set input lain; "have you performed the right tests?" — satu-satunya jawaban pasti adalah NEGATIF, saat sistem rusak |
| **Informal reasoning** | dari dalam (mental model) | terbatas, tidak presisi, rentan error |

- Informal reasoning LEBIH penting: selalu dipakai (bagian inheren proses development); perbaikan reasoning → lebih sedikit bug diciptakan; perbaikan testing hanya → lebih banyak bug terdeteksi.
- Dijkstra: "testing shows the presence of bugs, never their absence."
- Kesimpulan: jika harus memilih antara investasi di testing vs **kesederhanaan**, pilih kesederhanaan — memfasilitasi SEMUA upaya pemahaman di masa depan.

## 3. Penyebab kompleksitas (urutan kepentingan)

1. **State** (terutama *mutable* state) — penyebab #1.
   - Setiap tambahan 1 bit state → jumlah kemungkinan state total MENG-GANDA (eksponensial).
   - State membuat testing flaky: tes pada satu state memberi tahu apa-apa tentang perilaku pada state lain.
   - State "kontaminan": prosedur stateful mendekati stateless secara langsung maupun tak langsung ("nose of the camel in the tent").
   - Pengalaman umum: "coba restart / reload / reinstall" = bukti langsung penderitaan akibat state.
2. **Control** (urutan kejadian) — penyebab #2.
   - Bahasa imperatif MEMAKSA programmer menspesifikasi urutan (over-specify *how*, padahal yang diinginkan *what*) — contoh paper: `a := b + 3; c := d + 2; e := f * 4` — programmer cuma ingin relasi nilai, tapi dipaksa memilih urutan arbitrer; pembaca kode harus "menduplikasi kerja compiler".
   - Concurrency (shared-state) memperparah testing DAN informal reasoning.
3. **Code volume** — efek sekunder (sebagian kode hanya mengelola state/kontrol); termudah diukur; interaksi buruk dengan dua penyebab lain. Dijkstra: dengan abstraksi yang tepat, effort intelektual tidak harus naik super-linear terhadap panjang program.
4. Penyebab lain (duplikasi, abstraksi berlebih/terlewat, modularitas buruk, dokumentasi buruk) → semua bermuara ke 3 prinsip: **Complexity breeds complexity**, **Simplicity is Hard**, **Power corrupts** (bahasa yang terlalu powerful → sistem sulit dipahami; pilih bahasa/tool yang membatasi).

## 4. Kritik pendekatan klasik

- **OOP**: bergantung pada state di dalam objek; seluruh perilaku terpengaruh state → mewarisi penuh masalah state. *Intensional identity* (objek identik walau atribut sama) bertentangan dengan pandangan relasional (identitas via atribut). Enkapsulasi canggung untuk constraint lintas-objek. Kesimpulan paper: OOP **bukan fondasi yang memadai** untuk menghindari kompleksitas.
- **Functional programming**: referential transparency (input sama → hasil selalu sama) = jaminan kuat untuk testing & reasoning. Trade-off: kehilangan modularitas ala-state (tambah state tanpa menyentuh caller). Trade-nya: kompleksitas (shortcut sekali) vs kesederhanaan (keuntungan berkelanjutan) — seperti static typing: biaya sekali di depan demi keuntungan masa depan. Bahkan dalam FP bisa "mensimulasikan" global mutable pool via parameter ekstra → transparansi terjaga tapi reasoning hilang.
- **Logic programming** (Prolog): deklaratif murni = hanya aksioma; "running" = konstruksi bukti formal; idealnya tanpa state & tanpa control spesifik — namun implementasi pragmatis (mis. cuts Prolog) membocorkan kontrol.

## 5. Essential vs Accidental Complexity (definisi ketat)

- **Essential complexity**: melekat pada, dan merupakan esensi dari, MASALAH itu sendiri *sebagaimana dilihat user*. Yang tim harus hadapi **bahkan di dunia ideal**.
- **Accidental complexity**: sisanya — kompleksitas yang tidak akan perlu ditangani tim di dunia ideal (dari performance, bahasa, infrastruktur, detail implementasi: bytes, transistor, OS, dsb.).
- Uji ketatnya: *"if there is any possible way that the team could produce a system that the users will consider correct without having to be concerned with a given type of complexity then that complexity is NOT essential."*
- Semua detail implementasi (bahasa, OS, byte order...) = accidental. Hanya yang terkait domain user = essential.
- Paper TIDAK setuju dengan Brooks ("No Silver Bullet"): kompleksitas bukan properti inherent software; banyak kompleksitas software eksisting tidak essential.

## 6. Pendekatan yang direkomendasikan

**Dunia ideal**: tanpa concern performance; informal requirements → formal requirements (executable) → langsung dieksekusi (inti dari *declarative programming*). Satu-satunya concern: tak ada ambiguiti relevan.

Klasifikasi data (semua kecuali input = accidental state):
| Data | Mutability | Klasifikasi |
|---|---|---|
| Input (essential) | — | **Essential state** |
| Derived (essential) | immutable | Accidental state |
| Derived (essential) | mutable | Accidental state |
| Derived (accidental, mis. cache) | — | Accidental state |

- **Control sepenuhnya accidental** — biasanya tak disebut requirements user, jadi tak boleh masuk formal requirements.
- Dunia nyata: accidental complexity tetap dibutuhkan karena **performance** dan **ease of expression** (contoh: posisi karakter game secara teknis derivable dari seluruh riwayat input + waktu, tapi tidak natural diekspresikan begitu).
- **Strategi 2 kata: AVOID & SEPARATE**
  - Avoid: hindari state & control yang tidak benar-benar essential.
  - Separate: yang harus ada → pisahkan keluar dari sisa sistem sedalam mungkin.
  - Untuk performance: JANGAN kelola accidental state secara eksplisit di logika — cukup DEKLARASIKAN apa yang perlu disimpan/di-cache, biarkan infrastruktur terpisah menjalankannya (menghilangkan risiko inconsistent/bad state).
- Dua pemisahan kunci: **logic/state split** dan **accidental/essential split**.
- Tabel rekomendasi: Essential Logic → Separate; Essential State → Separate; Accidental useful (state/control, mis. caching, security, transport) → Separate; Accidental useless → **Avoid**.
- Kowalski: *"Algorithm = Logic + Control"* — "logic determines the meaning, control affects its efficiency".
- Komponen terpisah sifatnya beda-beda → idealnya pakai **bahasa berbeda per komponen**; "the weaker the language, the simpler it is to reason about".

## 7. The Relational Model (bukan sekadar database)

Empat aspek: **Structure** (relasi = set rekaman homogen, atribut bernama unik; base relations vs derived relations/views; relvar = variabel yang berisi nilai relasi), **Manipulation** (relational algebra Codd), **Integrity** (constraint deklaratif yang harus selalu true), **Data Independence** (pisahkan logika dari representasi fisik).

- 8 operasi relational algebra: Restrict, Project, Product, Union, Intersection, Difference, Join, Divide.
- Keunggulan struktural: **access path independence** — tidak perlu keputusan subjektif awal tentang jalur akses (kelemahan hierarchical & network model).
- **SQL (versi mana pun) BUKAN refleksi akurat relational model** (mengutip kritik Codd atas implementasi "impure").

## 8. Functional Relational Programming (FRP)

Arsitektur 4 komponen:
1. **Essential State** — definisi relasional dari komponen stateful (base relvars: nama + tipe saja).
2. **Essential Logic** ("behaviour") — definisi derived-relvar (relational algebra), integrity constraints, dan pure functions. Tidak boleh mereferensikan bagian accidental.
3. **Accidental State & Control** ("performance") — serangkaian performance "hints" deklaratif yang ISOLATED (tidak boleh saling referensi): apa yang di-cache/disimpan, eager vs lazy, paralel, fisika storage.
4. **Other** — interface ke dunia luar: **Feeders** (konversi input → relational assignments ke essential state) dan **Observers** (hasilkan output saat melihat perubahan derived relvars).

- Manfaat: menghindari data abstraction berlebihan — grouping data itu subjektif (grouping cocok untuk satu tujuan ≠ tujuan lain → reuse salah) dan data hiding besar mengerosi referential transparency. Relational model minim komitmen grouping subjektif; access path independence.
- Types: boleh disjoint union (enum-like), TIDAK boleh product types baru (hindari abstraksi data tidak perlu).
- Contoh di paper: sistem real estate sederhana.

## 9. MVC — intent asli (sesuai diskusi §4.5-ish paper)

Paraphrase dari pembahasan paper (via sumber 1, 3, dan pembacaan lintas-ringkasan):

- MVC dibahas sebagai **salah satu upaya nyata memisahkan essential dari accidental** di arsitektur aplikasi ber-UI.
- **Intent asli**: model = sisi essential (essential state + essential/business logic); view + controller = sisi accidental (presentasi & penanganan input/kontrol). MVC adalah langkah ke arah pemisahan yang dianjurkan paper.
- **Kritik paper terhadap MVC**:
  1. Pembatasan antara view dan controller mencerminkan **detail accidental teknologi implementasi GUI** (layar vs alat input era Smalltalk), bukan distingsi essential dari masalah user — jadi bukan garis pemisah essential/accidental yang sesungguhnya.
  2. View dan controller dalam praktik **saling terkopel erat** (di Smalltalk-80 datang berpasangan).
  3. Paling penting: MVC hanya memisahkan presentasi dari model — **tidak melakukan pemisahan essential vs accidental DI DALAM model itu sendiri**; model masih bisa penuh mutable state dan kontrol.
- Kesimpulan: MVC benar sebagian tapi tidak cukup → motivasi paper mengusulkan FRP yang memisahkan lebih tuntas (logic/state split + accidental/essential split, dengan accidental dideklarasikan ke infrastruktur).

## 10. Legacy & kritik

- Pengaruh besar pada komunitas FP & diskusi state management (immutability, pure functions, declarative).
- Turunan/praktik terinspirasi: **Eve** (bahasa eksperimental Chris Granger, discontinued), **Project:M36** (RDBMS algebra relasional murni), relational lenses.
- Kritik umum: FRP tidak pernah terbukti penuh di produksi saat paper ditulis; essential state di FRP tetap berupa mutable relvars (kritik Rich Hickey dalam talk "Deconstructing the Database"); minim detail interfacing dunia luar.
