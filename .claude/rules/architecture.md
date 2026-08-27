---
paths:
  - "src/Conduit/**/*.cs"
---

# Architecture rules

- Preserve the existing feature-folder and vertical-slice organization.
- Place commands, queries, validators, handlers, mappings, and response
  models in the relevant feature.
- Keep controllers thin. Controllers should translate HTTP input and
  output, not contain business logic.
- Follow existing command/query and handler patterns before introducing
  a new abstraction.
- Use the existing `ConduitContext` data-access approach unless an
  approved design explicitly changes it.
- Do not introduce a generic repository or service layer merely to
  accommodate a single change.
- Pass `CancellationToken` through asynchronous operations.
- Keep behavior changes local to the affected feature whenever possible.
- A new cross-cutting abstraction requires an explicit design decision.
- A permanent architectural decision requires an ADR or an update to an
  existing ADR.
- Do not perform unrelated refactoring as part of a behavioral change.
