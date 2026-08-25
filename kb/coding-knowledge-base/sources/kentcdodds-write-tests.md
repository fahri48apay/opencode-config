# Kent C. Dodds — Write tests. Not too many. Mostly integration.

> Sumber: https://kentcdodds.com/blog/write-tests (URL varian `write-tests-not-too-many-mostly-integration` meng-404; kanonik: /blog/write-tests)
> Diakses: 2026-08-24
> Catatan: raw/padatkan. Artikel 13 Juli 2019; judul adalah kutipan tweet Guillermo Rauch (Des 2016).

## Bagian 1 — "Write tests."

- Ya, untuk mayoritas project tulis automated test — kalau kamu menghargai waktu sendiri. Lebih baik menangkap bug lokal lewat test daripada ditelfon jam 2 pagi.
- Pertanyaan kunci saat menulis test: seberapa besar CONFIDENCE yang diberikannya bahwa project bebas bug.
- Static typing + linting (TypeScript, ESLint) memberi confidence yang luar biasa dan sangat disarankan. TAPI bahasa strongly-typed pun tetap butuh test: typing/linting tidak bisa menjamin business logic bebas bug. Test suite yang bagus menaikkan confidence secara serius.

## Bagian 2 — "Not too many." (trade-off coverage)

- Mandat 100% code coverage dari manajer/tim = ide sangat buruk.
- Diminishing returns mulai terasa "much beyond 70%" coverage (angka intuitif bukan sains). Mengejar 100% berarti menghabiskan waktu mengetes hal tanpa logika (bug-nya sudah tertangkap ESLint/Flow), dan maintenance test semacam ini memperlambat tim.
- Mengejar coverage juga mendorong testing implementation details — memberi sedikit confidence dan melambatkan refactoring.
- Aturan praktis: kamu seharusnya SANGAT JARANG perlu mengubah test saat refactor kode. Kalau sering, test-mu nempel ke implementasi.
- Pengecualian yang diakui penulis: library open-source kecilnya memang 100% coverage — karena reusable luas (breakage berdampak ke banyak consumer) dan mudah dicapai.

## Bagian 3 — "Mostly integration." (trade-off unit vs integration vs e2e)

- Tiga bentuk automated testing paling umum: Unit, Integration, End-to-End.
- Testing Pyramid klasik (kombinasi Martin Fowler + Google Testing Blog): dari bawah ke atas Unit → Integration → E2E; makin ke atas makin lambat ditulis/dijalankan, makin mahal di-run & maintain → kesimpulan piramid: habiskan waktu terbanyak di unit test.
- YANG TIDAK DITUNJUKKAN piramid: makin ke atas, CONFIDENCE QUOTIENT tiap jenis test MENINGKAT — E2E lebih mahal tapi jauh lebih meyakinkan aplikasi bekerja sesuai maksud. Asumsi tools zaman dulu sudah tidak berlaku → selamat tinggal piramid, hello Testing Trophy (dibuat Feb 2018 via tweet).
- Argumen inti: tidak penting komponen A merender komponen B dengan props c dan d, kalau B jebol saat prop e tak disuplai. Unit test isolasi tidak buruk, tapi TIDAK BERGUNA kalau tidak juga verifikasi bahwa bagian-bagian BEKERJA BERSAMA. Dan seringnya, begimu mengetes kerja bersama, kamu bahkan tak perlu lagi test isolasi.
- Integration tests = titik seimbang terbaik antara confidence vs speed/cost → habiskan SEBAGIAN BESAR (bukan semua) usaha di sana.

## Cara menulis lebih banyak integration test

- Kunci tunggal terbesar: STOP MOCKING terlalu banyak hal. Setiap mock menghapus seluruh confidence atas integrasi antara yang dites dan yang dimock.
- Pengecualian sah: efek samping eksternal yang tak ingin dijalankan tiap test (kirim email asli, charge credit card).
- Untuk React: termasuk MENGHINDARI SHALLOW RENDERING (lihat artikel "Why I Never Use Shallow Rendering").

## Kesimpulan & rujukan lanjutan

- Tantangan terbesar bukan apakah testing berguna, tapi tahu WHAT to test dan cara mengetes yang memberi true confidence (bukan false confidence dari testing implementation details).
- Artikel lanjutan yang direkomendasikan: Static vs Unit vs Integration vs E2E for Frontend Apps, Testing Implementation Details, How to know what to test, Confidently Shipping Code.
