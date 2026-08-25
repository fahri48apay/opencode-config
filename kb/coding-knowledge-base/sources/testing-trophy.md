# Kent C. Dodds — The Testing Trophy and Testing Classifications

> Sumber: https://kentcdodds.com/blog/the-testing-trophy-and-testing-classifications
> Diakses: 2026-08-24
> Catatan: raw/padatkan. Artikel 3 Juni 2021.

## Deskripsi diagram Testing Trophy

Ilustrasi: sebuah piala (trophy) dibagi 4 lapisan horizontal, dari atas ke bawah:

1. **End to End** (paling atas/kecil, hitam) — sedikit; mahal & lambat, confidence tertinggi.
2. **Integration** (pita TERBESAR di badan piala) — mayoritas usaha testing.
3. **Unit** (lapisan lebih tipis di bawah integration).
4. **Static** (dasar piala) — type checking + linting (Flow/TypeScript, ESLint).

Dibanding Testing Pyramid (dasar lebar = unit, puncak = e2e), proporsi terbalik: bagian terbesar trophy adalah INTEGRATION. Trophy diposisikan sebagai panduan umum "return on investment" berbagai bentuk testing untuk aplikasi JavaScript. Tools yang disebut saat peluncuran (2018): E2E dengan Cypress, Integration & Unit dengan Jest, Static dengan Flow + ESLint.

## Definisi klasifikasi versi penulis

- Unit = test terhadap satu function/class/object berlogika yang TIDAK punya dependency (collaborator), atau collaborator-nya DI-MOCK untuk test itu.
- Integration = test yang mengetes BANYAK UNIT yang saling berintegrasi.
- E2E = memvalidasi sistem bekerja dengan mocking seminimal mungkin ("as little as possible").
- "Static" ditambahkan ke trophy karena di dunia JavaScript tipe statis bukan hal bawaan seperti bahasa lain ketika pyramid diperkenalkan.
- Konteks interpretasi: trophy dirancang dari sudut pandang UI/frontend engineer dan OWNERSHIP SATU CODEBASE — bukan klaim tentang microservices/backend/serverless. Terapkan dalam batas kode yang kamu miliki.
- Mengapa definisi custom? Ada ~24 definisi berbeda "unit test" (kutipan via Martin Fowler, artikel "test shapes", 2021). Upaya menyatukan definisi futile; yang penting TIM SEPAKATI definisi sebelum diskusi produktif.

## Poin-poin kunci lain

- Sejarah: tweet Guillermo Rauch (Des 2016) → artikel "Write tests" (Okt 2017) → tweet Testing Trophy (Feb 2018) → Testing Library (Apr 2018). Testing Library dapat rating "Adopt" di ThoughtWorks Technology Radar (Mei 2020).
- Testing Library bisa dipakai untuk SEMUA level: komponen tunggal (unit), full page dengan HTTP di-mock via MSW (integration), full app nyaris tanpa mock (e2e), custom hooks (unit low-level).
- Backend juga: swyx mencatat "Integration > Unit tests adalah conventional wisdom baru"; backend punya padanan "Testing Honeycomb" (Spotify Eng, adv. Yan Cui).
- Kutipan Justin Searls (penting): perdebatan persentase jenis test adalah DISTRACTION — hampir tidak ada tim yang menulis test ekspresif dengan boundary jelas, cepat, reliabel, dan hanya gagal karena alasan berguna. Fokuslah ke sana.
- Kutipan Tim Bray ("Testing in the Twenties"): jangan menganggap tenet software-testing sebagai pengetahuan ilmiah.
- Prinsip pemandu (tweet Mar 2018): **"The more your tests resemble the way your software is used, the more confidence they can give you."** — prinsip dasar Testing Library dan cara penulis memandang setiap masalah testing.
- Kerangka ekonomi: return = confidence; investment = time. Waktu tak terbatas → tak perlu klasifikasi; karena terbatas, trophy membantu memutuskan ke mana usaha dialokasikan.
- Rekomendasi penulis untuk arsitektur: sepakati dengan Tim Bray — mayoritas kita sebaiknya menulis monolith kalau bisa.
