# 11 · Agent Skills: Desain Distingtif & Efisiensi Agent

> Deep dive 5 skill agent populer (riset & verifikasi sumber asli: Agustus 2026).
> Semua SKILL.md mentah tersimpan di `sources/` — baca itu kalau butuh teks persisnya.
> Fokus file ini: **apa filosofinya, apa buktinya (termasuk kritiknya), kapan dipakai,
> dan cara adaptasinya ke workflow kita (opencode + Penpot + Coffee Tongkrong).**

## Peta besar: 5 skill = 5 layer yang tidak saling tumpang-tindih

```
APA YANG DIBUAT        → ponytail   (YAGNI ladder; governs what you build)
BAGAIMANA MEMBANGUN    → rtk        (filter output CLI sebelum masuk konteks)
BAGAIMANA BERBICARA    → caveman    (kompresi gaya jawaban; governs prose)
BAGAIMANA MENULIS      → stop-slop  (eliminasi pola tulisan AI; governs copy/prose kualitas)
BAGAIMANA TERLIHAT     → frontend-design Anthropic (desain distingtif anti-template)
```

Pembagian ini eksplisit di repo-nya sendiri: ponytail menulis *"governs what you build,
not how you talk (pair with Caveman for terse prose)"*. Jadi kombinasi mereka valid,
bukan redundan.

---

## 1. `frontend-design` — Anthropic (resmi)

- **Sumber**: `anthropics/skills` → `skills/frontend-design/SKILL.md` (±300 rb install, skill terpopuler di ekosistem). Teks lengkap: `sources/anthropic-frontend-design.md`.
- **Masalah**: output desain AI terkluster ke beberapa "wajah default" yang sama terus, apa pun subjeknya.

### Kalibrasi anti-template (bagian paling berharga — hafalkan 3 look generik AI saat ini)

1. **Cream + serif + terracotta**: bg krem hangat (≈`#F4F1EA`) + display serif kontras tinggi + aksen terracotta.
2. **Near-black + satu aksen asam**: bg hampir hitam + hijau asam / vermilion tunggal.
3. **Broadsheet**: garis rambut hairline, border-radius nol, kolom padat gaya koran.

Ketiganya sah untuk brief tertentu — tapi mereka *default*, bukan *pilihan*. Brief yang
menyebut arah visual secara eksplisit SELALU menang (termasuk kalau brief minta salah satu
look di atas); kebebasan yang tersisa jangan dibelanjakan pada default.

### Proses kerja (brainstorm → plan → critique → build → critique lagi)

1. **Ground in the subject**: pin subjek konkret + audiens + SATU pekerjaan halaman. Kosakata visual diambil dari dunia subjek (material, artefak, jargon bidang itu).
2. **Token system dulu, kode kemudian**:
   - Color: 4–6 hex BERNAMA.
   - Type: ≥2 peran (display berkarakter yang dipakai hemat, body pelengkap, utility face untuk caption/data bila perlu).
   - Layout: konsep 1 kalimat + ASCII wireframe untuk membandingkan opsi.
   - **Signature**: ELEMEN TUNGGAL yang jadi ciri halaman ini. "Spend your boldness in one place" — selebihnya tenang dan disiplin.
3. **Self-critique plan sebelum koding**: bagian mana yang akan sama persis dengan yang kamu buat untuk brief lain? Revisi dulu.
4. **Quality floor diam-diam**: responsif sampai mobile, focus keyboard terlihat, reduced-motion dihormati — tanpa perlu diumumkan.

### Prinsip lain yang layak dicatat

- Hero = tesis halaman. "Big number + small label + gradient" adalah jawaban template.
- Struktur adalah informasi: penomoran `01/02/03` hanya jika urutan benar-benar bermakna.
- Copy adalah material desain, bukan dekorasi. Active voice; "Save changes" bukan "Submit";
  nama aksi konsisten sepanjang flow (tombol "Publish" → toast "Published").
- Error tidak minta maaf dan tidak mengambang: jelaskan apa yang rusak + cara memperbaiki.
- Gotcha teknis: hati-hati CSS specificity saling meniadakan (.section vs .cta) — sering kejadian di padding/margin antar-seksi.
- Aturan Chanel: sebelum selesai, lepas SATU aksesori.

