# Anthropic — Best Practices for Claude Code

> Sumber: https://www.anthropic.com/engineering/claude-code-best-practices
> Diakses: 2026-08-24
> Catatan: padatkan. Halaman live kini berupa docs "Best practices for Claude Code" (evolusi dari blog engineering April 2025); struktur workflow & fitur sudah diperbarui Anthropic (slash commands lama → skills, dsb). Inti praktik lama tetap dipertahankan di bawah dan ditandai bila berasal dari edisi blog 2025.

## Prinsip dasar #1: context window adalah resource paling kritis

- Context window Claude Code memuat seluruh percakapan + setiap file yang dibaca + output command; satu sesi debugging bisa memakan puluhan ribu token.
- Performa LLM menurun saat context penuh ("lupa" instruksi awal, makin banyak salah). Semua best practice di halaman ini dibangun di atas satu constraint itu.
- Monitor dengan custom status line; kurangi token sesuai panduan costs.

## Beri Claude cara MEMVERIFIKASI pekerjaannya (aturan terpenting)

- Tanpa check yang bisa dijalankan, satu-satunya sinyal adalah "kelihatannya selesai" — dan kamu jadi verification loop-nya. Dengan check pass/fail, loop tertutup sendiri: kerjakan → jalankan check → baca hasil → iterasi sampai lolos.
- Check = test suite, build exit code, linter, script diff vs fixture, atau screenshot browser dibandingkan desain.
- Contoh prompt verifikasi: *"write a validateEmail function. example test cases: user@example.com is true, invalid is false. run the tests after implementing"* — bukan sekadar *"implement email validation"*.
- Untuk perubahan UI: tempel screenshot desain → minta Claude implement → screenshot hasilnya → bandingkan → list perbedaan → perbaiki.
- Untuk bug: tempel error asli, minta fix root cause (bukan suppress error) + verify build sukses.
- Tingkatan gating: (1) dalam satu prompt, (2) `/goal` condition dievaluasi tiap turn, (3) Stop hook deterministik (blok turn sampai lolos; max 8 blok berturut), (4) verification subagent / second opinion (model lain mencoba membantah hasil).
- Minta Claude MENUNJUKKAN bukti (output test, command yang dijalankan), bukan sekadar mengklaim sukses.

## Workflow: Explore → Plan → Code → Commit

1. **Explore**: masuk plan mode (`Shift+Tab` atau `claude --permission-mode plan`) — Claude baca file & jawab pertanyaan TANPA mengubah apa pun. Prompt contoh: *"read /src/auth and understand how we handle sessions and login."*
2. **Plan**: minta rencana implementasi detail (*"I want to add Google OAuth. What files need to change? Create a plan."*). Bisa edit plan langsung via `Ctrl+G`.
3. **Implement**: keluar plan mode, Claude coding sambil verifikasi terhadap plan (*"implement the OAuth flow from your plan. write tests for the callback handler, run the test suite and fix any failures."*).
4. **Commit**: commit dengan pesan deskriptif + buka PR.

- Plan mode menambah overhead → skip untuk perubahan kecil yang jelas (typo, rename). Gunakan saat: ragu pendekatan, multi-file, atau tidak familiar dengan kode.
- (Edisi blog 2025 juga menyarankan sebelum coding besar: minta Claude meresearch dulu di codebase, diskusikan pendekatan, baru minta draft plan sebagai markdown untuk direview.)

## TDD dengan agent

- Pola live docs: *"write a failing test that reproduces the issue, then fix it"* — test-first untuk bugfix.
- Edisi blog 2025 punya ritual eksplisit: tulis test dulu → konfirmasi test GAGAL → commit test → implementasi sampai test lolos → JANGAN ubah test agar cocok dengan kode.
- Variatif: satu sesi Claude menulis test, sesi lain menulis kode untuk meloloskan test (mencegah test "dibuat lolos" oleh penulisnya).

## Custom slash commands → Skills

