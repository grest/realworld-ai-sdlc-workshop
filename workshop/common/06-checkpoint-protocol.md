# Protokół checkpointów

## Przed każdym LAB-em

```powershell
git status
git branch --show-current
git log -1 --oneline
```

## Po każdym LAB-ie

1. Uzupełnij artefakty obowiązkowe.
2. Uruchom `git diff --check`.
3. Przejrzyj pełny diff.
4. Wykonaj walidację wymaganą w instrukcji LAB-u.
5. Zapisz evidence.
6. Utwórz commit checkpointowy.

## Gdy grupa nie kończy w czasie

- nie przeskakuj niejawnie do kodu;
- zgłoś prowadzącemu brakujący artefakt;
- skorzystaj z oficjalnego rescue checkpointu;
- zanotuj, który fragment został dostarczony przez prowadzącego;
- zachowaj własne rezultaty przed podmianą.

## Zasada recovery

Checkpoint ratunkowy ma umożliwić dalszą naukę, a nie zastąpić całe rozwiązanie. Powinien dostarczać minimalny brakujący element, np. poprawny raw Markdown, scaffold endpointu lub test harness.
