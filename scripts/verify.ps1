$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
Push-Location (Join-Path $projectRoot 'batchbeacon_server')
try {
  serverpod generate
  if ($LASTEXITCODE -ne 0) { throw 'Code generation failed.' }
  dart format lib bin test
  dart analyze
  if ($LASTEXITCODE -ne 0) { throw 'Server analysis failed.' }
  dart test --reporter expanded
  if ($LASTEXITCODE -ne 0) { throw 'Server tests failed.' }
} finally { Pop-Location }
Push-Location (Join-Path $projectRoot 'batchbeacon_client')
try {
  dart format bin
  dart analyze
  if ($LASTEXITCODE -ne 0) { throw 'Client analysis failed.' }
} finally { Pop-Location }
Push-Location (Join-Path $projectRoot 'batchbeacon_flutter')
try {
  dart format lib test
  flutter analyze --no-pub
  if ($LASTEXITCODE -ne 0) { throw 'Flutter analysis failed.' }
  flutter test --no-pub --reporter expanded
  if ($LASTEXITCODE -ne 0) { throw 'Flutter tests failed.' }
  flutter build web --release --no-pub
  if ($LASTEXITCODE -ne 0) { throw 'Flutter web build failed.' }
} finally { Pop-Location }
Write-Host 'All analysis, tests and release web build passed.'
