# Checklista AI-assisted code review

## Najpierw intent

- [ ] Przeczytałem proposal, specs, design i tasks przed kodem.
- [ ] Zapisałem oczekiwane behaviors i risks.

## Scope i architektura

- [ ] Zmieniono tylko uzasadnione pliki.
- [ ] Nie ma unrelated refactor.
- [ ] Nie dodano dependency ani migration bez decyzji.
- [ ] Kod zachowuje istniejący vertical-slice pattern.
- [ ] Controller pozostaje cienki.

## Behavior

- [ ] Każdy scenario ma odpowiadający kod i test/evidence.
- [ ] Boundary semantics są dokładne.
- [ ] Failed operation nie pozostawia partial mutation.
- [ ] Resource relationships są sprawdzane.
- [ ] Existing behavior pozostaje kompatybilne.

## Security

- [ ] Identity pochodzi z trusted auth context.
- [ ] Ownership jest server-side.
- [ ] Payload nie może podszyć się pod użytkownika.
- [ ] Brak sekretów i raw sensitive content w logach.
- [ ] Nie osłabiono validation/auth/tests.

## Tests

- [ ] Testy wynikają ze scenarios, nie tylko z implementacji.
- [ ] Są negative i boundary tests.
- [ ] Czas i dane są deterministyczne.
- [ ] Existing tests nie zostały usunięte ani rozluźnione bez decyzji.
- [ ] Komendy i wyniki są zapisane w evidence.

## Documentation and decision

- [ ] Traceability i docs są aktualne.
- [ ] Verify findings zostały manualnie ocenione.
- [ ] Findings mają severity, type i evidence.
- [ ] Decyzja review odpowiada dowodom.
