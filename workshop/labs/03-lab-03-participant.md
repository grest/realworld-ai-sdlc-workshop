# LAB 3 — specs, design, tasks i planning approval

**Czas:** 75 minut  
**Tryb Claude:** tworzenie jednego artefaktu na krok; review między krokami  
**Zakaz:** bez implementacji do czasu planning approval

## Cel

Zbudować kompletny pakiet planistyczny, który człowiek jest gotów zatwierdzić przed rozpoczęciem kodowania.

## Wejścia

- zatwierdzony `proposal.md`;
- current-state spec komentarzy;
- decyzja produktowa z LAB 2;
- karta decyzji API wydana przez prowadzącego;
- ADR i standard bezpieczeństwa;
- obecny kod i testy.

## Oczekiwane rezultaty

```text
openspec/changes/edit-comment-within-window/specs/**/spec.md
openspec/changes/edit-comment-within-window/design.md
openspec/changes/edit-comment-within-window/tasks.md
docs/traceability/traceability-matrix.md
docs/traceability/planning-review.md
```

## Krok 1 — zarejestruj nową decyzję — 5 min

Dodaj decision card do:

- source register;
- traceability matrix;
- listy open questions, zamykając odpowiednie pytania.

Nie przepisuj decyzji jako treści BRD.

## Krok 2 — utwórz delta specs — 15 min

```text
/opsx:continue edit-comment-within-window
```

Dla każdego wymagania sprawdź:

- jedno obserwowalne zachowanie;
- słowo `SHALL` lub `MUST` dla reguły obowiązkowej;
- source/decision reference;
- co najmniej jeden konkretny scenario;
- brak implementacyjnych nazw klas i metod;
- jawne granice i wyniki błędów, jeżeli wynikają z decyzji.

## Krok 3 — review scenarios — 10 min

Przygotuj macierz scenariuszy obejmującą co najmniej:

- happy path;
- dokładną granicę reguły czasowej;
- przypadek po granicy;
- brak uwierzytelnienia;
- innego użytkownika;
- nieprawidłową treść;
- brak zasobu;
- niespójną relację zasobów w URL;
- brak zmiany danych po operacji odrzuconej.

Nie kopiuj testów z implementacji, której jeszcze nie ma.

## Krok 4 — utwórz design — 15 min

```text
/opsx:continue edit-comment-within-window
```

`design.md` powinien rozstrzygnąć:

- komponenty dotknięte zmianą;
- przepływ requestu;
- źródło tożsamości;
- kolejność walidacji, lookup i authorization;
- obsługę czasu zgodną z ADR;
- modyfikację modelu lub encji, jeżeli jest konieczna;
- statusy i format błędów zgodne z decyzją;
- testowalność;
- observability;
- kompatybilność;
- brak migracji lub uzasadnienie stop condition;
- rollback;
- dokumenty do aktualizacji;
- alternatywy i trade-offy.

## Krok 5 — utwórz tasks — 10 min

```text
/opsx:continue edit-comment-within-window
```

Tasks powinny być małe, uporządkowane i sprawdzalne. Oddziel:

1. przygotowanie i baseline;
2. implementację zachowania;
3. testy;
4. dokumentację i traceability;
5. verify i final validation.

Każdy znaczący task ma zawierać metodę weryfikacji.

## Krok 6 — traceability — 9 min

Skopiuj szablon:

```powershell
Copy-Item .\workshop\templates\traceability-matrix.md .\docs\traceability\traceability-matrix.md
```

Połącz:

```text
source -> decision -> requirement -> scenario -> task -> planned test
```

Na tym etapie kolumny code/evidence mogą pozostać puste.

## Krok 7 — adversarial planning review — 8 min

Wymień pakiet planistyczny z inną grupą.

Reviewer ma założyć:

> Agent zaimplementuje dokładnie to, co zapisano, również wszystkie luki.

Znajdź co najmniej:

- jeden brak lub niejednoznaczność scenario;
- jedną lukę w designie;
- jeden task bez weryfikacji lub poza scope.

## Krok 8 — planning approval i checkpoint — 3 min

Decyzja:

- approved;
- approved with conditions;
- requires rework.

```powershell
git add openspec docs
git commit -m "workshop(lab-03): complete approved OpenSpec plan"
```

## Definition of Done

- [ ] Wszystkie obowiązkowe zachowania są obserwowalne i testowalne.
- [ ] Scenarios pokrywają happy path, błędy i granice.
- [ ] Design jest zgodny z istniejącym stylem repozytorium.
- [ ] Time handling jest deterministycznie testowalny.
- [ ] Auth identity pochodzi z zaufanego kontekstu serwera.
- [ ] Tasks pokrywają kod, testy, dokumentację i verify.
- [ ] Traceability prowadzi od źródeł do planowanych testów.
- [ ] Nie ma niezatwierdzonej zależności ani migracji.
- [ ] Pakiet ma jawne planning approval.