- Bentuk lama (blog 2025): file markdown di `~/.claude/commands/` (personal) / `.claude/commands/` (per project, shareable via git), dipanggil `/nama-command`; `$ARGUMENTS` diisi argumen; bisa embed output bash dengan backtick-`!` (misal `!git status`).
- Bentuk kini: Skills — direktori `.claude/skills/<nama>/SKILL.md` dengan frontmatter `name` + `description`; dimuat on-demand (tidak membebani tiap percakapan), auto-dipakai saat relevan atau manual `/skill-name`.
- Contoh skill workflow `fix-issue`: `$ARGUMENTS` = nomor issue → `gh issue view` → pahami masalah → cari file relevan → implement → write & run tests → lint/typecheck → commit deskriptif → push + PR. Set `disable-model-invocation: true` untuk workflow ber-side-effect yang hanya boleh dipicu manual.

## CLAUDE.md tips

- File spesial yang dibaca di awal SETIAP percakapan. Isi: bash commands, code style, aturan workflow. Generate starter dengan `/init`, cek termuat via `/context`. Bisa import file lain dengan `@path/to/file`. Check in ke git.
- Keep it short & human-readable. Uji tiap baris: *"kalau baris ini dihapus, apakah Claude akan bikin salah?"* Kalau tidak → hapus. CLAUDE.md terlalu panjang menyebabkan instruksi asli diabaikan!
- INCLUDE: bash commands yang tak bisa ditebak, style rules yang beda dari default, instruksi testing/test runner, etika repo (branch naming, PR), keputusan arsitektural project-specific, quirk environment (env vars), gotcha non-obvious.
- EXCLUDE: hal yang Claude bisa tahu dari membaca kode, konvensi standar bahasa, dokumentasi API detail (link saja), info yang sering berubah, tutorial panjang, deskripsi per-file, klise ("write clean code").
- Troubleshooting: Claude terus melanggar satu rule → file kemungkinan terlalu panjang (rule tenggelam). Claude masih nanya hal yang ada di CLAUDE.md → frasa ambigu. Kalau satu instruksi penting terus dilanggar, tambahkan kata "IMPORTANT" pada baris ITU SAJA (menyemprot banyak baris = tidak ada yang menonjol).
- Knowledge domain yang hanya kadang relevan → taruh di skills, bukan CLAUDE.md.
- Perlakukan seperti kode: review saat bermasalah, prune rutin, observasi apakah perilaku benar-benar berubah. `/doctor` menyarankan pemotongan konten yang bisa diturunkan dari kodebase.

## Prompt yang efektif

- Spesifik: sebut file, skenario, preferensi testing. *"add tests for foo.py covering the edge case where the user is logged out. avoid mocks."*
- Tunjuk sumber: *"look through ExecutionFactory's git history and summarize how its api came to be"* alih-alih *"why is this API weird?"*
- Referensi pattern existing: *"HotDogWidget.php is a good example. follow the pattern to implement a calendar widget... without libraries other than the ones already used."*
- Deskripsikan gejala + lokasi + definisi "fixed": *"login fails after session timeout. check auth flow in src/auth/, especially token refresh. write a failing test that reproduces the issue, then fix it."*
- Rich content: `@file` reference, paste image, URL docs, pipe data (`cat error.log | claude`), atau biarkan Claude fetch sendiri via Bash/MCP.
- Prompt vagu tetap berguna untuk eksplorasi open-ended (*"what would you improve in this file?"*).

## Fitur environment pendukung

- **Permissions**: pre-approve tool terpercaya via `/permissions` (misal `npm run lint`, `git commit`); sandbox OS-level untuk batasi filesystem/network; auto mode = classifier model menreview aksi (blokir scope escalation, infra unknown).
- **CLI tools**: cara paling hemat token untuk interaksi service eksternal — install `gh`, `aws`, `gcloud`, `sentry-cli`; Claude bisa belajar tool baru dari `--help`.
- **MCP servers**: `claude mcp add ...` untuk Notion/Figma/db/issue tracker.
- **Hooks**: script otomatis di titik tertentu workflow — deterministik, berbeda dari instruksi CLAUDE.md yang advisory. Contoh: hook eslint pasca-edit, hook blok tulis folder migrations.
- **Subagents**: `.claude/agents/*.md` dengan tools/model sendiri, jalan di context terpisah. Ideal untuk investigasi banyak file tanpa mengotori context utama: *"Use subagents to investigate how our authentication system handles token refresh."*

