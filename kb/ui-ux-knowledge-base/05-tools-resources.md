# 05 — Tools & Resources: Miro, OriginKit, LottieFlow, free-for.dev

> Empat sumber ini menutup pipeline indie end-to-end:
> **Miro** = artefak proses/discovery → **OriginKit + LottieFlow** = lapisan polish
> frontend → **free-for.dev** = infrastruktur produksi $0.

---

## Miro (miro.com/templates)

**Apa**: infinite canvas + ekosistem template (7.000+, komunitas "Miroverse" sudah
merged ke /templates). Nilai terbesar untuk designer solo: **library framework UX
battle-tested yang strukturnya bisa di-clone ke tool mana pun** (Figma/FigJam/Notion/Penpot).

### Template UX inti (kategori "Research & design" = 1.806 template; UX collection = 465)
| Artefak | Kapan pakai |
|---|---|
| Empathy Map (Say/Think/Do/Feel) | Awal discovery, setelah wawancara |
| Customer Journey Map | Memetakan pain point per tahap |
| Persona (106 varian) | Menyinkronkan pemahaman target user |
| User Story Map (Jeff Patton) | Prioritas release sebelum coding |
| Lean UX Canvas | Hipotesis → eksperimen ringkas |
| Double Diamond | Kerangka proses problem→solution |
| Heuristic evaluation template | Audit NN/g self-service |
| Usability testing script | Konsistensi sesi riset |
| Wireframe kit lo-fi + Storyboarding toolkit | Ide cepat pre-hi-fi |

Heavy hitters: Design Sprint Jake Knapp (11K uses), AJ&Smart Remote DS (12K).
Ada AI Sidekicks (Design Wireframes, Workshop Planning, dll).

**Takeaway**: jangan reinvent artefak proses — clone trio
Empathy Map → User Story Map → Journey Map sebagai discovery stack standar.
Board Design Sprint bisa jadi checklist self-facilitation saat stakeholder cuma satu.

---

## OriginKit (originkit.dev)

**Apa**: ~260 komponen UI animasi gratis, model copy-paste-you-own (ala shadcn).
Distribusi **AI-first via MCP server** (`mcp.originkit.dev`) — coding assistant bisa
browse/fetch komponen langsung ke codebase.

**Inventory**: Text (64) · Background (43) · Interactive (34) · Gallery (29) · Image (25)
· Button (21) · Cursor (21) · Animations (19). Contoh: Text Morph, Scramble Text,
Pixel Reveal, Electric Border, Coverflow Carousel, Snow Fall.

**Stack target**: React / Next.js / Vite / **Framer** · styling CSS/Tailwind/CSS Modules · TS opsional.

**Lisensi & batas**: akun gratis + API key (`cmp_live_…`); **10 source fetch/hari**
(reset tengah malam UTC) — browse dulu lalu batch-fetch dengan sengaja.
Repo plugin MIT; cek lisensi per-komponen untuk redistribusi komersial.

**Kapan pakai**: hero/marketing-page motion (background, text effect, gallery) di mana
animasi custom makan waktu berhari-hari. Cocok untuk workflow Framer→produksi React/Tailwind.

---

## Finsweet LottieFlow (finsweet.com/lottieflow)

**Apa**: library Lottie JSON animasi ikon gratis (berorientasi Webflow tapi JSON
dipakai di mana saja via `lottie-web`/`lottie-react`). Pilih ikon → ubah hex →
pilih easing → download JSON. File kecil, vektor scalable, triggerable hover/click/scroll.

**20 kategori memetakan state UI nyata**: 404 · Arrow · Attention · Checkbox ·
Countdown · CTA · Dropdown · Ecommerce · Loading · Media · Menu Nav · Play ·
Radio · Scroll Down/Top · Search · **Success** · Communication.

**Aturan pakai**: micro-interaction pada PERUBAHAN STATE (checkbox, toggle,
success/error, loading, menu) adalah perceived-quality win termurah di web UI.
Tapi hemat: loading + success + satu signature CTA beats menganimasikan semuanya.

---

## free-for.dev

**Apa**: katalog kurasi komunitas (1.600+ kontributor) SaaS/PaaS/IaaS dengan
free tier sungguhan (≥1 tahun, bukan trial). Peta kanonis untuk ship MVP $0.

### Stack MVP $0 yang sudah terbukti ada
| Kebutuhan | Opsi standout |
|---|---|
| Static hosting | Cloudflare Pages (500 build/bln) · Vercel · Netlify |
| Serverless | Cloudflare Workers 100k req/hari · AWS Lambda 1M/bln · Cloud Run 2M/bln |
| Database | Supabase (DB+auth+storage) · Neon Postgres (100 project) · Turso · Upstash Redis |
| Auth | WorkOS **1M MAU** · Clerk 50k MRU · Auth0 25k MAU |
| Email | Resend 3k/bln (+domain custom) · Brevo 9k/bln · Mailtrap 4k/bln |
| Analytics/Error | PostHog 1M event/bln + survey · Sentry 5k errors · Umami/Plausible OSS |
| AI | Google AI Studio (Gemini Flash gratis) · OpenRouter model gratis · Tavily 1k req |

Contoh stack lengkap: Cloudflare Pages + Workers/D1/R2 + Supabase/Neon +
WorkOS/Clerk + Resend + PostHog + Sentry + Google AI Studio.

**Gotcha**: beberapa tier hanya 12 bulan; Oracle reclaim idle instance;
cek ulang tiap kuartal (alasan repo ini eksis).

---

## Ringkas: pipeline indie lengkap

```
DISCOVERY   : Miro templates (empathy map → story map → journey map)
DESIGN      : Penpot/Figma + token semantic (lihat 01-fondasi)
PATTERN     : Mobbin/PageFlows/chamjo (question-first)
BUILD       : OriginKit (komponen animasi) + LottieFlow (micro-interaction state)
SHIP $0     : free-for.dev stack
UKUR        : PostHog + Sentry
ITERATE     : audit BFM-style vs kompetitor
```
