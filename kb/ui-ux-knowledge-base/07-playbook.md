# 07 — Playbook: Checklist Actionable untuk Project Ke Depan

> Distilasi semua sumber menjadi proses kerja. Urutan pakai: mulai project →
> discovery → design → build → pre-launch audit → post-launch.

---

## A. Kick-off project baru

- [ ] Definisikan pertanyaan riset pattern PERSIS (lihat template di 03-pattern-evidence.md)
- [ ] Clone artefak Miro: Empathy Map → User Story Map → Journey Map
- [ ] Cek `site:uxdesign.cc <topik>` untuk 2–3 esai prior-art yang dalam
- [ ] Riset kompetitor: 3–5 produk, task script identik ala Built for Mars
      (signup → core action → payment → cancel; catat langkah, kata/layar, waktu)
- [ ] Benchmark regional kalau target SEA/MENA: chamjo.design vs Mobbin baseline

## B. Setup design tokens (sekali, dipakai selamanya)

- [ ] Token SEMANTIK: `accent/on-accent/accent-container`, `surface-container-{lowest…highest}`, `outline`, `label/secondary-label` — bukan nama warna mentah
- [ ] Generate light + dark dari satu seed (Material Theme Builder / material-color-utilities)
- [ ] Type scale: kuadruple size+leading+tracking+weight per role (basis: skala 15-role M3 di 01-fondasi)
- [ ] Spacing scale konsisten (4/8 base); touch target ≥44px (iOS) / ≥48px (Android/web) dengan gap ≥8px
- [ ] State layer: hover 8% · focus 10% · pressed 10% · dragged 16% · disabled content 38%
- [ ] Motion tokens: micro-feedback 150–200ms · container 250–400ms · easing standard `cubic-bezier(0.2,0,0,1)`
- [ ] Breakpoint netral: <600 compact · 600–840 medium · 840–1200 expanded (+1200 large)

## C. Saat mendesain komponen

- [ ] Nama dari konsensus component.gallery (cek alias distribution); dokumentasikan jika menyimpang
- [ ] Perilaku membedakan komponen, bukan tampilan (Popover≠Tooltip, Select≠Dropdown menu)
- [ ] Setiap komponen custom: honor Dark Mode, Dynamic Type/font scaling 200%, Reduce Motion (fade > slide), Increase Contrast
- [ ] Semua ikon beri accessibility label
- [ ] Alert hanya untuk interupsi kritis (≤3 tombol, verb spesifik, destructive+Cancel); sisanya snackbar/banner/sheet dengan detent & grabber
- [ ] Tab bar = tempat, toolbar = aksi; navigasi persisten & berlabel

## D. Flow kritis (onboarding/paywall/cancel) — psikologi

- [ ] ≤5 langkah ke first value; sisanya "Skip/Later"
- [ ] Personalisasi maksimal 3–5 pertanyaan yang user sudah tahu jawabannya
- [ ] Progress visible (goal gradient); checklist dismissible
- [ ] Pre-permission layar custom sebelum dialog OS
- [ ] Empty state = onboarding (ajarkan langkah pertama, jangan kosong)
- [ ] Paywall muncul di batas kontekstual; value stack + social proof + framing absolut ("60 hari gratis" bukan "16% off")
- [ ] Cancel flow: pause + preserve data (bukan hostage); tanpa dark pattern
- [ ] Hapus navigasi saat signup/checkout (setiap link = exit ramp)

## E. Build (frontend)

- [ ] Semantic HTML dulu; ARIA hanya bila semantik tidak cukup
- [ ] `<button>` untuk aksi, `<a href>` untuk navigasi (jangan `<a href="#">`)
- [ ] Focus states terlihat; keyboard navigable penuh
- [ ] Kontras AA: 4.5:1 teks normal, 3:1 teks besar/UI
- [ ] Micro-interaction state changes via LottieFlow (loading/success/toggle) — hemat, jangan animasikan semuanya
- [ ] Motion halaman marketing: OriginKit components (budget 10 fetch/hari — browse dulu, batch-fetch)
- [ ] Uji di 360 / 768 / 1024 / 1440px + font scaling ekstrem

## F. Pre-launch quality gate

- [ ] Audit BFM-style: jalankan sendiri task script end-to-end, catat friksi numerik
- [ ] Bandingkan flow inti vs 3 kompetitor di Mobbin/PageFlows side-by-side
- [ ] Heuristic evaluation NN/g (pakai template Miro)
- [ ] Screen reader pass (VoiceOver/TalkBack)
- [ ] Copy UI: sentence case, verb spesifik <3 kata, judul bar <15 karakter
- [ ] Error states, loading states, empty states SEMUA terdesain
- [ ] Reduce Motion + keyboard-only walkthrough

## G. Ship $0 (free-for.dev stack referensi)

```
Frontend : Cloudflare Pages / Vercel
Backend  : Cloudflare Workers (100k req/hari) atau Supabase
DB       : Supabase / Neon Postgres
Auth     : WorkOS (1M MAU) / Clerk
Email    : Resend (3k/bln)
Analytics: PostHog (1M event/bln)
Errors   : Sentry
AI       : Google AI Studio (Gemini Flash) / OpenRouter free tier
```

## H. Post-launch

- [ ] Ukur: activation rate, time-to-first-value, drop-off per langkah funnel
- [ ] Pasangkan metrik dengan common sense (analytics melewatkan frustrasi)
- [ ] Hipotesis perbaikan dari prinsip psikologi (04-psikologi) → uji → iterasi
- [ ] Dokumentasikan keputusan desain + link bukti (Mobbin/chamjo/BFM) agar traceable

---

## Prinsip distilasi final (kalau cuma ingat 10 hal)

1. Pertanyaan dulu, browsing kemudian.
2. Bukti > opini: benchmark numerik sebelum membentuk rasa.
3. Token semantik + generate scheme programatik, jangan hard-code hex.
4. Konsensus penamaan itu nyata — ikuti kecuali ada alasan riset.
5. Progressive disclosure + escape hatch menaikkan completion.
6. Friksi kadang bagus; dark pattern selalu rugi jangka panjang.
7. Empty state adalah onboarding termurah.
8. Cantik ≠ usable — audit gaya dan fungsi terpisah.
9. Accessibility = table stakes dan niche hiring tercepat.
10. Ship > pixel-perfect; nilai designer pindah dari produksi ke judgment (era AI).
