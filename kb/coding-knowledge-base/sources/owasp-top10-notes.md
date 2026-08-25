# OWASP Top 10 — Notes (Top 10:2025, rilis final)

> Sumber: https://owasp.org/Top10/ → https://owasp.org/Top10/2025/ (+ halaman Introduction, A03, A10)
> Diakses: 2026-08-24
> Catatan: notes — versi terbaru yang berlaku adalah **OWASP Top 10:2025** (halaman /Top10/ redirect ke 2025; 8th installment). Daftar risiko + mitigasi inti per item.

## Status rilis 2025

- Top 10:2025 SUDAH rilis final (bukan draft) — gantikan Top 10:2021 sebagai edisi aktif.
- 2 kategori baru + 1 konsolidasi. Fokus pada **root cause over symptoms**.
- Dataset: ~2,8 juta aplikasi dari kontributor (Accenture, Bugcrowd, Contrast, Orca, Probely, Semgrep, Sonar, Veracode, Wallarm, dll); 589 CWE dianalisis; 248 CWE masuk 10 kategori; rata-rata 25 CWE/kategori (cap 40).
- Metodologi: data-informed tapi bukan blindly data-driven — 8 kategori dari data, 2 dari community survey. Skoring exploitability/impact pakai CVSS v2+v3 (v4 belum dipakai).

## Perubahan penting vs 2021

- SSRF (A10:2021) **di-roll into** A01 Broken Access Control.
- A06:2021 "Vulnerable and Outdated Components" di-expand menjadi **A03 Software Supply Chain Failures** (ekosistem dependencies, build systems, distribusi).
- A07 rename: "Identification and Authentication Failures" → **Authentication Failures**.
- A09 rename: "...Monitoring Failures" → **Security Logging & Alerting Failures** (penekanan alerting: logging bagus tanpa alerting minim nilainya).
- Kategori baru: **A10 Mishandling of Exceptional Conditions** (24 CWE: improper error handling, logical errors, failing open).
- Posisi: Security Misconfiguration naik #5→#2; Crypto turun #2→#4; Injection turun #3→#5; Insecure Design #4→#6.

## Daftar 10 risiko + mitigasi inti

1. **A01:2025 — Broken Access Control** (#1 lagi; rata-rata 3,73% aplikasi terkena; 40+ CWE)
   Mitigasi inti: deny by default kecuali explicitly public; enforcement akses di server-side per request (authorization check pada setiap endpoint/object), gunakan ID acak tak berurut & verifikasi ownership; larang CORS sembarangan, log kegagalan kontrol akses, rate-limit API.

2. **A02:2025 — Security Misconfiguration** (naik ke #2; 3,00% aplikasi)
   Mitigasi inti: proses hardening otomatis & repeatable (IaC), minimal platform tanpa fitur/sample/default credential, baseline configuration terdokumentasi dan diverifikasi; patching rutin + segmented architecture.

3. **A03:2025 — Software Supply Chain Failures** (baru, ex-A06:2021; top-ranked community survey 50%; avg exploit & impact tertinggi)
   Mitigasi inti: kelola SBOM termasuk dependensi transitive, scan CVE/NVD/OSV kontinu (Dependency-Check/Track, SCA), hapus dependency tak terpakai, hanya ambil komponen resmi/tertandatangan; harden CI/CD & repo (MFA, least privilege, separation of duties, signed builds/artifacts), staged rollout/canary agar vendor compromise tidak langsung merembet ke semua sistem.

4. **A04:2025 — Cryptographic Failures** (#4)
   Mitigasi inti: klasifikasi data sensitif, enkripsi in-transit (TLS kuat, HSTS) dan at-rest dengan algoritma modern (AES, SHA-256+) & authenticated encryption; jangan simpan data sensitif yang tidak perlu, hashing password dengan Argon2/bcrypt/scrypt/PBKDF2, key management & rotasi yang benar, hindari crypto custom/lama.

5. **A05:2025 — Injection** (#5; termasuk XSS s/d SQLi)
   Mitigasi inti: validasi input positif/allow-list, gunakan safe API (parameterized queries/prepared statements/ORM) alih-alih menyambung string query; escape dinamis via template engine dengan contextual escaping, batasi error message detail, gunakan LIMIT & kontrol SQL mass assignment.

6. **A06:2025 — Insecure Design**
   Mitigasi inti: SDLC aman dengan threat modeling untuk desain kritis & arsitektur trust boundary jelas; secure design patterns/paved-road components; pisahkan tier, rate limiting, unit & integration test untuk tiap critical flow (business logic).

7. **A07:2025 — Authentication Failures** (#7; nama baru)
   Mitigasi inti: multi-factor authentication; tidak ada default credentials cek password lemah (top-10000 breached passwords); align dengan NIST 800-63b; gunakan auth framework standar, proteksi credential stuffing (rate limiting, monitoring anomali login), session handling aman post-auth.

8. **A08:2025 — Software or Data Integrity Failures** (#8; level lebih rendah dari A03)
   Mitigasi inti: verifikasi integrity software/data via digital signature (signed updates, packages, artifacts) dan provenance; pastikan CI/CD pipeline punya access control/segregation; jangan deserialize data untrusted tanpa integritas check; update serializer/library aman; anti-tampering logs.

9. **A09:2025 — Security Logging & Alerting Failures** (#9; penekanan ALERTING)
   Mitigasi inti: log semua event security penting (auth failure, kontrol akses gagal, tampering) dengan format terstruktur & context user/IP; lindungi log dari tampering; **alerting aktif** agar log memicu tindakan (SIEM/integrasi incident response), karena "great logging with no alerting is of minimal value".

10. **A10:2025 — Mishandling of Exceptional Conditions** (BARU; 24 CWE; max incidence 20,67%)
    Mitigasi inti: "expect the worst" — catch & handle error di tempat kejadian dengan aksi bermakna (inform user secara aman, log, alert), global exception handler cadangan, **fail closed**: rollback seluruh transaksi saat error di tengah jalan; centralized error handling + strict input validation; rate limiting/resource quotas/throttling agar kondisi exceptional tidak muncul; jangan bocorkan sensitive info di pesan error (CWE-209).

## Angka kunci untuk sintesis

- Avg incidence: A01 3,73% | A02 3,00% | A03 5,72% (max 9,56%) | A04 3,80% | A05 — | A07/A08/A09 — | A10 2,95% (max 20,67%).
- A03: hanya 6 CWE mapped tapi total occurrence 215.248; avg weighted exploit 8,17 & impact 5,23 (tertinggi).
- Contoh serangan di dokumen: SolarWinds 2019 (~18.000 organisasi), Bybit 2025 ($1,5 Miliar, supply chain attack wallet), worm npm "Shai-Hulud" 2025 (>500 package versions, self-propagating), Log4Shell CVE-2021-44228.
