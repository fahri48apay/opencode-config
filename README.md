# opencode-config

Sinkronisasi setup opencode antara **Termux (HP)** dan **laptop Windows**.

## Struktur

| Folder repo            | Lokasi live di device                          | Isi |
|------------------------|------------------------------------------------|-----|
| `config/opencode.jsonc`| `~/.config/opencode/opencode.jsonc`            | Config global (portable) |
| `config/agent/`        | `~/.config/opencode/agent/`                    | Agent `ui-ux` & `coding` |
| `skills/`              | `~/.agents/skills/`                            | 29 skill dari skills.sh |
| `skills-local/`        | `~/.config/opencode/skills/`                   | 3 skill lokal buatan sendiri |
| `kb/ui-ux-knowledge-base`, `kb/coding-knowledge-base` | `~/ui-ux-knowledge-base`, `~/coding-knowledge-base` | Knowledge base |

**Tidak ikut disinkron** (spesifik per device / rahasia):
- `local.jsonc` — path instructions absolut per device. Dimuat via env var
  `OPENCODE_CONFIG=$HOME/.config/opencode/local.jsonc`. Contoh: `config/local.example.jsonc`.
- Token Penpot — disimpan di env var `PENPOT_TOKEN`; config memakai `{env:PENPOT_TOKEN}`.
- `auth.json`, `node_modules/`, `package*.json`, database session.

## Pemakaian harian

Termux (HP):

```bash
~/opencode-config/sync.sh push "ubah X"   # salin live -> repo, commit, push
~/opencode-config/sync.sh pull            # git pull + salin repo -> live
~/opencode-config/sync.sh status          # cek beda repo vs live
```

Windows (PowerShell):

```powershell
.\sync.ps1 push -Message "ubah X"
.\sync.ps1 pull
.\sync.ps1 status
```

## Setup device baru

1. Install opencode + git.
2. Clone repo ini ke `$HOME/opencode-config`.
3. Jalankan sync pull (`./sync.sh pull` atau `.\sync.ps1 pull`).
4. Set env var:
   - `PENPOT_TOKEN` — token MCP Penpot (minta dari config lama / akun Penpot).
     Termux: tambah `export PENPOT_TOKEN="..."` di `~/.profile`.
     Windows: `setx PENPOT_TOKEN "..."`
   - `OPENCODE_CONFIG` → `$HOME/.config/opencode/local.jsonc`
     (salin dari `config/local.example.jsonc`, isi path AGENTS.md project).
5. Login ulang: `opencode auth login`.

## Remote access & sesi antar device (ringkasan rencana)

- Laptop → HP: `pkg install openssh tmux; passwd; sshd` di Termux (port 8022),
  dari Windows: `ssh -p 8022 <user-hp>@<ip-hp>`. Luar jaringan: Tailscale di kedua device.
- HP → laptop: aktifkan OpenSSH Server di Windows
  (Settings > System > Optional Features), lalu dari Termux `ssh <user>@<ip-laptop>`.
- Sesi: tersimpan lokal per device. Pola terbaik = one-host (sesi utama di laptop,
  HP masuk via SSH). Dua instalasi independen: lanjutkan konteks lewat HANDOFF.md di git.
