# Sinkronisasi config opencode untuk Windows.
# Pemakaian: .\sync.ps1 pull | push [-Message "pesan"] | status
param(
  [Parameter(Position = 0)][string]$Cmd = "help",
  [string]$Message
)
$ErrorActionPreference = "Stop"
$RepoDir      = $PSScriptRoot
$ConfigDir    = Join-Path $HOME ".config\opencode"
$AgentsSkills = Join-Path $HOME ".agents\skills"

function Copy-Into([string]$Src, [string]$Dst) {
  New-Item -ItemType Directory -Force -Path $Dst | Out-Null
  Copy-Item -Path (Join-Path $Src "*") -Destination $Dst -Recurse -Force
}

function Invoke-Pull {
  git -C $RepoDir pull --ff-only
  Copy-Into (Join-Path $RepoDir "config") $ConfigDir
  Copy-Into (Join-Path $RepoDir "config\agent") (Join-Path $ConfigDir "agent")
  Copy-Into (Join-Path $RepoDir "skills") $AgentsSkills
  Copy-Into (Join-Path $RepoDir "skills-local") (Join-Path $ConfigDir "skills")
  Write-Host ">> PULL selesai (local.jsonc tidak disentuh)"
}

function Invoke-Push {
  Copy-Into (Join-Path $ConfigDir "agent") (Join-Path $RepoDir "config\agent")
  Copy-Item (Join-Path $ConfigDir "opencode.jsonc") (Join-Path $RepoDir "config\opencode.jsonc") -Force
  Remove-Item (Join-Path $RepoDir "skills") -Recurse -Force -ErrorAction SilentlyContinue
  Copy-Into $AgentsSkills (Join-Path $RepoDir "skills")
  Remove-Item (Join-Path $RepoDir "skills-local") -Recurse -Force -ErrorAction SilentlyContinue
  Copy-Into (Join-Path $ConfigDir "skills") (Join-Path $RepoDir "skills-local")
  git -C $RepoDir add -A
  $staged = git -C $RepoDir diff --cached --quiet; if ($LASTEXITCODE -ne 0) {
    git -C $RepoDir commit -m "sync: $($Message ?? 'update dari laptop')"
    git -C $RepoDir push
  } else { Write-Host ">> Tidak ada perubahan untuk di-push" }
  Write-Host ">> PUSH selesai"
}

switch ($Cmd) {
  "pull"   { Invoke-Pull }
  "push"   { Invoke-Push }
  "status" { git -C $RepoDir fetch origin 2>$null; git -C $RepoDir status -sb }
  default  { Write-Host ".\sync.ps1 pull | push [-Message pesan] | status" }
}
