$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
Push-Location (Join-Path $projectRoot 'batchbeacon_flutter')
try {
  flutter build web --release
  if ($LASTEXITCODE -ne 0) { throw 'Flutter web build failed.' }
  $destination = Join-Path $projectRoot 'batchbeacon_server\web\app'
  New-Item -ItemType Directory -Path $destination -Force | Out-Null
  Copy-Item -Path 'build\web\*' -Destination $destination -Recurse -Force
  Write-Host 'Release web assets copied. Open http://localhost:8082/ after starting the server.'
} finally { Pop-Location }
