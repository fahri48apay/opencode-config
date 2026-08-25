# Conventional Commits v1.0.0

> Sumber: https://www.conventionalcommits.org/en/v1.0.0/
> Diakses: 2026-08-24
> Catatan: padatkan — spesifikasi lengkap versi ringkas + contoh

## Apa itu

Konvensi ringan di atas commit message agar commit history punya makna yang terbaca manusia & mesin.
Menyatu dengan SemVer: commit message mendeskripsikan features (`feat`), fixes (`fix`), dan breaking changes.

## Format commit message

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Elemen struktural inti

1. **`fix:`** — patch bug → berkorelasi dengan **PATCH** SemVer.
2. **`feat:`** — fitur baru → berkorelasi dengan **MINOR** SemVer.
3. **`BREAKING CHANGE:`** — footer `BREAKING CHANGE:` ATAU `!` setelah type/scope → **MAJOR** SemVer. Bisa muncul di commit tipe apa pun.
4. Tipe lain selain `fix`/`feat` diperbolehkan; rekomendasi @commitlint/config-conventional (berbasis Angular): `build:`, `chore:`, `ci:`, `docs:`, `style:`, `refactor:`, `perf:`, `test:`.
5. Footer lain mengikuti konvensi mirip git trailer (mis. `Reviewed-by: Z`, `Refs: #123`).
6. **Scope** opsional dalam kurung: `feat(parser): add ability to parse arrays`.

## Aturan spesifikasi (ringkasan RFC 2119)

- Commit MUST diawali type (noun) + scope opsional + `!` opsional + colon+space wajib.
- `feat` MUST untuk fitur baru; `fix` MUST untuk bug fix.
- Scope MAY berupa noun bagian codebase dalam kurung: `fix(parser):`.
- Description MUST langsung setelah colon+space; ringkas.
- Body MAY mengikuti, MUST dipisah satu baris kosong dari description; bebas bentuk, boleh multi-paragraf.
- Footer MAY ada satu baris kosong setelah body; tiap footer = token + `:<space>` atau `<space>#` + value.
- Token footer MUST pakai `-` bukan spasi (mis. `Acked-by`); pengecualian `BREAKING CHANGE`.
- Breaking change MUST ditandai via prefix type/scope (`!` sebelum `:`) atau footer `BREAKING CHANGE: <desc>`.
- Jika pakai `!`, footer `BREAKING CHANGE:` MAY dihilangkan.
- Tipe lain MAY dipakai bebas.
- Implementasi MUST NOT memperlakukan elemen sebagai case-sensitive, KECUALI `BREAKING CHANGE` yang MUST uppercase (`BREAKING-CHANGE` sinonim valid sebagai token footer).

## Contoh resmi

```
feat: allow provided config object to extend other configs

BREAKING CHANGE: `extends` key in config file is now used for extending other config files
```

```
feat!: send an email to the customer when a product is shipped
```

```
feat(api)!: send an email to the customer when a product is shipped
```

```
feat!: drop support for Node 6

BREAKING CHANGE: use JavaScript features not available in Node 6.
```

```
docs: correct spelling of CHANGELOG
```

```
feat(lang): add Polish language
```

```
fix: prevent racing of requests

Introduce a request id and a reference to latest request. Dismiss
incoming responses other than from latest request.
Remove timeouts which were used to mitigate the racing issue but are
obsolete now.

Reviewed-by: Z
Refs: #123
```

Contoh revert (rekomendasi):

```
revert: let us never again speak of the noodle incident

Refs: 676104e, a215868
```

## Kenapa pakai

- Auto-generate CHANGELOG.
- Auto-menentukan semantic version bump dari jenis commit.
- Komunikasi nature perubahan ke tim/publik/stakeholder.
- Trigger build & publish process.
- Memudahkan kontribusi karena history lebih terstruktur.

## Poin FAQ penting

- Fase development awal: perlakukan seperti sudah rilis.
- Casing type: bebas, tapi konsisten.
- Commit campur beberapa type → pecah jadi beberapa commit bila bisa.
- Salah type sebelum merge/release → perbaiki via `git rebase -i`.
- Workflow squash PR: maintainer bisa rapikan pesan commit saat merge; contributor casual tak wajib paham spec.
- Relasi ke SemVer: `fix`→PATCH, `feat`→MINOR, BREAKING CHANGE (tipe apa pun)→MAJOR.
- Spec tidak mendefinisikan perilaku revert secara eksplisit — serahkan ke tooling; rekomendasi type `revert` + footer SHA.

Lisensi: CC BY 3.0.
