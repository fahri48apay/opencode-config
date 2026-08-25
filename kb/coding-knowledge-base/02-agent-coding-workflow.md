# 02 · Workflow Coding Agent (Cara AI Bekerja dengan Benar)

> Sintesis riset Agustus 2026 dari praktik resmi provider:
> - `sources/anthropic-claude-code-best-practices.md` — Anthropic engineering
> - `sources/agentic-coding-guidance-notes.md` — OpenAI Codex + Gemini CLI guidance
> - `sources/agents-md-spec.md` — standar AGENTS.md (Linux Foundation / AAIF)
> - `sources/anthropic-context-engineering.md` — context engineering untuk agent
> - Pelengkap: `~/ui-ux-knowledge-base/11-agent-skills-distinct-efficient.md`
>   (ponytail/caveman/stop-slop — berlaku juga untuk kode)

## 1. Aturan #1: verification loop harus runnable

Tanpa check pass/fail yang bisa dijalankan sendiri (test suite, build exit code, linter),
kamu adalah verification loop-nya user. Minta bukti output, bukan klaim "sudah selesai".

## 2. Workflow empat fase

```
EXPLORE → PLAN → IMPLEMENT → COMMIT
```

- **Explore**: baca file relevan dulu, tanpa mengubah apa pun.
- **Plan**: rincikan pendekatan; task ≥3 langkah pakai todo list.
- **Implement**: eksekusi rencana, diff minimal, ikuti konvensi codebase.
- **Commit**: hanya bila diminta; pesan commit menggambarkan tujuan, bukan isi mekanis.

Skip fase plan hanya untuk fix kecil yang sudah jelas.

### TDD ala agent (bila cocok)

Tulis test yang gagal → konfirmasi memang gagal → implement sampai lulus →
JANGAN mengubah test agar cocok dengan kode. Pengecualian test-first yang sah:
**regression test untuk bug yang baru ditemukan** (grug setuju).

## 3. AGENTS.md — README untuk agent

- Standar markdown terbuka, dipakai 60.000+ project; didukung Codex, Cursor, Copilot,
  Devin, Gemini CLI, opencode, Zed, Aider, dll.
- Isi populer: overview project, build/test commands, code style, testing instructions,
  security considerations, aturan PR/commit.
- **Pendek & akurat > panjang & vagu.** Uji tiap baris: "kalau baris ini dihapus,
  apakah agent akan salah?" Kalau tidak — hapus.
- Nested AGENTS.md untuk monorepo: agent membaca file TERDEKAT; terdekat menang konflik;
  instruksi chat user override semuanya.
- Agent akan otomatis menjalankan programmatic checks yang tercantum → cantumkan
  command lint/typecheck/test yang benar.
- Feedback loop: agent salah 2× soal hal sama → tambah rule di AGENTS.md.

## 4. Context engineering (kenapa context habis & cara hemat)

- **Context rot**: kemampuan recall model MENURUN saat token context naik — degradasi
  bertahap, bukan jurang. Prinsip utama: **set token terkecil ber-signal tinggi**.
- **Just-in-time retrieval > pre-retrieval**: simpan identifier ringan, load data saat
  dibutuhkan (query + head/tail), jangan muat semua di awal.
- **Compaction**: saat window penuh, ringkas — SIMPAN keputusan arsitektural, unresolved
  bugs, implementation details; BUANG tool output redundan.
- **Structured notes**: NOTES.md / todo persisten di luar context window menjaga koherensi
  sesi panjang (pola: Claude Plays Pokémon).
- **Subagent untuk investigasi**: eksplorasi banyak file di context terpisah, balikkan
  ringkasan distilasi (~1–2rb token) ke context utama.
- Nasihat resmi Anthropic: **"do the simplest thing that works."**

## 5. Failure patterns + fix persisnya

| Pattern | Gejala | Fix |
|---|---|---|
| Kitchen sink session | satu chat untuk segalanya, context rot | satu chat per coherent outcome |
| Koreksi berulang (>2×) | masalah sama balik lagi | mulai fresh dengan prompt lebih baik |
| Instruksi over-specified | file instruksi raksasa diabaikan | pangkas; uji per baris |
| Trust-then-verify | percaya klaim tanpa jalankan | selalu minta output command |
| Infinite exploration | muter-muter baca file | batasi scope eksplisit per turn |

## 6. Struktur prompt per task (ala Codex)

```
Goal:        apa hasil akhirnya
Context:     file/state/konvensi yang relevan
Constraints: batasan teknis & negative constraints ("do not use X")
Done when:   kondisi eksplisit "selesai" (test lulus, bug tak reproduce)
```

Negative constraint sering lebih efektif daripada instruksi positif vagu.
Sertakan output contract bila format penting.

## 7. Adaptasi ke environment kita (Termux + opencode)

- Ladder minimal (dari ponytail) sudah tertanam di agent `coding` — rung #2
  ("reuse yang ada") adalah padanan paling penting di codebase kecil.
- Bentuk command ringkas ala rtk manual: `git status --porcelain`, `--oneline`,
  `rg -l`, `jq -c` — 80% manfaat, 0% setup (lihat KB ui-ux file 11 §4).
- Micro-caveman HANYA on-demand saat sesi debug maraton; komunikasi default tetap enak dibaca.
