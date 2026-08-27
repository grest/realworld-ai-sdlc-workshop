# LAB 5 — verify, cross-review, poprawa i PR

**Czas:** 45 minut  
**Tryb Claude:** Plan/read-only podczas pierwszej części review  
**Zasada:** reviewer czyta plan przed kodem

## Cel

Niezależnie sprawdzić rozwiązanie innej grupy, poprawić najważniejszy problem i przygotować pakiet pull requestu.

## Wejścia

- branch lub patch innej grupy;
- proposal, specs, design i tasks;
- testy i kod;
- evidence log;
- szablon review findings i PR description.

## Oczekiwane rezultaty

```text
docs/traceability/review-findings.md
docs/traceability/evidence-log.md
workshop/output/pull-request-description.md
```

## Krok 1 — wymiana i stan początkowy — 3 min

```powershell
git status
git branch --show-current
```

Prowadzący wskaże sposób wymiany: branch, worktree, patch albo przygotowany katalog.

## Krok 2 — review planu bez kodu — 7 min

Przeczytaj w kolejności:

1. `proposal.md`;
2. delta specs;
3. `design.md`;
4. `tasks.md`;
5. traceability matrix.

Zapisz oczekiwane zachowanie przed otwarciem implementacji.

## Krok 3 — verify — 5 min

```text
/opsx:verify edit-comment-within-window
```

Nie traktuj wyniku jako werdyktu. Zweryfikuj każde ustalenie.

## Krok 4 — manual code and test review — 10 min

Sprawdź:

- czy kod realizuje dokładnie scenarios;
- granicę czasu;
- źródło tożsamości;
- ownership;
- powiązanie komentarza z artykułem;
- walidację treści;
- brak zmiany danych po błędzie;
- aktualizację timestampu;
- statusy i format błędów;
- zmiany poza zakresem;
- jakość testów;
- observability i brak logowania treści.

## Krok 5 — klasyfikacja — 5 min

Skopiuj szablon:

```powershell
Copy-Item .\workshop\templates\review-findings.md .\docs\traceability\review-findings.md
```

Severity:

- `CRITICAL` — nie można zaakceptować zmiany;
- `WARNING` — wymaga poprawy lub jawnej decyzji;
- `SUGGESTION` — usprawnienie nieblokujące.

Type:

- source;
- spec;
- design;
- code;
- test;
- documentation;
- process.

Każda uwaga musi odwoływać się do requirementu, scenario lub konkretnego ryzyka.

## Krok 6 — poprawa jednego ważnego problemu — 8 min

Autorzy rozwiązania:

1. potwierdzają problem;
2. wskazują artefakt, który wymaga zmiany;
3. wykonują minimalną poprawkę;
4. uruchamiają odpowiedni test;
5. aktualizują evidence i traceability;
6. nie zamykają findingu bez dowodu.

## Krok 7 — PR description — 4 min

```powershell
New-Item -ItemType Directory -Path .\workshop\output -Force | Out-Null
Copy-Item .\workshop\templates\pull-request-description.md .\workshop\output\pull-request-description.md
```

Opis PR ma kierować reviewera najpierw do specyfikacji, później testów i diffu.

## Krok 8 — decyzja — 3 min

- approved;
- approved with follow-up;
- changes requested.

## Definition of Done

- [ ] Reviewer zaczął od planu, nie od kodu.
- [ ] Wykonano `/opsx:verify` i manual review.
- [ ] Każdy finding ma severity, type i evidence.
- [ ] Znaleziono problem implementacyjny lub potwierdzono brak takiego problemu z uzasadnieniem.
- [ ] Sprawdzono testy i traceability.
- [ ] Co najmniej jeden ważny problem został poprawiony i ponownie przetestowany.
- [ ] PR description zawiera źródła, zakres, testy, ryzyka i reviewer focus areas.
- [ ] Końcowa decyzja review jest jawna.
