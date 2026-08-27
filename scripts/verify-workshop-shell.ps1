param(
    [switch]$SkipDotNetTests
)

$ErrorActionPreference = "Stop"

$RepositoryRoot = Split-Path `
    -Parent `
    $PSScriptRoot

Set-Location $RepositoryRoot

function Assert-Command {
    param([Parameter(Mandatory)][string]$Name)

    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required command not found: $Name"
    }

    Write-Host "[OK] Command: $Name"
}

function Assert-PathExists {
    param([Parameter(Mandatory)][string]$Path)

    if (-not (Test-Path $Path)) {
        throw "Required path not found: $Path"
    }

    Write-Host "[OK] Path: $Path"
}

Write-Host "Validating workshop shell..."
Write-Host ""

Assert-Command "git"
Assert-Command "dotnet"
Assert-Command "node"
Assert-Command "npm"
Assert-Command "openspec"

$RequiredPaths = @(
    "AGENTS.md",
    "CLAUDE.md",
    ".claude\settings.json",
    ".claude\rules\architecture.md",
    ".claude\rules\api.md",
    ".claude\rules\testing.md",
    ".claude\rules\security.md",
    ".claude\rules\documentation.md",
    ".claude\hooks\protect-workshop-files.ps1",
    "openspec\config.yaml",
    "WORKSHOP.md",
    "workshop\templates\source-register.md",
    "workshop\templates\conversion-report.md",
    "workshop\templates\traceability-matrix.md",
    "workshop\templates\evidence-log.md",
    "workshop\templates\review-findings.md",
    "workshop\templates\pull-request.md",
    "workshop\tooling\versions.json",
    ".tools\markitdown\requirements.txt",
    "scripts\setup-markitdown.ps1",
    "scripts\convert-document.ps1",
    ".vscode\tasks.json"
)

foreach ($RequiredPath in $RequiredPaths) {
    Assert-PathExists $RequiredPath
}

Get-Content `
    .\.claude\settings.json `
    -Raw |
    ConvertFrom-Json |
    Out-Null

Write-Host "[OK] Claude settings JSON"

$SubmoduleStatus = git submodule status

if ($LASTEXITCODE -ne 0) {
    throw "Unable to inspect Git submodules."
}

if ([string]::IsNullOrWhiteSpace($SubmoduleStatus)) {
    throw "RealWorld submodule is not initialized."
}

Write-Host "[OK] Git submodule initialized"

$SubmoduleChanges = git -C .\realworld status --porcelain

if (-not [string]::IsNullOrWhiteSpace($SubmoduleChanges)) {
    throw "The realworld submodule contains local modifications."
}

Write-Host "[OK] RealWorld submodule is clean"

$NodeVersionText = (node --version).TrimStart("v")
$NodeVersion = [version]$NodeVersionText

if ($NodeVersion -lt [version]"20.19.0") {
    throw "Node.js 20.19.0 or newer is required."
}

Write-Host "[OK] Node.js version: $NodeVersion"

openspec doctor

if ($LASTEXITCODE -ne 0) {
    throw "OpenSpec doctor failed."
}

Write-Host "[OK] OpenSpec doctor"

$MarkItDownPython = Join-Path `
    $RepositoryRoot `
    ".venv-markitdown\Scripts\python.exe"

if (-not (Test-Path $MarkItDownPython)) {
    throw "MarkItDown environment is missing."
}

$MarkItDownVersion = & $MarkItDownPython `
    -c "import importlib.metadata; print(importlib.metadata.version('markitdown'))"

Write-Host "[OK] MarkItDown version: $($MarkItDownVersion.Trim())"

if (-not $SkipDotNetTests) {
    dotnet run `
        --project .\build\build.csproj `
        -- test

    if ($LASTEXITCODE -ne 0) {
        throw ".NET validation failed."
    }

    Write-Host "[OK] .NET validation"
}

Write-Host ""
Write-Host "Workshop shell validation completed successfully."
