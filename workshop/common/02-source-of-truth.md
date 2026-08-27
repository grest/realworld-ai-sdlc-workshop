# Źródła prawdy i rozwiązywanie konfliktów

## Domyślna kolejność dla warsztatu

1. Jawna, zatwierdzona karta decyzji.
2. Zatwierdzony kontrakt API dla planowanej zmiany.
3. Aktualne OpenSpec opisujące przyjęte zachowanie.
4. Zatwierdzone ADR i standardy bezpieczeństwa.
5. Reviewed requirements Markdown z zachowanym provenance.
6. Backlog i dokumenty robocze.
7. Kod oraz testy jako dowód stanu istniejącego, nie automatycznie intencji przyszłej.

## Gdy źródła są sprzeczne

Claude i grupa mają:

1. wskazać oba źródła;
2. zacytować odpowiednie sekcje;
3. opisać wpływ konfliktu;
4. oznaczyć pytanie jako blokujące lub nieblokujące;
5. przypisać właściciela decyzji;
6. zatrzymać pracę w miejscu, w którym decyzja jest konieczna.

## Czego nie robić

- nie wybierać automatycznie nowszej daty bez potwierdzenia statusu;
- nie uznawać testu za wymaganie tylko dlatego, że jest zielony;
- nie traktować maila lub support ticketu jako zatwierdzonej decyzji;
- nie zamieniać „working assumption” w `MUST`;
- nie ukrywać konfliktu przez ogólne sformułowanie.
