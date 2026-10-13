$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
foreach ($tool in @('flutter','dart','serverpod')) {
  if (-not (Get-Command $tool -ErrorAction SilentlyContinue)) { throw "$tool is not on PATH. Open a new terminal after installing the tools." }
}
if (-not (Test-Path -LiteralPath (Join-Path $projectRoot 'batchbeacon_server\web\app\index.html'))) {
  & (Join-Path $PSScriptRoot 'build-web.ps1')
}
Push-Location $projectRoot
try { serverpod start } finally { Pop-Location }
