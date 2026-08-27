# Role artefaktów

| Artefakt | Odpowiada na pytanie | Nie powinien zawierać |
|---|---|---|
| Dokument źródłowy | Co przekazał właściciel źródła? | Cichych poprawek i dopowiedzeń |
| Reviewed requirement Markdown | Jak wiernie reprezentujemy źródło? | Niezatwierdzonych decyzji |
| `proposal.md` | Dlaczego i w jakim zakresie robimy zmianę? | Szczegółowej implementacji |
| Delta `spec.md` | Jak ma zachowywać się system? | Nazw klas i metod bez konieczności |
| `design.md` | Jak technicznie zrealizujemy tę zmianę? | Pełnej architektury całego systemu |
| `tasks.md` | Jakie kroki wykonamy i sprawdzimy? | Ukrytych decyzji projektowych |
| Kod | Jak zrealizowano zatwierdzony plan? | Niezatwierdzonego scope creep |
| Test | Jak sprawdzamy scenario lub ryzyko? | Kopii błędnego założenia z kodu |
| Evidence log | Co naprawdę wykonano i z jakim wynikiem? | Ogólnych zapewnień bez dowodu |
| PR description | Co reviewer ma sprawdzić i dlaczego? | Samej listy plików |

## Zasada

Każdy artefakt ma właściciela, status i miejsce w przepływie. Nie duplikujemy źródła prawdy; linkujemy do niego.
