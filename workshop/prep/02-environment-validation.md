# Przygotowanie uczestnika — walidacja środowiska

## 1. Pełna walidacja repozytorium

```powershell
dotnet run --project .\build\build.csproj -- test
```

Polecenie powinno zakończyć się kodem `0`.

```powershell
if ($LASTEXITCODE -ne 0) {
    throw "Repository validation failed."
}
```

Po walidacji:

```powershell
git status --short
```

Jeżeli formatter zmienił pliki, nie commituj ich. Zgłoś problem prowadzącemu.

## 2. Uruchom API

W pierwszym terminalu:

```powershell
$env:ASPNETCORE_URLS = "http://localhost:5000"
dotnet run --project .\src\Conduit\Conduit.csproj
```

W drugim terminalu:

```powershell
Invoke-RestMethod -Uri "http://localhost:5000/api/tags" -Method Get
Start-Process "http://localhost:5000/swagger"
```

Zatrzymaj API przez `Ctrl+C`.

## 3. Sprawdź Claude Code

W nowej sesji Claude Code:

```text
/context
```

Potwierdź, że widoczne są przynajmniej:

- `CLAUDE.md`;
- importowane instrukcje repozytorium;
- `.claude/rules/`.

Następnie:

```text
/permissions
```

Sprawdź, czy chronione ścieżki i destrukcyjne komendy nie są automatycznie dozwolone.

## 4. Sprawdź OpenSpec bez tworzenia zmiany

```powershell
openspec doctor
openspec config list
```

W Claude sprawdź dostępność poleceń, ale nie uruchamiaj workflow tworzącego pliki.

## 5. Sprawdź shell warsztatowy

```powershell
powershell.exe `
  -NoProfile `
  -ExecutionPolicy Bypass `
  -File .\scripts\verify-workshop-shell.ps1
```

## 6. Raport problemu

Przekaż prowadzącemu:

```text
System operacyjny:
Wersja .NET:
Wersja Node:
Wersja OpenSpec:
Wersja Claude Code:
Polecenie, które nie działa:
Pełny komunikat błędu:
git status --short:
```
