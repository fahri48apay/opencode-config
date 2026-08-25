# Sumber mentah — PAIR Guidebook (Google People + AI)

> Dari: pair.withgoogle.com/guidebook (edisi ke-2; fokus GenAI) + PDF bab resmi + codelab
> codelabs.developers.google.com/codelabs/pair-guidebook. Disimpan Agustus 2026.
> Ringkasan analisis di `../16-desain-produk-ai.md`.

## 6 bab resmi

1. **User Needs + Defining Success** — irisan kebutuhan user × kekuatan AI; automate vs augment; reward function.
2. **Data Collection + Evaluation** — terjemahkan kebutuhan user → kebutuhan data; sumber data bertanggung jawab; desain untuk labeler.
3. **Mental Models** — set ekspektasi adaptasi; onboard in stages; plan for co-learning; akui batas (bukan "AI magic").
4. **Explainability + Trust** — explain for understanding, not completeness; model confidence display; 6 lever trust.
5. **Feedback + Control** — komunikasikan value & time-to-impact feedback; balance kontrol vs automasi; opt-out mudah.
6. **Errors + Graceful Failure** — definisikan error (user/system/context); selalu ada way forward.

## 7 pertanyaan navigasi (edisi ke-2)

1. Kapan & bagaimana pakai AI di produk?
2. Bagaimana membangun dataset secara bertanggung jawab?
3. Bagaimana membantu user membangun & mengalibrasi trust?
4. Bagaimana meng-onboard user ke fitur AI baru?
5. Bagaimana menjelaskan sistem AI ke user?
6. Berapa keseimbangan kontrol user vs automasi?
7. Bagaimana mendukung user saat terjadi kesalahan?

## Framework copy onboarding (verbatim dari guidebook)

```
This is { your product or feature },
and it'll help you by { core benefits }.
Right now, it's not able to { primary limitations of AI }.
Over time, it'll change to become more relevant to you.
You can help it get better by { user actions to teach the system }.
```

## Kriteria automate vs augment

**Automate bila**: tugas boring/repetitif/awkward/dangerous; butuh skala; ada standar benar yang
disepakati; user senang melepas kontrol. Ukuran sukses: efisiensi ↑, keselamatan ↑, tugas tedius ↓,
pengalaman baru yang mustahil tanpa automasi. Tetap sediakan human-on-the-loop: preview, test, edit, undo.

**Augment bila**: user menikmati tugasnya; nilai sosial tinggi; tidak ada kesepakatan cara benar;
user ingin "superpowers" bukan delegasi.

## 6 lever trust (worksheet resmi)

| Lever | Inti |
|---|---|
| Benevolence | Output sistem dimaksudkan baik bagi user; sensitif konteks sosio-kultural |
| Character | Values produk tercermin di perilaku/suara/postur yang cocok utk audiens |
| Authenticity | Mengakui keterbatasan di edge case; admission of inadequacy saat gagal |
| Integrity | Standar performa/kualitas terjaga; user tak rentan/berisiko |
| Explainability | Komunikasi cara kerja dalam bahasa yang dipahami user |
| Transparency | Sebab-akibat input→output bisa diprediksi user |

Latihan worksheet: peta momen kritis → rate pentingnya lever per segmen → brainstorm skenario
trust hilang / terjaga / BERLEBIHAN (over-trust = risiko nyata) → strategi penjelasan via matriks
2×2 dampak-user × confidence-AI → uji copy penjelasan dengan user research.

## Pertanyaan protokol uji trust (dari worksheet)

- "Seberapa percaya kamu pada rekomendasi ini?" (skala)
- "Apa pertanyaanmu tentang bagaimana sistem sampai ke rekomendasi ini?"
- "Apa yang akan meningkatkan kepercayaanmu?"
- "Seberapa puas kamu dengan penjelasan ini?"
