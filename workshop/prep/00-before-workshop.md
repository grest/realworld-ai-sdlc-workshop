# Przygotowanie uczestnika — przed warsztatem

## Termin

Wykonaj przygotowanie najpóźniej jeden dzień roboczy przed szkoleniem. Nie zostawiaj instalacji SDK, logowania do Claude Code ani klonowania submodułów na początek pierwszego dnia.

## Wymagane dostępy

- dostęp do repozytorium warsztatowego;
- możliwość utworzenia brancha i wypchnięcia go do własnego forka lub repo zespołowego;
- aktywne konto umożliwiające użycie Claude Code;
- możliwość instalacji rozszerzeń Visual Studio Code;
- możliwość uruchamiania lokalnych poleceń PowerShell i `.NET`.

## Wymagane oprogramowanie

Dokładne wersje są zapisane w repozytorium albo w manifeście release’u. Minimalny zestaw:

- Git;
- Visual Studio Code;
- .NET SDK zgodny z `global.json`;
- Node.js 20.19 lub nowszy dla OpenSpec;
- Python 3.11 lub 3.12 dla MarkItDown;
- Claude Code extension;
- OpenSpec CLI;
- PowerShell 7 zalecany na Windows.

## Wynik przygotowania

Przed warsztatem powinieneś móc:

1. otworzyć repo w VS Code;
2. uruchomić standardową walidację projektu;
3. uruchomić API i otworzyć Swagger;
4. uruchomić `openspec doctor`;
5. potwierdzić, że Claude ładuje `CLAUDE.md` i reguły projektu;
6. uruchomić MarkItDown przez dostarczony skrypt;
7. uzyskać czysty `git status`.

## Czego nie robić

- nie aktualizuj zależności;
- nie zmieniaj `global.json`;
- nie modyfikuj podmodułu `realworld/`;
- nie inicjalizuj własnej zmiany OpenSpec;
- nie szukaj rozwiązania zadania warsztatowego w innych branchach lub repozytoriach;
- nie zapisuj sekretów w repozytorium ani w rozmowie z Claude.
