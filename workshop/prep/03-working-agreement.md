# Working agreement uczestników

## Odpowiedzialność

- Claude może analizować, proponować i modyfikować pliki w zatwierdzonym zakresie.
- Grupa odpowiada za treść wymagań, decyzje, bezpieczeństwo, testy i końcową akceptację.
- Odpowiedź modelu nie jest dowodem poprawności.

## Bezpieczeństwo

- używamy wyłącznie danych syntetycznych;
- nie wklejamy sekretów, tokenów, haseł ani danych produkcyjnych;
- nie odczytujemy `.env` ani lokalnych plików z poświadczeniami;
- nie modyfikujemy chronionych obszarów;
- nie uruchamiamy deploymentu, migracji ani instalacji zależności bez zgody.

## Sposób pracy

1. Najpierw źródła i stan obecny.
2. Następnie pytania, założenia i decyzje.
3. Plan OpenSpec przed kodem.
4. Małe, reviewowalne zmiany.
5. Test po znaczącym kroku.
6. Diff review przed przejściem dalej.
7. Evidence zamiast deklaracji „done”.
8. Niezależny reviewer przed akceptacją.

## Zakaz ślepego mergowania

Nie akceptujemy zmiany tylko dlatego, że:

- Claude twierdzi, że jest poprawna;
- kod się kompiluje;
- testy są zielone;
- diff wygląda na mały;
- wynik jest podobny do istniejącego wzorca.

## Do / Ask / Don't

| Do | Ask | Don't |
|---|---|---|
| Czytanie kodu i dokumentów warsztatowych | Nowa zależność | Sekrety i dane produkcyjne |
| `git status`, `git diff` | Zmiana kontraktu API | `git push` wykonywany przez agenta |
| Build i testy | Migracja lub zmiana schematu | Modyfikacja `realworld/` |
| Artefakty w branchu zespołu | Zmiana mechanizmu auth | Osłabianie testów |