### Relevansi langsung ke Coffee Tongkrong

Project kita SUDAH mempraktikkan banyak poin ini tanpa sadar: palet bernama (base/surface/
accent/caramel/cream), signature element (bean-float sinematik), copy berbahasa pengguna
("siap ±10 mnt — tunjukkan no. pesanan ke kasir"). Skill ini memberi nama formal untuk
proses itu + checklist agar halaman BERIKUTNYA (Detail Menu/Pesanan) tidak melorot ke
template. Catatan penting: estetika coffee-shop gelap-oranye kita adalah PILIHAN dari dunia
subjek (kopi), bukan default #2 di atas karena ada alasan brand di baliknya.

---

## 2. `ponytail` — DietrichGebert

- **Sumber**: `DietrichGebert/ponytail` (~108k★; MIT). Teks lengkap: `sources/ponytail-SKILL.md`.
- **Masalah**: agent over-build — instal library untuk date picker padahal `<input type="date">`.
- **Persona**: "lazy senior dev" = efisien, BUKAN ceroboh.

### The ladder (7 anak tangga, berhenti di rung pertama yang menahan beban)

1. Perlu ada sama sekali? (YAGNI — kebutuhan spekulatif = skip, sebut 1 baris)
2. Sudah ada di codebase? → reuse (re-implementasi yang ada beberapa file di sebelah = slop paling umum)
3. Stdlib bisa? → pakai.
4. Fitur native platform? (`<input type="date">`, CSS over JS, DB constraint over app code)
5. Dependency yang sudah terpasang bisa?
6. Bisa satu baris?
7. Baru kemudian: kode minimum yang bekerja.

### Aturan pendamping yang sering dilewatkan orang

- **Bug fix = root cause, bukan gejala**: grep semua caller dulu; guard di fungsi bersama lebih kecil daripada guard di tiap caller.
- **Jangan pernah malas memahami masalah**: ladder memperpendek SOLUSI, bukan PEMBACAAN. Diff kecil di tempat yang salah bukan lazy — itu bug kedua.
- **Non-negotiable list**: validasi input di trust boundary, error handling pencegah data loss, security, aksesibilitas dasar, apa pun yang diminta eksplisit.
- **Simplifikasi disengaja ditandai**: komentar `ponytail:` yang menyebut ceiling + jalur upgrade (`# ponytail: global lock, per-account locks if throughput matters`).
- **Satu check runnable** untuk logika non-trivial (assert/self-check/test kecil) — YAGNI juga berlaku untuk test.
- Output: `[kode] → skipped: [X], add when [Y]`.

### Bukti — termasuk drama benchmark-nya (pelajaran metodologi!)

| Klaim | Realita |
|---|---|
| Benchmark awal: −80..94% LOC | Baseline "chatty" menggelembungkan angka. Colin Eberhardt (Scott Logic): prompt 7 kata *"Follow YAGNI principles and one-liner solutions"* mengalahkan skor skill tsb. |
| Benchmark v2 (rebuild jujur, agentic, FastAPI+React) | **−54% LOC rata-rata**, −22% token, −20% biaya, −27% waktu; −94% hanya di task ber-jebakan over-build, ≈0% di task yang sudah minimal. |
| JetBrains (SkillsBench, 80 task berpasangan, Sonnet) | Median **−15% kode**, −10.3% biaya; −31% pada build besar; kualitas: null result (65 identik / 9 turun / 6 naik) — tidak terbukti merusak, tapi juga bukan sertifikat aman. |

Pelajaran meta: ponytail MENGAKUI kritik, membangun ulang benchmark, dan menerbitkan
angka yang lebih rendah secara publik. Standar yang harus kita pakai saat menilai klaim
skill mana pun (lihat §7).

---

## 3. `caveman` — JuliusBrussee

