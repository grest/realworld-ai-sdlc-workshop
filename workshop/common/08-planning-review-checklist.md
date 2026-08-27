# Checklista review specs, design i tasks

## Specs

- [ ] Requirements opisują obserwowalne zachowanie.
- [ ] Każda obowiązkowa reguła jest jednoznaczna.
- [ ] Każde requirement ma co najmniej jeden konkretny scenario.
- [ ] Pokryto happy path, błędy, authorization, validation i boundary.
- [ ] Nie ma nazw klas/metod udających wymagania.
- [ ] Source/decision traceability jest zachowane.

## Design

- [ ] Design odpowiada na wszystkie istotne scenarios.
- [ ] Jest zgodny z aktualną architekturą repo.
- [ ] Identity, authorization i resource relationship są jawne.
- [ ] Time/data behavior jest deterministycznie testowalne.
- [ ] Error handling i compatibility są opisane.
- [ ] Observability, rollback i docs impact są uwzględnione.
- [ ] Alternatywy i trade-offs są opisane tam, gdzie istnieje wybór.

## Tasks

- [ ] Tasks są małe i uporządkowane.
- [ ] Kod, testy, dokumentacja i verify są rozdzielone.
- [ ] Każdy meaningful task ma validation method.
- [ ] Task nie ukrywa nowej decyzji.
- [ ] Tasks nie wychodzą poza proposal.

## Traceability

- [ ] Source -> decision -> requirement -> scenario -> task -> planned test.

## Planning gate

- [ ] Approved
- [ ] Approved with conditions
- [ ] Rework required
