# Przygotowanie uczestnika — klonowanie i narzędzia

Poniższe polecenia zakładają PowerShell. Zastąp placeholdery wartościami przekazanymi przez prowadzącego.

## 1. Sklonuj repozytorium z podmodułami

```powershell
$WorkshopRepository = "<WORKSHOP_REPOSITORY_URL>"
$WorkshopDirectory = "C:\Repo\realworld-ai-sdlc-workshop"

git clone --recurse-submodules $WorkshopRepository $WorkshopDirectory
Set-Location $WorkshopDirectory
```

Jeżeli repo zostało sklonowane bez submodułów:

```powershell
git submodule sync --recursive
git submodule update --init --recursive
```

## 2. Wybierz gałąź lub tag release’u

```powershell
git fetch --all --tags --prune
git switch <WORKSHOP_BRANCH>
git pull --ff-only
```

## 3. Sprawdź stan Git

```powershell
git status
git branch --show-current
git submodule status
```

Podmoduł nie może zawierać lokalnych zmian:

```powershell
git -C .\realworld status --short
```

## 4. Sprawdź .NET

```powershell
dotnet --info
dotnet --version
```

Repozytorium określa SDK w `global.json`. Nie zmieniaj pliku, aby dopasować projekt do przypadkowo zainstalowanego SDK.

## 5. Przywróć narzędzia i pakiety

```powershell
dotnet tool restore
dotnet restore .\Conduit.slnx --locked-mode
```

## 6. Sprawdź Node.js i OpenSpec

```powershell
node --version
openspec --version
openspec doctor
```

Jeżeli OpenSpec nie jest dostępny, wykonaj instrukcję instalacji przekazaną przez prowadzącego. Nie instaluj innej wersji niż zatwierdzona dla release’u warsztatu.

## 7. Skonfiguruj MarkItDown

```powershell
powershell.exe `
  -NoProfile `
  -ExecutionPolicy Bypass `
  -File .\scripts\setup-markitdown.ps1
```

Walidacja:

```powershell
.\.venv-markitdown\Scripts\markitdown.exe --help
```

## 8. Otwórz repo w Visual Studio Code

```powershell
code .
```

Zainstaluj rekomendowane rozszerzenia workspace oraz oficjalne rozszerzenie Claude Code.