- **Sumber**: `JuliusBrussee/caveman` (viral via HN/r/ClaudeAI; MIT). Teks lengkap: `sources/caveman-SKILL.md`. Asal-usul: post Reddit u/flatty ("why use many token when few token do trick"), dirilis formal oleh Drona Gangarapu sebagai CLAUDE.md drop-in lalu di-packaging Brussee.
- **Masalah**: token OUTPUT habis untuk basa-basi ("Sure! I'd be happy to help…").

### Inti aturan (versi paling tajam)

- Drop artikel/filler/pleasantries/hedging; fragment OK; sinonim pendek.
- **Yang TIDAK boleh hilang**: negasi (not/never/no/only/except — membalik makna), angka & satuan, istilah teknis, kode, error string (dikutip persis).
- **Anti-fake-compression** (cerdas!): jangan menambah kata demi terdengar caveman; jangan mengarang singkatan (cfg/impl/req/res — tokenizer memecahnya sama panjangnya, zero hemat, reader tetap harus decode); jangan pakai panah `→` (own token, hemat nol). **Kalau frasa caveman tidak lebih pendek dari frasa normal, pakai yang normal.**
- Auto-clarity: kembali bicara normal untuk warning keamanan, aksi ireversibel, urutan multi-langkah yang rawan misread.
- Boundary: hanya mengatur PROSA percakapan — commit message/docs/issue tetap normal.
- Level: lite / full / ultra (+ varian wenyan 文言文 untuk teks Mandarin).

### Bukti (jujur-jujurnya)

| Pengukuran | Hasil |
|---|---|
| Vendor benchmark (baseline "helpful assistant") | −65% output (peak −87%) |
| Kuba Guzik (72 run, Sonnet+Opus, baseline sudah "be concise") | **14–21%** level sesi; micro-prompt 6 baris (85 token) BEAT skill penuh 552 token (21% vs 9% di Opus) |
| JetBrains (paired A/B) | ±8–9% — jauh dari headline |
| Andrew.ooo (review) | 30–50% output realistis; output biasanya hanya 10–30% dari bill total → efek bill 5–15% |

**Micro-prompt 6 baris (milik Kuba Guzik, public domain-ish, MIT)** — versi yang kami
rekomendasikan bila ingin mode ini:

```
Respond like smart caveman. Cut all filler, keep technical substance.
Drop articles (a, an, the), filler (just, really, basically, actually).
Drop pleasantries (sure, certainly, happy to).
No hedging. Fragments fine. Short synonyms.
Technical terms stay exact. Code blocks unchanged.
Pattern: [thing] [action] [reason]. [next step].
```

Insight terpenting dari seluruh riset caveman: **hemat token terbesar datang dari CARA
KITA MEMINTA** ("Be concise. Return JSON." ≈ 60% penghematan), bukan dari mengubah gaya
output model. Prompt input > prompt gaya.

---

## 4. `rtk` (Rust Token Killer) — rtk-ai

- **Sumber**: `rtk-ai/rtk` (Apache-2.0; ~31–69k★ tergantung direktori). ⚠️ **Name collision**: ada `reachingforthejack/rtk` (Rust Type Kit) yang project BEDA — verifikasi dengan `rtk gain` (hanya Token Killer yang punya command ini).
- **Masalah**: plumbing, bukan model — output CLI dirancang untuk manusia, bukan LLM. `pytest` membuang 8.000 token padahal agent cuma butuh test mana yang gagal.

### Cara kerja

CLI proxy Rust single-binary. Hook PreToolUse menulis-ulang `git status` → `rtk git status`
secara transparan; agent menerima versi terkompresi semantik-equivalent. 4 strategi
kompresi. Statistik via `rtk gain`.

### Angka

| Operasi | Klaim vendor |
|---|---|
| `vitest run` | 102.199 char → 377 char (−99.6%) |
| `git status` | −59..76% |
| `npm install` | ~4.000 baris → ~15 |
| Sesi 30 menit | ~150rb → ~45rb token (−70%) |
| Klaim umum | 60–90% |

Caveat penting: hook hanya menangkap **tool Bash** — Read/Grep/Glob built-in agent tidak
lewat jalur ini. JetBrains ikut mengujinya (seri benchmark mereka; hasil di bawah klaim
vendor, seperti caveman & ponytail). Pola konsisten ketiganya: angka vendor diukur dengan
baseline yang belum dioptimasi.

