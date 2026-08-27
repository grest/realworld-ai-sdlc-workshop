[CmdletBinding()]
param(
    [ValidatePattern('^\d+\.\d+$')]
    [string]$PythonVersion = "3.14",

    [switch]$Recreate
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Invoke-NativeCommand {
    param(
        [Parameter(Mandatory)]
        [string]$FilePath,

        [string[]]$Arguments = @()
    )

    & $FilePath @Arguments

    if ($LASTEXITCODE -ne 0) {
        throw @"
Command failed with exit code $LASTEXITCODE.

Executable:
$FilePath

Arguments:
$($Arguments -join " ")
"@
    }
}

$RepositoryRoot = (
    Resolve-Path (Join-Path $PSScriptRoot "..")
).Path

$VirtualEnvironment = Join-Path `
    $RepositoryRoot `
    ".venv-markitdown"

$Requirements = Join-Path `
    $RepositoryRoot `
    ".tools\markitdown\requirements.txt"

$VenvPython = Join-Path `
    $VirtualEnvironment `
    "Scripts\python.exe"

$MarkItDown = Join-Path `
    $VirtualEnvironment `
    "Scripts\markitdown.exe"

if (-not (Test-Path $Requirements -PathType Leaf)) {
    throw "Requirements file not found: $Requirements"
}

$PythonLauncher = Get-Command `
    "py.exe" `
    -ErrorAction SilentlyContinue

if ($null -eq $PythonLauncher) {
    throw @"
Python Launcher for Windows (py.exe) was not found.

Install Python $PythonVersion from python.org and ensure that
the Python Launcher option is enabled.
"@
}

if ($Recreate -and (Test-Path $VirtualEnvironment)) {
    Write-Host "Removing existing environment: $VirtualEnvironment"

    Remove-Item `
        -Path $VirtualEnvironment `
        -Recurse `
        -Force
}

if (-not (Test-Path $VenvPython -PathType Leaf)) {
    Write-Host "Creating Python $PythonVersion virtual environment..."

    Invoke-NativeCommand `
        -FilePath $PythonLauncher.Source `
        -Arguments @(
            "-$PythonVersion",
            "-m",
            "venv",
            $VirtualEnvironment
        )
}
else {
    Write-Host "Reusing existing environment: $VirtualEnvironment"
}

if (-not (Test-Path $VenvPython -PathType Leaf)) {
    throw "Virtual environment Python was not created: $VenvPython"
}

$ActualPythonVersion = & $VenvPython `
    -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')"

if ($LASTEXITCODE -ne 0) {
    throw "Unable to inspect virtual environment Python."
}

$ActualPythonVersion = $ActualPythonVersion.Trim()

if ($ActualPythonVersion -ne $PythonVersion) {
    throw @"
Existing virtual environment uses Python $ActualPythonVersion,
but Python $PythonVersion is required.

Run the script again with -Recreate:

.\scripts\setup-markitdown.ps1 -Recreate
"@
}

Write-Host "Installing MarkItDown dependencies..."

Invoke-NativeCommand `
    -FilePath $VenvPython `
    -Arguments @(
        "-m",
        "pip",
        "install",
        "--disable-pip-version-check",
        "--requirement",
        $Requirements
    )

$InstalledVersion = & $VenvPython `
    -c "import importlib.metadata as m; print(m.version('markitdown'))"

if ($LASTEXITCODE -ne 0) {
    throw "MarkItDown package is not available in the virtual environment."
}

$InstalledVersion = $InstalledVersion.Trim()

if (-not (Test-Path $MarkItDown -PathType Leaf)) {
    throw "MarkItDown executable was not created: $MarkItDown"
}

Invoke-NativeCommand `
    -FilePath $MarkItDown `
    -Arguments @("--help")

Write-Host ""
Write-Host "MarkItDown environment is ready."
Write-Host "Python:     $ActualPythonVersion"
Write-Host "MarkItDown: $InstalledVersion"
Write-Host "Environment: $VirtualEnvironment"