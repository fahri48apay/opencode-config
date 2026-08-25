# The Twelve-Factor App

> Sumber: https://12factor.net/
> Diakses: 2026-08-24
> Catatan: padatkan — metodologi + ringkas 1-2 kalimat per factor (tagline resmi dari index)

## Apa itu

Metodologi untuk membangun software-as-a-service, karya Adam Wiggins (Heroku), terakhir diupdate 2017. Tujuannya aplikasi yang:

- **Declarative** setup automation → onboarding developer murah & cepat;
- **Clean contract** dengan OS → portabilitas maksimal antar execution environment;
- Cocok untuk **deployment di cloud platform modern**;
- **Minimal divergence** dev vs production → continuous deployment;
- Bisa **scale up** tanpa ubah tooling/arsitektur/praktik.

Berlaku untuk bahasa apa pun dan kombinasi backing service apa pun (DB, queue, cache). Format terinspirasi buku Martin Fowler.

## Dua belas faktor

1. **Codebase** — *One codebase tracked in revision control, many deploys.*
   Satu codebase = satu repo (satu app). Banyak deploy (staging, prod, dsb.) dari codebase yang sama; versi berjalan = deploy. Berbagi kode antar app → jadikan library, jangan duplikasi codebase.

2. **Dependencies** — *Explicitly declare and isolate dependencies.*
   Deklarasikan semua dependency secara eksplisit via manifest (mis. `requirements.txt`, `Gemfile`) dan isolasikan via tooling (virtualenv/bundler); sistem tidak boleh mengandalkan package "implisit" yang kebetulan ada.

3. **Config** — *Store config in the environment.*
   Config (kredensial, URL service, dsb.) disimpan di environment variables, TERPISAH dari kode — kode identik di semua deploy, hanya config yang berubah; dilarang hardcode config/kredensial di repo.

4. **Backing services** — *Treat backing services as attached resources.*
   Database, queue, cache, SMTP diperlakukan sebagai attached resources: diakses via URL/kredensial di config, bisa ditukar (swap MySQL→Postgres) tanpa mengubah kode app.

5. **Build, release, run** — *Strictly separate build and run stages.*
   Pipeline tiga tahap: build (kode+dependencies → executable bundle), release (bundle + config spesifik environment), run (proses runtime); release bersifat immutable — perubahan berarti release baru, rollback = kembali ke release sebelumnya.

6. **Processes** — *Execute the app as one or more stateless processes.*
   Proses app stateless & share-nothing: data persisten disimpan di backing service (DB/cache), bukan di memori/filesystem lokal; apapun yang butuh persistensi harus external service.

7. **Port binding** — *Export services via port binding.*
   App self-contained dan mengekspos layarannya sendiri dengan bind ke port (mis. HTTP di `$PORT`), bukan bergantung webserver eksternal yang di-inject; satu app bisa jadi backing service bagi app lain.

8. **Concurrency** — *Scale out via the process model.*
   Scale dengan menambah proses (process types: web, worker) — bukan dengan membuat satu proses raksasa multi-threaded; tiap process type punya tanggung jawab tunggal, scale horizontal per type sesuai beban.

9. **Disposability** — *Maximize robustness with fast startup and graceful shutdown.*
   Proses harus disposable: start cepat (detik) dan shutdown graceful (selesaikan request, tutup koneksi, non-blocking exit) agar elastis terhadap restart/kill oleh platform; harus crash-tolerant & idempotent terhadap SIGTERM.

10. **Dev/prod parity** — *Keep development, staging, and production as similar as possible.*
    Minimalkan gap dev vs prod pada 3 sumbu: waktu (deploy kecil sering), people (dev yang tulis juga deploy), tools-services (stack seragam, termasuk backing services yang sama) — hindari "dev pakai SQLite, prod pakai Postgres".

11. **Logs** — *Treat logs as event streams.*
    Log adalah aliran event berurutan waktu; app hanya menulis ke stdout tanpa mengurus routing/storage; arsip/analisis log adalah urusan execution environment (dikumpulkan, dikirim ke indexer seperti Splunk/ELK).

12. **Admin processes** — *Run admin/management tasks as one-off processes.*
    Task admin/migrasi/maintenance dijalankan sebagai one-off process di environment yang sama dengan app biasa (kode sama, config sama, dependencies sama), mis. `python manage.py migrate`, REPL, script one-time.