### Relevansi ke environment kita

Environment Termux/opencode kita menjalankan banyak shell command. Prinsip rtk bisa
diadaptasi manual tanpa install apa pun: **selalu pilih bentuk output paling ringkas dari
satu command** (`git status --porcelain`, `--oneline`, `rg -l`, `jq -c`) — itu 80% manfaatnya
dengan 0% setup. Install biner hanya relevan kalau mulai menjalankan test-suite besar.

---

## 5. `stop-slop` — Hardik Pandya (+ toolkit wpgaurav)

- **Sumber utama**: `hardikpandya/stop-slop` (MIT; 2.8k–5.8k★). Teks lengkap: `sources/stop-slop.md`. Toolkit saudara: `wpgaurav/claude-code-skills` (stop-slop, red-pen, clarify, distill, quieter, polish, harden).
- **Masalah**: tulisan AI punya "tells": "Here's the thing", "Let that sink in", ritme metronomik, klaim kosong.

### 8 aturan inti

1. Cut filler phrases (throat-clearing, emphasis crutch, adverb).
2. Break formulaic structures: binary contrast ("not X, it's Y" → tulis Y saja), dramatic fragmentation ("Speed. Quality. Cost."), rhetorical setup, false agency ("complaints become fixes" → "we fix complaints").
3. Active voice; aktor manusia, bukan objek abstrak yang "melakukan".
4. Spesifik atau diam — larang vague declarative ("the stakes are high") dan lazy extremes ("always/never/every").
5. Reader dalam ruangan: "you" > "people".
6. Variasi ritme; dua item mengalahkan tiga; **no em dash** (tell klasik).
7. Trust readers — tanpa softening/hand-holding.
8. Kalimat terdengar seperti pull-quote? Rewrite jadi pernyataan polos.

### Rubrik skor 5 dimensi (1–10 each; <35/50 = revisi)

Directness · Rhythm · Trust · Authenticity · Density.

### Toolkit wpgaurav — versi DESAIN dari filosofi yang sama (sangat relevan untuk kita)

| Skill | Fungsi desain/kode | Padanan kita |
|---|---|---|
| `clarify` | UX copy: apa yang terjadi + apa yang bisa dilakukan user, sisanya potong | Sudah kita pegang (ux-review + HANDOFF copy rules) |
| `distill` | Strip desain ke esensinya; mode default LLM adalah ADD, skill ini SUBTRACT | Pasangan sempurna frontend-design §Restraint |
| `quieter` | Turunkan volume desain terlalu ramai: saturation ↓, spacing ↑, weight ↓ | Counterweight anti "AI look" |
| `polish` | Pass akhir: spacing inkonsisten, radius beda, hover hilang | Checklist quality gate KB 07 |
| `harden` | Edge cases produksi: overflow teks panjang, RTL, data kosong, network lambat, keyboard/SR | Sebagian di ux-review (WCAG) — tambahkan edge-case list |

---

## 6. Sintesis: sistem gabungan untuk workflow kita

Urutan penerapan natural dalam satu sesi kerja UI:

```
MINTA  → prompt spesifik + "concise, structured" (pelajaran caveman §3)
BANGUN → ponytail ladder: reuse Penpot shape/token yang ada SEBELUM bikin baru
         (padanan rung 2: "sudah ada di board/tokens.css?")
DESAIN → frontend-design Anthropic: token system → signature element → self-critique
         vs 3 default look → baru eksekusi
TULIS  → stop-slop untuk semua copy UI (error, empty state, label)
RAPIKAN→ quieter/distill kalau ramai · polish kalau mau ship · harden untuk edge cases
HEMAT  → bentuk command ringkas ala rtk; micro-caveman hanya saat sesi panjang boros
```

