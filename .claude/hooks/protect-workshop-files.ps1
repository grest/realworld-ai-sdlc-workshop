$ErrorActionPreference = "Stop"

$RawInput = [Console]::In.ReadToEnd()

if ([string]::IsNullOrWhiteSpace($RawInput)) {
    exit 0
}

$ToolCall = $RawInput | ConvertFrom-Json

$ProjectRoot = [System.IO.Path]::GetFullPath(
    $env:CLAUDE_PROJECT_DIR
).TrimEnd('\', '/')

function Normalize-Path {
    param([Parameter(Mandatory)][string]$Path)

    return [System.IO.Path]::GetFullPath($Path).
        TrimEnd('\', '/').
        ToLowerInvariant()
}

function Deny-ToolCall {
    param([Parameter(Mandatory)][string]$Reason)

    @{
        hookSpecificOutput = @{
            hookEventName            = "PreToolUse"
            permissionDecision       = "deny"
            permissionDecisionReason = $Reason
        }
    } |
        ConvertTo-Json -Depth 5 -Compress

    exit 0
}

$NormalizedProjectRoot = Normalize-Path $ProjectRoot

$ProtectedDirectories = @(
    (Normalize-Path (Join-Path $ProjectRoot "realworld")),
    (Normalize-Path (Join-Path $ProjectRoot ".github\workflows"))
)

$ProtectedFiles = @(
    (Normalize-Path (Join-Path $ProjectRoot "global.json")),
    (Normalize-Path (Join-Path $ProjectRoot "Directory.Packages.props"))
)

$ToolName = [string]$ToolCall.tool_name

if ($ToolName -in @("Edit", "Write")) {
    $RequestedPath = [string]$ToolCall.tool_input.file_path

    if (-not [string]::IsNullOrWhiteSpace($RequestedPath)) {
        $NormalizedRequestedPath = Normalize-Path $RequestedPath

        foreach ($ProtectedFile in $ProtectedFiles) {
            if ($NormalizedRequestedPath -eq $ProtectedFile) {
                Deny-ToolCall "Protected workshop file: $RequestedPath"
            }
        }

        foreach ($ProtectedDirectory in $ProtectedDirectories) {
            if (
                $NormalizedRequestedPath -eq $ProtectedDirectory -or
                $NormalizedRequestedPath.StartsWith(
                    $ProtectedDirectory + [System.IO.Path]::DirectorySeparatorChar
                )
            ) {
                Deny-ToolCall "Protected workshop directory: $RequestedPath"
            }
        }
    }
}

if ($ToolName -in @("PowerShell", "Bash")) {
    $Command = [string]$ToolCall.tool_input.command

    $DangerousCommandPattern = @(
        '\bgit\s+push\b',
        '\bgit\s+reset\s+--hard\b',
        '\bgit\s+clean\b',
        '\bRemove-Item\b',
        '\brm\s+-rf\b',
        '\bdotnet\s+add\s+package\b',
        '\bdotnet\s+ef\s+database\s+update\b',
        '\bdotnet\s+ef\s+migrations\b'
    ) -join '|'

    if ($Command -match "(?i)$DangerousCommandPattern") {
        Deny-ToolCall "Command blocked by workshop guard: $Command"
    }

    $ProtectedTargetPattern = @(
        'realworld[\\/]',
        '\.github[\\/]workflows',
        'global\.json',
        'Directory\.Packages\.props'
    ) -join '|'

    $MutationPattern = @(
        '\bSet-Content\b',
        '\bAdd-Content\b',
        '\bOut-File\b',
        '\bCopy-Item\b',
        '\bMove-Item\b',
        '\bRemove-Item\b',
        '>>?',
        '\bdel\b',
        '\brm\b'
    ) -join '|'

    if (
        $Command -match "(?i)$ProtectedTargetPattern" -and
        $Command -match "(?i)$MutationPattern"
    ) {
        Deny-ToolCall "Attempt to modify a protected workshop target: $Command"
    }
}

exit 0
