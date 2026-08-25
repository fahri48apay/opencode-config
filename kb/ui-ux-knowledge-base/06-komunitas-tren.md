# 06 — Komunitas & Tren 2025–2026

> Reddit, Pinterest, dan ekosistem komunitas. Cara mengekstrak nilai maksimal
> tanpa tenggelam dalam noise.

---

## Reddit

| Subreddit | Best for | Pitfall |
|---|---|---|
| **r/UI_Design** (~235k) | Craft visual, feedback, rekomendasi tool | Bias estetika; noise self-promo |
| **r/UXDesign** (~243k) | Karier, proses, riset, reality-check gaji | Skews negatif/anxious; cari thread "brutal portfolio review" — signal tertinggi |
| **r/design_critiques** (~130k) | Kritik terstruktur sungguhan | Kualitas bergantung cara bertanya |
| **r/web_design** (~970k) | Praktik web, pricing, client stories | Broad; sort Top/bulan |
| **r/Frontend** / r/webdev | Batas desain-engineering, feasibility | Dev-centric — bagus untuk belajar pain point handoff |

**Protokol maksimal value**:
- Google dengan `site:reddit.com <topik>` (Reddit blokir fetch langsung).
- Sort Top → past year; baca comment chain, bukan post.
- Saat minta kritik: konteks + goal + pertanyaan spesifik + tahap fidelity. Bukan "thoughts?".
- Jangan debat feedback yang kamu minta sendiri.

**Buku yang berulang direkomendasikan lintas subreddit**:
Don't Make Me Think (Krug) · The Design of Everyday Things (Norman) ·
Designing with the Mind in Mind (Johnson) · Laws of UX (Yablonski) ·
Just Enough Research (Hall) · Ruined by Design (Monteiro) ·
100 Things Every Designer Needs to Know About People (Weinschenk) · Refactoring UI.

---

## Pinterest

- **Best for**: moodboard cepat; tiap pin menyimpan link sumbernya → bisa revisit versi interaktif asli.
- **Praktik kunci**: kurasi board **by pattern, bukan estetika** —
  ❌ "nice dark blue stuff" → ✅ "empty states", "onboarding flows", "data-table filters".
  Ini mengubah inspiration menjadi pattern library reusable.
- 10–20 referensi kuat per arah project; klik-through untuk apapun yang interaction-related.
- Keterbatasan: tidak ada layout/kolaborasi/annotation — untuk itu Milanote/FigJam.

## Platform showcase lain (sadar biasnya)

| Platform | Good for | Warning |
|---|---|---|
| Dribbble | Trend visual, craft polish | "Dribbble-ization": pretty screens abaikan a11y/performance/flow nyata. Perlakukan sebagai galeri seni |
| Behance | Case study penuh dengan proses; SEO kuat | Engagement komunitas lemah |
| Awwwards | Peak craft motion/WebGL/experimental | Award sites sering usability-hostile. Curi TEKNIK, bukan layout |
| Designer Hangout Slack (~18k) | Percakapan practitioner-grade, #jobs | Invite-only, waitlist sampai 8–12 minggu |
| ADPList | Mentoring 1:1 gratis (6.400+ mentor) | ROI tertinggi untuk junior — tapi kualitas = persiapan kamu |
| UX StackExchange | Q&A rigor untuk pertanyaan metodologi | Lambat; bukan tempat tren |
| Hacker News | Pandangan engineer jujur soal tren desain | Skeptis & teknis — cari via hn.algolia.com |
| Indie Hackers | Desain sebagai revenue, postmortem landing page | Lemah untuk diskusi craft |

---

## Wisdom yang terus berulang di semua komunitas

1. **Solve real problems** — dinilai dari outcome & dampak bisnis, bukan jumlah layar.
2. **Ship > pixel-perfect** — kesadaran feasibility adalah skill designer inti.
3. **Accessibility adalah table stakes** — kontras, reading order, DOM order screen reader; niche hiring tercepat.
4. **Case study = argumen, bukan diary**: problem → constraint → trade-off → metric yang bergerak. 2–5 deep > 10 shallow.
5. **Etika kritik**: observasi diikat ke goals, bukan preferensi ("I don't like it" = useless).
6. **Tren melayani user, bukan ego** — uji dengan user nyata.
7. **Debat tool < fundamental judgment** — tool downstream dari taste.

---

## Tren & perdebatan 2025–2026

### AI prototyping (diskursus dominan)
- v0 = UI taste terbaik, code rapuh · Lovable = favorit "looks good out of the box",
  runtuh di skala · Cursor = produksi engineering · Figma Make / Google Stitch =
  generasi in-canvas.
- Konsensus workflow: **"graduate workflow"** — prototipe di Lovable/v0 → export ke
  GitHub → graduate ke Cursor untuk produksi. Tools adalah fase, bukan kompetitor.
- **"Vibe design"** mainstream: prototype interaktif JADI deliverable stakeholder;
  Figma file jadi langkah polish — workflow dekade lalu terbalik.

### Design engineer role
Dari judul niche menjadi jalur karier bernama ($150–250K+ di Vercel/Linear/Stripe).
Framing Brad Frost: "front-of-the-front-end".

### Pasar kerja
Stabil tapi brutal di entry level; senior/research/design-systems/a11y/AI-product masih ketat.
Verdict NN/g: "UI is no longer a differentiator" — strategi & dampak terukur yang bedakan.

### Tren visual 2026
✅ Bento grid (default baru) · glassmorphism selektif/mature (pengaruh Apple Liquid Glass)
· dark-mode-first · generative/adaptive AI interface · ambient copilot AI (di sidebar,
bukan takeover) · kinetic & variable typography · spring-based motion · semantic design tokens.

❌ Out: neumorphism · everything-glass · static 3D render · infinite-scroll tanpa footer
· imagery AI yang obvious (user makin distrust).

### Tool landscape
Figma masih default (backlash harga pasca-IPO) · Penpot naik karena data-sovereignty/
self-host/open-source (healthcare, finance, sektor publik) · Sketch hanya survive di
boutique Mac-first.

---

## Rutinitas belajar mingguan (30–60 menit/hari)

| Hari | Aksi |
|---|---|
| Senin | Scan r/UXDesign + r/UI_Design top/minggu; simpan 1 insight |
| Selasa | Pass Dribbble/Awwwards (cap 15 menit); pin 3–5 item ke board bernama-pattern |
| Rabu | Satu sesi ADPList (minimal dua mingguan) ATAU jawab satu post r/design_critiques — memberi kritik = belajar tercepat |
| Kamis | hn.algolia.com cari "design"/"UI" — baca satu take skeptis engineering atas tren yang kamu suka |
| Jumat | Ship sesuatu: rebuild satu pattern tersimpan (v0/Lovable/Cursor/Penpot) |
| Sabtu | Posting hasil untuk dikritik |
| Minggu | Satu bab buku kanon; bulanan: satu deep case study Behance |

Kuartalan: audit tool AI mana yang benar-benar nempel vs hype; cek ulang free-for.dev tiers.