## Manajemen sesi & context

- Course-correct cepat: `Esc` stop mid-action (context utuh); `Esc Esc`/`/rewind` restore percakapan/kode ke checkpoint; `"undo that"` revert.
- Aturan emas: kalau sudah >2× mengoreksi hal sama dalam satu sesi → `/clear`, mulai fresh dengan prompt lebih baik yang menginkorporasi pelajaran. Sesi bersih + prompt bagus hampir selalu mengalahkan sesi panjang penuh koreksi gagal.
- `/clear` antara task yang tak berkaitan; auto-compaction menjaga ringkasan penting; `/compact <instructions>` (mis. "Focus on the API changes"); instruksikan di CLAUDE.md apa yang harus selalu diselamatkan saat compaction.
- Checkpoint otomatis per prompt (hanya perubahan via editing tool Claude — bukan pengganti git).
- Resume: `claude --continue` / `--resume`; nama session seperti branch (`oauth-migration`).

## Headless / non-interactive mode

- `claude -p "prompt"` untuk CI, pre-commit hooks, scripts. Output: plain text, `--output-format json` (satu objek dengan field `result`), `--output-format stream-json --verbose` (satu JSON per baris).
- Integrasi pipeline: `claude -p "<prompt>" --output-format json | your_command`.
- Auto mode unattended: `claude --permission-mode auto -p "fix all lint errors"`.

## Scale: paralel & fan-out

- Paralel via git worktrees / desktop app / cloud sessions; `claude agents` untuk dispatch background.
- Writer/Reviewer pattern: Session A implement rate limiter → Session B (fresh context, bias-free) review diff untuk edge cases/race conditions → feedback balik ke A.
- Fan-out migrasi besar: generate daftar file (`files.txt`) → loop `for file in $(cat files.txt); do claude -p "Migrate $file from React to Vue. Return OK or FAIL." --allowedTools "Edit,Bash(git commit *)"; done` → uji di 2-3 file dulu, refine prompt, baru full scale. `/batch` memecah perubahan ke 5–30 subagent per-worktree masing-masing buka PR.

## Adversarial review step

- Sebelum anggap selesai (apalagi run unattended): subagent reviewer dengan FRESH context mengecek diff terhadap plan/kriteria — ia tidak melihat reasoning pembuatnya.
- `/code-review` bundled skill untuk bug-hunting di diff.
- Catatan penting: reviewer yang diminta cari gaps hampir pasti menemukan SESUATU (walau kerjaannya sound) → risiko over-engineering. Instruksikan: hanya flag gap yang mempengaruhi correctness/requirement; sisanya opsional.

## Failure patterns umum + fix

| Pattern | Fix |
|---|---|
| Kitchen sink session (task campur aduk) | `/clear` antar task |
| Koreksi bolak-balik | Setelah 2x gagal: `/clear` + prompt awal lebih baik |
| CLAUDE.md over-specified | Prune ruthless; konversi ke hook bila harus dijamin |
| Trust-then-verify gap | Selalu sediakan verifikasi; tak bisa diverifikasi → jangan ship |
| Infinite exploration (investigasi tak ber-scope) | Scope sempit atau pakai subagent |

## Pengembangan intuisi

- Pattern bukan dogma: kadang context memang harus menumpuk (masalah kompleks satu topik), kadang planning di-skip (eksplorasi), kadang prompt vagu justru tepat. Perhatikan apa yang membuat output bagus/buruk dan bangun intuisi sendiri.
