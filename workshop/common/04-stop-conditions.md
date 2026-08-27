# Stop conditions

Claude i uczestnicy zatrzymują pracę i proszą o decyzję, gdy:

- wymagania lub źródła są sprzeczne;
- brakuje źródła potrzebnego do potwierdzenia zachowania;
- potrzebna jest nowa zależność NuGet;
- potrzebna jest migracja lub zmiana schematu danych;
- zmiana wpływa na publiczny kontrakt poza zatwierdzonym zakresem;
- trzeba zmienić mechanizm uwierzytelnienia lub autoryzacji;
- istniejący test jest sprzeczny z zatwierdzoną specyfikacją;
- implementacja wymaga osłabienia testu;
- agent chce zmodyfikować chroniony plik;
- zakres wychodzi poza zaakceptowany proposal;
- nowa informacja podważa `design.md`;
- nie da się wykonać wymaganej weryfikacji.

## Format zgłoszenia

```text
STOP CONDITION:

Trigger:
Evidence:
Affected artifact:
Options:
Recommended owner:
Work that can safely continue:
```
