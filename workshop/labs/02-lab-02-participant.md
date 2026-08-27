# LAB 2 — explore i proposal

**Czas:** 45 minut  
**Tryb Claude:** Plan podczas explore, kontrolowany zapis tylko artefaktów OpenSpec  
**Zakaz:** bez implementacji i bez testów nowej funkcji

## Cel

Przejść od reviewed context packu do jawnego, małego i zatwierdzonego zakresu zmiany.

## Wejścia

- rezultaty LAB 1;
- obecny kod i testy komentarzy;
- current-state spec wydana przez prowadzącego na początku LAB 2;
- karta decyzji produktowej wydana dopiero po zakończeniu explore.

## Oczekiwane rezultaty

```text
openspec/changes/edit-comment-within-window/proposal.md
docs/traceability/open-questions.md
```

## Krok 1 — kontrola checkpointu i current-state spec — 4 min

```powershell
git status
git branch --show-current
git log -1 --oneline
```

Potwierdź, że LAB 1 jest zapisany, nie ma nieznanych zmian i istnieje `openspec/specs/comments/spec.md`.

## Krok 2 — explore bez implementacji — 10 min

W nowej sesji Plan:

```text
/opsx:explore

Zbadaj możliwość dodania korekty własnego komentarza.

Źródła:
- @docs/requirements/comment-correction-source-review.md
- @docs/traceability/open-questions.md
- @docs/architecture/comment-flow-review.md
- @docs/source-materials/ADO-COM-042-backlog-item.md
- @docs/source-materials/ADR-006-deterministic-time-handling.md
- @docs/source-materials/SEC-STD-004-resource-ownership.md
- @docs/source-materials/NFR-OBS-003-logging-and-audit.md
- @openspec/specs/comments/spec.md

Stan obecny:
- @src/Conduit/Features/Comments
- @src/Conduit/Domain/Comment.cs
- @tests/Conduit.IntegrationTests/Features/Comments

Nie implementuj i nie twórz jeszcze zmiany.

Przygotuj:
1. obecne zachowanie,
2. zachowanie sugerowane przez źródła,
3. fakty, assumptions i konflikty,
4. pytania blokujące i nieblokujące,
5. prawdopodobnie dotknięte komponenty,
6. ryzyka bezpieczeństwa i kompatybilności,
7. elementy, które powinny być out of scope,
8. warianty wymagające decyzji człowieka.

Dla ustaleń podawaj źródło lub plik kodu.
```

## Krok 3 — STOP i decyzja prowadzącego — 5 min

Po explore nie kontynuuj samodzielnie.

Przedstaw prowadzącemu:

- listę pytań;
- proponowany scope;
- co najmniej jedno ryzyko;
- informacje, których nie można ustalić ze źródeł.

Prowadzący wyda kartę decyzji produktowej. Dodaj ją do source register i open questions.

## Krok 4 — utwórz zmianę — 5 min

```text
/opsx:new edit-comment-within-window
```

Sprawdź, czy powstał wyłącznie scaffold zmiany.

## Krok 5 — utwórz proposal — 9 min

```text
/opsx:continue edit-comment-within-window
```

Proposal musi zawierać:

- problem i wartość;
- source IDs i decision IDs;
- in scope;
- out of scope;
- wpływ na użytkowników i system;
- assumptions;
- unresolved questions;
- ryzyka;
- brak implementacyjnych szczegółów wykraczających poza potrzebny poziom.

## Krok 6 — review proposal — 6 min

Sprawdź:

- czy proposal opisuje właściwy problem;
- czy nie rozszerza zadania o UI, historię, admin override lub inne niezatwierdzone elementy;
- czy decyzja produktowa nie jest błędnie przypisana do BRD;
- czy zakres jest możliwy do implementacji i review podczas warsztatu;
- czy out of scope jest konkretny;
- czy nie rozpoczęto kodowania.

## Krok 7 — checkpoint — 6 min

```powershell
git diff --check
git diff --stat
git status
```

```powershell
git add openspec docs/traceability docs/sources docs/decisions
git commit -m "workshop(lab-02): approve comment correction proposal"
```

## Definition of Done

- [ ] Explore odwołuje się do źródeł i stanu obecnego.
- [ ] Karta decyzji jest zarejestrowana jako osobne źródło.
- [ ] Proposal ma jednoznaczny scope i out of scope.
- [ ] Working assumptions nie są przedstawione jako decyzje.
- [ ] Otwarte pytania mają ownerów i status.
- [ ] Nie ma kodu, testów ani zmiany schematu.
- [ ] Proposal otrzymał jawne `approved`, `approved with conditions` albo `rework`.
