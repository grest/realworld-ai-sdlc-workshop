# LAB 4 — controlled apply, implementacja i testy

**Czas:** 85 minut  
**Tryb Claude:** nowa sesja; małe kroki; diff review po tasku  
**Warunek wejścia:** zatwierdzone proposal, specs, design i tasks

## Cel

Zaimplementować zmianę zgodnie z zatwierdzonym planem, zachowując kontrolę nad zakresem, testami i evidence.

## Wejścia

- kompletny pakiet OpenSpec;
- aktualny branch i zielony baseline;
- test fixtures wydane przez prowadzącego;
- szablon evidence log;
- istniejące wzorce w feature `Comments`.

## Oczekiwane rezultaty

- kod w zatwierdzonym zakresie;
- testy wynikające ze scenarios;
- zaktualizowane checkboxy `tasks.md`;
- `docs/traceability/evidence-log.md`;
- uzupełniona traceability matrix;
- pełny diff gotowy do niezależnego review.

## Krok 1 — baseline — 5 min

```powershell
git status
git branch --show-current
dotnet run --project .\build\build.csproj -- test
```

Zapisz wynik w evidence logu.

## Krok 2 — nowa sesja implementacyjna — 5 min

Rozpocznij nową sesję Claude. Nie przenoś do niej starych, odrzuconych assumptions.

```text
Pracuj wyłącznie na podstawie zatwierdzonych artefaktów:
- @openspec/changes/edit-comment-within-window/proposal.md
- @openspec/changes/edit-comment-within-window/specs
- @openspec/changes/edit-comment-within-window/design.md
- @openspec/changes/edit-comment-within-window/tasks.md
- @docs/traceability/traceability-matrix.md

Przed pierwszą edycją podaj:
1. pierwszy task,
2. pliki do odczytu,
3. pliki do zmiany lub utworzenia,
4. przewidywany diff,
5. test lub komendę weryfikacyjną,
6. stop conditions, które mogą zostać uruchomione.

Nie wykonuj kilku tasków w jednej niekontrolowanej partii.
```

Następnie:

```text
/opsx:apply edit-comment-within-window
```

## Krok 3 — realizuj task po tasku — 35 min

Po każdym tasku:

1. pokaż listę zmienionych plików;
2. przejrzyj diff;
3. sprawdź zgodność z konkretnym requirement/scenario;
4. uruchom focused test;
5. dopiero potem oznacz task jako wykonany;
6. uzupełnij evidence.

Nie akceptuj:

- nowej zależności bez decyzji;
- zmiany `realworld/`;
- niepowiązanego refactoringu;
- zmiany kontraktu poza decision card;
- testu dostosowanego do błędnej implementacji;
- użycia danych z requestu jako tożsamości użytkownika.

## Krok 4 — testy ze scenarios — 15 min

Przygotuj testy niezależnie od szczegółów implementacji. Pokryj wszystkie zatwierdzone scenarios oraz najważniejsze ryzyka techniczne.

W przypadku czasu testy nie mogą zależeć od realnego oczekiwania. Użyj rozwiązania zaakceptowanego w designie i ADR.

## Krok 5 — review pełnego diffu — 8 min

```powershell
git diff --stat
git diff --check
git diff
```

Sprawdź:

- nieplanowane pliki;
- zmianę modelu domenowego;
- kolejność kontroli;
- zachowanie przy błędzie;
- brak modyfikacji danych po odrzuceniu;
- logowanie;
- zmiany testów istniejących;
- dokumentację.

## Krok 6 — discovery podczas implementacji — maks. 6 min

Jeżeli implementacja ujawniła błąd planu:

1. zatrzymaj apply;
2. zaklasyfikuj problem jako spec/design/task/implementation;
3. zaktualizuj odpowiedni artefakt;
4. uzyskaj review;
5. dopiero potem kontynuuj.

Nie koryguj planu po cichu.

## Krok 7 — final validation — 5 min

```powershell
dotnet run --project .\build\build.csproj -- test
```

Opcjonalnie uruchom kontraktowe testy RealWorld zgodnie z instrukcją prowadzącego.

## Krok 8 — evidence i checkpoint — 6 min

Skopiuj szablon, jeżeli jeszcze nie istnieje:

```powershell
Copy-Item .\workshop\templates\evidence-log.md .\docs\traceability\evidence-log.md
```

Raport końcowy Claude powinien zawierać:

```text
Files changed:
Tasks completed:
Commands executed:
Test results:
Deviations from design:
Unverified areas:
Remaining risks:
Documentation updated:
```

Checkpoint:

```powershell
git add src tests openspec docs
git commit -m "workshop(lab-04): implement and validate comment correction"
```

## Definition of Done

- [ ] Implementacja odpowiada zatwierdzonym scenarios.
- [ ] Nie ma scope creep ani niezatwierdzonych zależności.
- [ ] Testy obejmują exact boundary i przypadki negatywne ze spec.
- [ ] Tożsamość i ownership są sprawdzane serwerowo.
- [ ] Odrzucona operacja nie zmienia danych.
- [ ] Build i testy przechodzą.
- [ ] Tasks i traceability są aktualne.
- [ ] Evidence zawiera wykonane i niewykonane kontrole.
- [ ] Diff jest gotowy do review przez inną grupę.
