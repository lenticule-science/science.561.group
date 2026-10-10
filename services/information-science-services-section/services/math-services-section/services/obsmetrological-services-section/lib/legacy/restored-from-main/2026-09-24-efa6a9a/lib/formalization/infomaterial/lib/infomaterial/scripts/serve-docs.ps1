param(
  [ValidateSet("start", "stop", "status")]
  [string]$Action = "start"
)

$ErrorActionPreference = "Stop"

$Root = Resolve-Path (Join-Path $PSScriptRoot "..")
$Site = Join-Path $Root "sites/docs"
$PidFile = Join-Path $Root ".docs-server.pid"
$OutLogFile = Join-Path $Root ".docs-server.out.log"
$ErrLogFile = Join-Path $Root ".docs-server.err.log"
$Port = 8000

function Get-PythonCommand {
  $python = Get-Command python -ErrorAction SilentlyContinue
  if ($python) { return $python.Source }

  $launcher = Get-Command py -ErrorAction SilentlyContinue
  if ($launcher) { return $launcher.Source }

  throw "Neither python nor py is available on PATH."
}

function Get-ListeningPid {
  $conn = Get-NetTCPConnection -LocalPort $Port -State Listen -ErrorAction SilentlyContinue |
    Select-Object -First 1
  if ($conn) { return [int]$conn.OwningProcess }
  return $null
}

function Stop-DocsServer {
  if (Test-Path $PidFile) {
    $raw = Get-Content $PidFile -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($raw -match "^\d+$") {
      $pidValue = [int]$raw
      $proc = Get-Process -Id $pidValue -ErrorAction SilentlyContinue
      if ($proc) {
        Stop-Process -Id $pidValue -Force
        Write-Host "Stopped docs server PID $pidValue."
      }
    }
    Remove-Item $PidFile -Force -ErrorAction SilentlyContinue
  }

  $listeningPid = Get-ListeningPid
  if ($listeningPid) {
    Stop-Process -Id $listeningPid -Force
    Write-Host "Freed localhost:$Port from PID $listeningPid."
  }
}

function Start-DocsServer {
  if (!(Test-Path (Join-Path $Site "index.html"))) {
    throw "sites/docs/index.html is missing. Run make docs before serving."
  }

  Stop-DocsServer

  $python = Get-PythonCommand
  $args = @("-m", "http.server", "$Port", "--bind", "127.0.0.1", "--directory", $Site)
  if ((Split-Path -Leaf $python) -ieq "py.exe") {
    $args = @("-3") + $args
  }

  $proc = Start-Process -FilePath $python `
    -ArgumentList $args `
    -WorkingDirectory $Root `
    -WindowStyle Hidden `
    -RedirectStandardOutput $OutLogFile `
    -RedirectStandardError $ErrLogFile `
    -PassThru

  Set-Content -Path $PidFile -Value $proc.Id -Encoding ascii
  Start-Sleep -Milliseconds 600

  $listeningPid = Get-ListeningPid
  if (!$listeningPid) {
    throw "Started PID $($proc.Id), but localhost:$Port is not listening. See $ErrLogFile."
  }

  Write-Host "Cockpit serving at http://localhost:$Port/ from $Site (PID $listeningPid)."
}

function Show-DocsStatus {
  $listeningPid = Get-ListeningPid
  if ($listeningPid) {
    Write-Host "http://localhost:$Port/ is listening (PID $listeningPid)."
    if (Test-Path $PidFile) {
      Write-Host "PID file: $PidFile"
    }
    return
  }

  Write-Host "http://localhost:$Port/ is not listening."
  if (Test-Path $PidFile) {
    Write-Host "Removing stale PID file: $PidFile"
    Remove-Item $PidFile -Force -ErrorAction SilentlyContinue
  }
}

switch ($Action) {
  "start" { Start-DocsServer }
  "stop" { Stop-DocsServer }
  "status" { Show-DocsStatus }
}
