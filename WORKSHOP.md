# AI-assisted SDLC workshop

To repozytorium jest kontrolowanym środowiskiem warsztatowym opartym na backendzie RealWorld dla ASP.NET Core.

## Cel

Przeprowadzić jedną zmianę od niejednoznacznego materiału źródłowego do zweryfikowanego pull requestu:

```text
source -> reviewed context -> OpenSpec plan -> code -> tests -> evidence -> review
```

## Narzędzia

- ASP.NET Core i Entity Framework Core;
- Visual Studio Code;
- Claude Code;
- OpenSpec;
- MarkItDown;
- Git i GitHub;
- Markdown.

## Zasada nadrzędna

> AI proponuje i wykonuje kontrolowane kroki. Człowiek pozostaje właścicielem wymagań, decyzji, jakości i akceptacji.

## Materiały

- przygotowanie uczestnika: `workshop/prep/`;
- zasady wspólne: `workshop/common/`;
- instrukcje laboratoriów: `workshop/labs/`;
- szablony: `workshop/templates/`;
- dokumenty źródłowe: `docs/source-materials/`;
- rezultaty konwersji: `docs/converted/`;
- wymagania po review: `docs/requirements/`;
- architektura i ADR: `docs/architecture/`, `docs/adr/`;
- traceability i evidence: `docs/traceability/`;
- specyfikacje i zmiany: `openspec/`.

## Chronione obszary

Bez jawnej zgody prowadzącego nie modyfikuj:

- `realworld/`;
- `.github/workflows/`;
- `global.json`;
- `Directory.Packages.props`;
- lock files;
- oficjalnych testów kontraktowych;
- plików zawierających sekrety lub konfigurację lokalną.
