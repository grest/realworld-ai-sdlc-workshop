# Git, branche i evidence

## Branch zespołu

Na początku LAB 1 utwórz jeden branch dla grupy:

```powershell
git switch <WORKSHOP_BRANCH>
git pull --ff-only
git switch -c workshop/<TEAM_ID>/comment-correction
```

Ten sam branch może być rozwijany przez pięć laboratoriów, aby zachować pełny ślad. Alternatywnie prowadzący może wymagać osobnego brancha dla każdego LAB-u.

## Początek każdego laboratorium

```powershell
git status
git branch --show-current
git log -1 --oneline
```

Nie rozpoczynaj pracy, jeżeli istnieją nieznane zmiany.

## Koniec każdego laboratorium

1. Sprawdź `git diff --check`.
2. Przejrzyj `git diff --stat` i pełny diff.
3. Uzupełnij wymagane artefakty.
4. Wykonaj commit checkpointowy.

Przykłady:

```powershell
git add docs workshop openspec src tests
git commit -m "workshop(lab-01): prepare reviewed context pack"
```

```powershell
git commit -m "workshop(lab-02): approve OpenSpec proposal"
```

```powershell
git commit -m "workshop(lab-03): complete planning artifacts"
```

```powershell
git commit -m "workshop(lab-04): implement and verify comment correction"
```

## Evidence

Evidence log powinien zawierać:

- komendę;
- wynik;
- artefakt lub plik;
- datę lub kolejność wykonania;
- niewykonane kontrole;
- odstępstwa od planu;
- pozostałe ryzyka.

Samo stwierdzenie „testy przechodzą” nie wystarcza. Zapisz, które testy uruchomiono i jaki był wynik.
