# Anthropic — Effective Context Engineering for AI Agents

> Sumber: https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents
> Diakses: 2026-08-24
> Catatan: notes/padatkan. Engineering blog Anthropic, published 29 Sep 2025. Tim Applied AI Anthropic.

## Definisi & latar

- **Context engineering** = evolusi prompt engineering: strategi mengkurasi dan memelihara SET token (informasi) optimal selama inferensi LLM — mencakup system instructions, tools, MCP, data eksternal, message history — bukan sekadar menulis prompt.
- Agent = "LLMs autonomously using tools in a loop" (definisi sederhana yang dikonvergensi industri).
- Masalah inti: agent yang berjalan dalam loop menghasilkan makin banyak data yang *mungkin* relevan; context engineering = seni memilih apa masuk ke window terbatas dari alam semesta informasi yang terus berevolusi.

## Mengapa penting: context rot & attention budget

- **Context rot**: seiring jumlah token di context meningkat, kemampuan model mengingat/mengambil info dari context MENURUN — muncul di semua model, hanya beda tingkat kelembutannya (riset needle-in-a-haystack, Chroma).
- Context = resource finite dengan diminishing marginal returns; LLM punya "attention budget" yang terdepleti tiap token baru.
- Akar arsitektural: transformer → setiap token attend ke semua token → relasi pairwise n² untuk n token; distribusi data training condong ke sekuens pendek → model lebih sedikit berpengalaman dengan dependency lintas-context panjang.
- Hasilnya gradasi performa (bukan jurang): model tetap sanggup di context panjang tapi presisi retrieval & reasoning jarak jauh menurun.

## Prinsip utama

- **Cari SET TOKEN PALING KECIL ber-sinyal tinggi yang memaksimalkan kemungkinan hasil yang diinginkan.** Informative yet tight.

### System prompts: "right altitude" (Goldilocks zone)
- Dua failure mode ekstrem: (1) hardcoding logika kompleks/rapuh di prompt → fragil, mahal maintain; (2) guidance vagu terlalu high-level / mengasumsikan shared context → tak ada sinyal konkret.
- Optimal: cukup spesifik memandu perilaku, cukup fleksibel memberi heuristik kuat.
- Organisasi: section terpisah (`<background_information>`, `<instructions>`, `## Tool guidance`, `## Output description`) dengan XML tagging atau markdown headers (meski formatting makin kurang krusial seiring kapabilitas model).
- Minimal BUKAN berarti pendek — info awal harus cukup agar perilaku terjaga. Metode: mulai dari prompt minimal + model terbaik → observasi failure mode → tambah instruksi/contoh sesuai kebutuhan.

### Tools design
- Tools = kontrak antara agent dan ruang info/aksinya → harus token-efficient DAN mendorong perilaku efisien.
- Self-contained, robust to error, sangat jelas tujuan pemakaian; parameter deskriptif & unambiguous; minimal overlap antar tool.
- Failure mode paling umum: **bloated tool sets** — cakupan terlalu luas / titik keputusan ambigu. Uji lakmus: kalau engineer manusia tak bisa memastikan tool mana yang dipakai di situasi X, agent tidak akan lebih baik.

### Examples (few-shot)
- Tetap best practice, TAPI: jangan menuangkan laundry list edge cases ke prompt. Kurasi SESET contoh kanonik yang diverse dan merepresentasikan perilaku ekspektasi. "Examples are the 'pictures' worth a thousand words."

## Context retrieval: just-in-time vs pre-retrieval (agentic search)

- Shift dari embedding-based pre-retrieval (proses semua data di depan) ke **"just-in time"**: agent menyimpan identifier ringan (file path, stored query, link) dan load data saat runtime lewat tools.
- Contoh Claude Code: analisis database besar via query tertarget + Bash `head`/`tail` tanpa pernah memuat objek data penuh ke context.
- Analogi manusia: kita tak menghafal korpus; kita bangun sistem organisasi/indexing (file system, inbox, bookmark) dan retrieve on demand.
- **Metadata adalah sinyal**: `test_utils.py` di folder `tests/` bermakna lain daripada nama sama di `src/core_logic/`; hierarki folder, konvensi penamaan, timestamp semua membantu agent (dan manusia) memutuskan kapan/bagaimana pakai info.
- **Progressive disclosure**: agent menemukan context bertahap lewat eksplorasi — ukuran file → kompleksitas; konvensi nama → tujuan; timestamp → proxy relevansi; hanya yang perlu disimpan di working memory.
- Trade-off: eksplorasi runtime LEBIH LAMBAT dari pre-computed retrieval; tanpa heuristik/tools tepat agent buang context untuk dead-end. Strategi terbaik sering HIBRIDA: Claude Code drop CLAUDE.md naively ke context di depan + navigasi JIT via glob/grep (bypass stale indexing).
- Nasihat tim: **"do the simplest thing that works."**

## Teknik long-horizon tasks (melewati batas context window)

Menunggu window lebih besar tidak menyelesaikan: context pollution & relevance tetap jadi masalah bahkan di window raksasa. Tiga teknik:

### 1. Compaction
- Ringkas percakapan mendekati limit → reinitiate window baru dari ringkasan. Lever pertama untuk koherensi jangka panjang.
- Implementasi Claude Code: history dilempar ke model untuk kompres; SIMPAN keputusan arsitektural, bug unresolved, implementation details; BUANG tool output redundan; lanjutkan dengan compressed context + 5 file terakhir yang diakses.
- Seninya: seleksi keep-vs-discard; compaction terlalu agresif membuang konteks halus yang pentingnya baru terlihat nanti.
- Tuning: mulai MAXIMIZING RECALL (tangkap semua info relevan) di trace kompleks → iterasi menaikkan PRECISION (buang superfluous).
- Bentuk paling aman & ringan: **tool result clearing** (hasil tool lama di history tak perlu dilihat ulang mentahnya).

### 2. Structured note-taking (agentic memory)
- Agent rutin menulis notes TERPERSISTEN DI LUAR context window, ditarik kembali saat dibutuhkan.
- Pola: to-do list Claude Code, custom NOTES.md; melacak progres task kompleks & dependency yang hilang lintas puluhan tool calls.
- Bukti non-coding: Claude Plays Pokémon — tally presisi ribuan langkah ("for the last 1,234 steps I've been training in Route 1..."), maps region terjelajah, strategi combat; setelah context reset agent baca notes sendiri dan lanjut sesi multi-jam secara koheren.
- Memory tool (public beta, platform Claude, era Sonnet 4.5): sistem file-based untuk simpan/konsultasi info di luar window — knowledge base antar waktu, project state antar sesi.

### 3. Sub-agent architectures
- Sub-agent khusus handle task fokus dengan CLEAN context windows; main agent koordinasi via high-level plan.
- Sub-agent bisa eksplorasi belasan-ribu+ token tapi HANYA mengembalikan summary terdistilasi (**seringkali 1.000–2.000 token**). Separation of concerns: detail pencarian terisolasi, lead agent fokus sintesis.
- Terbukti substansial lebih baik dari single-agent pada research kompleks (lihat juga post "multi-agent research system").

### Memilih teknik
- Compaction → task dengan back-and-forth intensif (jaga alur percakapan).
- Note-taking → development iteratif dengan milestone jelas.
- Multi-agent → riset/analisis kompleks yang untung dari eksplorasi paralel.

## Kesimpulan

- Tantangan bukan lagi craft prompt sempurna, tapi kurasi cermat apa yang masuk attention budget di tiap langkah. Model makin pintar → engineering makin minim-preskriptif dan otonomi naik — tapi memperlakukan context sebagai resource precious-finite tetap sentral.
