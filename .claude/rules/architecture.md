---
paths:
  - "src/Conduit/**/*.cs"
---

# Architecture rules

- Preserve the existing feature-folder and vertical-slice organization.
- Keep commands, queries, validators, handlers, mappings and response models in the relevant feature.
- Keep controllers thin; business rules belong outside controller methods.
- Follow an existing neighboring feature before introducing a new pattern.
- Use the existing `ConduitContext` persistence approach unless an approved design explicitly changes it.
- Do not introduce a generic repository or service layer merely for one change.
- Pass `CancellationToken` through asynchronous operations.
- Keep behavioral changes local to the affected feature where practical.
- A new cross-cutting abstraction requires an explicit design decision.
- A durable architectural decision requires an ADR or an update to an existing ADR.
- Do not perform unrelated refactoring as part of a behavioral change.