Adaptasi ladder ponytail untuk konteks Penpot (run 2 kita):
1. Perlu elemen baru sama sekali? (YAGNI visual — whitespace juga keputusan)
2. **Sudah ada di board/token?** (reuse `nav/*`, `cta/button-primary`, tokens.css, Feather set)
3. Komponen semantik Penpot / SVG path resmi (Feather Icons MIT)?
4. Fitur native (autolayout, constraint, interaction preset dissolve/push)?
5. Satu shape bisa? Baru group/frame kompleks.
6. Minimal yang bekerja + plugin-data `"anim"` bila animasi.

Checklist anti-slop-desain (gabungan frontend-design + distill + quieter + polish):

- [ ] Apakah palet/type/layout-nya akan sama persis untuk brief lain? Kalau ya, revisi.
- [ ] Ada SATU signature element? Sisanya tenang?
- [ ] Setiap elemen earn its place? (hapus satu "aksesori" ala Chanel)
- [ ] Penomoran/divider menyampaikan informasi nyata?
- [ ] Motion punya alasan naratif (bukan "biar hidup")? reduced-motion dihormati?
- [ ] Copy: active voice, spesifik, tanpa filler, error menjelaskan solusi?
- [ ] Ritme visual bervariasi (bukan grid kartu identik seragam tanpa hierarki)?
- [ ] Focus visible, target sentuh ≥44px, kontras AA — diam-diam, tanpa diumumkan?

## 7. Pelajaran meta: cara membaca klaim skill (pola dari 3 kasus)

1. **Vendor benchmark hampir selalu memakai baseline lemah** ("You are a helpful assistant"). Angka headline (−65%, −80%, −99%) valid pada baseline itu, tapi menyesatkan untuk pemakaian nyata yang baseline-nya sudah disiplin.
2. **Ukur sendiri dengan ccusage/sebelum-after**; hemat terbesar ada di INPUT (cara meminta), bukan gaya output.
3. **Skill markdown ≠ magic**: substansi ponytail ±100 baris markdown yang merestatement YAGNI. Nilai tambah aslinya = packaging, ergonomi install, dan persistensi aturan (hook/session) — bukan pengetahuan baru.
4. **Red flag proyek baik yang jadi baik**: koreksi benchmark secara publik (ponytail), dokumentasi kontaminasi harness sendiri. Itu sinyal trust yang lebih kuat daripada jumlah stars.

## 8. Keputusan penerapan di environment ini

- **ADOPS**: proses & prinsip frontend-design Anthropic (via checklist §6 + skill `distinct-ui` bila dibuat nanti), rubrik stop-slop untuk semua copy UI, ladder reuse Penpot.
- **SEDIKIT ADAPTASI**: micro-caveman 6 baris HANYA on-demand (sesi panjang/debug maraton). Jangan default — komunikasi dengan user harus tetap enak dibaca (dan bahasa Indonesia tidak punya "articles" untuk didrop; padanannya: potong basa-basi & hedging, jaga istilah teknis).
- **SKIP dulu**: install rtk biner (environment Termux + workload desain jarang menjalankan test suite besar; bentuk command ringkas manual cukup).

---

## Sumber & lisensi (semua MIT/Apache kecuali dicatat)

| Skill | Repo | File mentah lokal |
|---|---|---|
| frontend-design | `anthropics/skills` (LICENSE.txt resmi Anthropic) | `sources/anthropic-frontend-design.md` |
| ponytail | `DietrichGebert/ponytail` (MIT) | `sources/ponytail-SKILL.md` |
| caveman | `JuliusBrussee/caveman` (MIT) | `sources/caveman-SKILL.md` |
| stop-slop | `hardikpandya/stop-slop` (MIT) | `sources/stop-slop.md` |
| rtk | `rtk-ai/rtk` (Apache-2.0) | (dokumen INSTALL/website; lihat §4) |

Analisis independen: JetBrains blog (benchmark ponytail & rtk), InfoQ (koreksi benchmark
ponytail), Colin Eberhardt/Scott Logic (kritik benchmark), Kuba Guzik (caveman-micro,
72 run), andrew.ooo & bluemintservices (review caveman), deployhq & pasqualepillitteri.it
(ringkasan stack hemat token), gauravtiwari.org (filosofi toolkit slop).
