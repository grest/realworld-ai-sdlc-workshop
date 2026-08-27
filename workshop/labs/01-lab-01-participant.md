# LAB 1 — dokumenty źródłowe do kontrolowanego context packu

**Czas:** 75 minut  
**Tryb Claude:** Plan / read-only na etapie analizy  
**Zakaz:** nie twórz OpenSpec i nie modyfikuj kodu

## Cel

Przygotować niewielki, reviewowalny zestaw informacji w Markdown, zachowując pochodzenie treści i jawnie oznaczając elementy niepewne.

To laboratorium uczy różnicy między:

```text
technical conversion -> reviewed documentation -> semantic specification
```

W tym LAB-ie wykonujemy tylko dwa pierwsze kroki.

## Wejścia

Prowadzący udostępni:

- `BRD-COM-017.docx` i/lub `BRD-COM-017.pdf`;
- `ADO-COM-042-backlog-item.md`;
- diagram `ARCH-COM-003` w PNG/SVG;
- `ADR-006-deterministic-time-handling.md`;
- `SEC-STD-004-resource-ownership.md`;
- `NFR-OBS-003-logging-and-audit.md`;
- `SUP-INC-010-support-case.md`;
- puste szablony z `workshop/templates/`.

## Oczekiwane rezultaty

```text
docs/sources/source-register.md
docs/converted/BRD-COM-017.raw.md
docs/requirements/comment-correction-source-review.md
docs/architecture/comment-flow-review.md
docs/traceability/conversion-report.md
docs/traceability/open-questions.md
```

## Role

- Driver: uruchamia konwersję i Claude.
- Source Owner: porównuje wynik z oryginałem.
- Reviewer: szuka utraconej lub zmienionej treści.
- Architect: sprawdza diagram i wpływ dokumentów technicznych.

## Krok 1 — przygotuj branch i pliki robocze — 5 min

```powershell
git status
git branch --show-current
```

Jeżeli prowadzący nie utworzył jeszcze brancha zespołu:

```powershell
git switch -c workshop/<TEAM_ID>/comment-correction
```

Skopiuj szablony:

```powershell
Copy-Item .\workshop\templates\source-register.md .\docs\sources\source-register.md
Copy-Item .\workshop\templates\conversion-report.md .\docs\traceability\conversion-report.md
Copy-Item .\workshop\templates\open-questions.md .\docs\traceability\open-questions.md
```

## Krok 2 — zarejestruj źródła — 10 min

Dla każdego dokumentu zapisz:

- identyfikator;
- wersję;
- właściciela;
- status: approved, draft, working note, incident, decision;
- klasyfikację;
- planowane użycie.

Nie ustalaj pierwszeństwa wyłącznie na podstawie daty pliku.

## Krok 3 — konwersja BRD przez MarkItDown — 15 min

Przykład:

```powershell
powershell.exe `
  -NoProfile `
  -ExecutionPolicy Bypass `
  -File .\scripts\convert-document.ps1 `
  -InputPath .\docs\source-materials\BRD-COM-017.docx
```

Sprawdź:

```powershell
Get-Content .\docs\converted\BRD-COM-017.raw.md
Get-Content .\docs\converted\BRD-COM-017.raw.md.conversion.json
```

## Krok 4 — review konwersji — 12 min

Porównaj oryginał i raw Markdown. Szukaj szczególnie:

- błędów hierarchii nagłówków;
- utraty przypisów;
- błędów tabel i połączonych komórek;
- zmiany kolejności treści;
- elementów graficznych bez semantyki;
- usunięcia oznaczeń typu draft, assumption lub note;
- miejsc, gdzie Markdown może zmieniać interpretację.

Nie poprawiaj znaczenia dokumentu. Możesz poprawić wyłącznie techniczne odwzorowanie.

## Krok 5 — utwórz reviewed Markdown — 10 min

Utwórz:

```text
docs/requirements/comment-correction-source-review.md
```

Dodaj front matter:

```yaml
---
source_id: BRD-COM-017
source_file: ../source-materials/BRD-COM-017.docx
source_version: "<VERSION>"
source_owner: "<OWNER>"
converter: markitdown
converter_version: "<VERSION>"
review_status: pending
---
```

Zachowaj:

- oryginalne sformułowania;
- jawne przypisy i assumptions;
- status dokumentu;
- odwołania do sekcji.

## Krok 6 — review diagramu — 10 min

Utwórz:

```text
docs/architecture/comment-flow-review.md
```

Zapisz:

1. elementy widoczne na diagramie;
2. elementy potwierdzone w kodzie;
3. rozbieżności;
4. cross-cutting concerns, których diagram może nie pokazywać;
5. elementy wymagające potwierdzenia.

Możesz dodać propozycję Mermaid, ale oznacz ją jako rekonstrukcję wymagającą review.

## Krok 7 — analiza z Claude — 12 min

W nowej sesji Plan użyj:

```text
Pracuj wyłącznie w trybie analizy. Nie modyfikuj kodu
ani artefaktów OpenSpec.

Przeanalizuj:
- @docs/converted/BRD-COM-017.raw.md
- @docs/requirements/comment-correction-source-review.md
- @docs/source-materials/ADO-COM-042-backlog-item.md
- @docs/source-materials/ADR-006-deterministic-time-handling.md
- @docs/source-materials/SEC-STD-004-resource-ownership.md
- @docs/source-materials/NFR-OBS-003-logging-and-audit.md
- @docs/source-materials/SUP-INC-010-support-case.md
- @docs/architecture/comment-flow-review.md

Oddziel:
1. fakty jawnie wynikające ze źródeł,
2. working assumptions,
3. rekomendacje lub sugestie,
4. sprzeczności,
5. brakujące decyzje,
6. ryzyka,
7. potencjalne scenariusze graniczne.

Dla każdej obserwacji podaj dokument i sekcję.
Nie twórz nowych wymagań. Nie rozstrzygaj konfliktów.
Nie zapisuj zmian bez naszego zatwierdzenia.
```

Zweryfikuj wynik Claude względem źródeł. Nie kopiuj go bez review.

## Krok 8 — raport i checkpoint — 6 min

Uzupełnij:

- conversion report;
- open questions;
- source register.

Następnie:

```powershell
git diff --check
git diff --stat
git status
```

Checkpoint:

```powershell
git add docs
git commit -m "workshop(lab-01): prepare reviewed context pack"
```

## Definition of Done

- [ ] Każdy dokument ma source ID, wersję i status.
- [ ] Raw Markdown jest oddzielony od reviewed Markdown.
- [ ] Przypisy, tabele i oznaczenia draft/assumption zostały sprawdzone.
- [ ] Nie dodano żadnej niezatwierdzonej liczby, reguły ani statusu HTTP.
- [ ] Diagram porównano z kodem lub opisano ograniczenia jego weryfikacji.
- [ ] Fakty, assumptions, sugestie i decyzje są oddzielone.
- [ ] Open questions mają właścicieli.
- [ ] Nie utworzono zmiany OpenSpec.
- [ ] Nie zmodyfikowano kodu.
