@'
param(
    [Parameter(Mandatory)]
    [string]$InputPath,

    [string]$OutputPath,

    [switch]$Force
)

$ErrorActionPreference = "Stop"

$RepositoryRoot = Split-Path `
    -Parent `
    $PSScriptRoot

$SourceRoot = [System.IO.Path]::GetFullPath(
    (Join-Path $RepositoryRoot "docs\source-materials")
).TrimEnd('\')

$ConvertedRoot = [System.IO.Path]::GetFullPath(
    (Join-Path $RepositoryRoot "docs\converted")
).TrimEnd('\')

$ResolvedInput = [System.IO.Path]::GetFullPath(
    (Resolve-Path $InputPath).Path
)

if (
    $ResolvedInput -ne $SourceRoot -and
    -not $ResolvedInput.StartsWith(
        $SourceRoot + [System.IO.Path]::DirectorySeparatorChar
    )
) {
    throw "Input must be located under docs/source-materials."
}

$VirtualEnvironment = Join-Path `
    $RepositoryRoot `
    ".venv-markitdown"

$MarkItDown = Join-Path `
    $VirtualEnvironment `
    "Scripts\markitdown.exe"

$Python = Join-Path `
    $VirtualEnvironment `
    "Scripts\python.exe"

if (-not (Test-Path $MarkItDown)) {
    throw "MarkItDown is not installed. Run scripts/setup-markitdown.ps1."
}

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $BaseName = [System.IO.Path]::GetFileNameWithoutExtension(
        $ResolvedInput
    )

    $OutputPath = Join-Path `
        $ConvertedRoot `
        "$BaseName.raw.md"
}

$ResolvedOutput = [System.IO.Path]::GetFullPath($OutputPath)

if (
    (Test-Path $ResolvedOutput) -and
    -not $Force
) {
    throw "Output already exists. Use -Force to overwrite: $ResolvedOutput"
}

New-Item `
    -ItemType Directory `
    -Path (Split-Path -Parent $ResolvedOutput) `
    -Force |
    Out-Null

& $MarkItDown `
    $ResolvedInput `
    -o $ResolvedOutput

if ($LASTEXITCODE -ne 0) {
    throw "MarkItDown conversion failed."
}

if (
    -not (Test-Path $ResolvedOutput) -or
    (Get-Item $ResolvedOutput).Length -eq 0
) {
    throw "Converted output is missing or empty."
}

$ConverterVersion = & $Python `
    -c "import importlib.metadata; print(importlib.metadata.version('markitdown'))"

$SourceHash = (
    Get-FileHash `
        -Path $ResolvedInput `
        -Algorithm SHA256
).Hash

$ManifestPath = "$ResolvedOutput.conversion.json"

$Manifest = [ordered]@{
    sourceFile       = [System.IO.Path]::GetRelativePath(
        $RepositoryRoot,
        $ResolvedInput
    )
    sourceSha256     = $SourceHash
    outputFile       = [System.IO.Path]::GetRelativePath(
        $RepositoryRoot,
        $ResolvedOutput
    )
    converter        = "markitdown"
    converterVersion = $ConverterVersion.Trim()
    convertedAtUtc   = [DateTime]::UtcNow.ToString("o")
    reviewStatus     = "not-reviewed"
}

$Manifest |
    ConvertTo-Json -Depth 5 |
    Set-Content `
        -Path $ManifestPath `
        -Encoding utf8

Write-Host "Converted:"
Write-Host "  Source:   $ResolvedInput"
Write-Host "  Output:   $ResolvedOutput"
Write-Host "  Manifest: $ManifestPath"
'@ | Set-Content `
    -Path .\scripts\convert-document.ps1 `
    -Encoding utf8