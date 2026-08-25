# 05 · Keamanan Dasar (untuk semua project)

> Sumber: `sources/owasp-top10-notes.md` — **OWASP Top 10:2025** (rilis final; dataset
> 2,8 juta aplikasi). Berlaku lintas bahasa — bukan cuma web server.

## 0. Non-negotiable untuk agent coding

1. **Jangan pernah commit/print/log secret.** API key, password, token → env var atau
   config eksternal. Sudah ter-commit = angka compromised, rotate SEKARANG (bukan hapus
   dari history saja).
2. **Validasi semua input di trust boundary**: parameter URL, body request, env var,
   file, CLI arg, payload webhook. Allow-list > deny-list.
3. **Fail closed**: kondisi tak terduga menolak akses / rollback transaksi — bukan
   lanjut dengan asumsi optimis.
4. Sebelum menambah dependency: cek reputasi, versi, lisensi. Dependency = code yang
   kamu jalankan tapi tidak kamu baca.

## 1. OWASP Top 10:2025 + mitigasi inti

| # | Risiko | Mitigasi inti |
|---|---|---|
| A01 | Broken Access Control | cek otorisasi di SERVER tiap request (bukan sembunyikan UI); deny by default; SSRF kini masuk kategori ini |
| A02 | Security Misconfiguration (naik 5→2) | hardening default; matikan fitur debug di prod; headers keamanan; error umum tanpa detail internal |
| A03 | Software Supply Chain Failures (BARU) | SBOM; scan deps transitif (CVE/OSV); harden CI/CD; signed artifacts; contoh bencana: SolarWinds, worm npm "Shai-Hulud" |
| A04 | Cryptographic Failures | jangan roll crypto sendiri; algoritma standar & library teruji; simpan password pakai argon2/bcrypt — BUKAN hash biasa |
| A05 | Injection | parameterized query selalu; jangan string-concat SQL/command/path |
| A06 | Insecure Design | threat model sederhana sebelum build; rate limit; batas ukuran/jumlah di level desain |
| A07 | Authentication Failures (rename) | MFA bila bisa; lockout/rate-limit login; session token aman (regenerasi setelah login) |
| A08 | Software/Data Integrity Failures | verifikasi signature/artifact; integritas pipeline CI; deserialization tak dipercaya = bahaya |
| A09 | Security Logging & Alerting Failures | log event keamanan (login gagal, akses ditolak) + ALERTING — log yang tak dibaca = tidak ada |
| A10 | Mishandling of Exceptional Conditions (BARU) | catch di lokasi kejadian; fail closed/rollback; global exception handler; rate limit/quota |

## 2. Checklist cepat saat menulis kode

- [ ] Semua input divalidasi (tipe, panjang, range, format)?
- [ ] SQL/command/path dibangun via parameter/API aman, bukan concat?
- [ ] Output HTML di-escape (XSS)? JSON API set content-type benar?
- [ ] Password/token TIDAK ada di log, error message, atau response?
- [ ] CORS/permission paling ketat yang masih berfungsi?
- [ ] Error user-facing generik; detail teknis hanya di log internal?
- [ ] Timeout + retry wajar untuk panggilan network?
- [ ] File upload: batas ukuran, tipe dicek isi (magic bytes), disimpan di luar webroot?

## 3. Kalau menemukan celah

- Laporkan ke user dengan severity + cara reproduce + fix konkret.
- JANGAN exploit lebih jauh dari perlu untuk membuktikan.
- Fix mengutamakan root cause (validasi/asal data), bukan filter gejala.
