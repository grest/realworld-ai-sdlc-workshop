---
source_id: ADR-006
version: "1.0"
owner: Architecture Group
status: accepted
classification: workshop-internal
---

# ADR-006 — Deterministic handling of time-sensitive business rules

## Context

Business rules based on the current time are difficult to test reliably when domain or application code calls the system clock directly. Tests become dependent on execution speed, wall-clock time and time-zone assumptions.

## Decision

New time-sensitive business rules SHALL obtain the current instant through an explicit dependency or through an explicit input to a pure policy function.

For .NET code, the preferred built-in abstraction is `TimeProvider`. A local project abstraction is acceptable only when justified by an approved design.

Production uses the system time provider. Tests use a controlled provider or an explicit instant.

## Consequences

- Exact boundary conditions can be tested deterministically.
- The dependency must be visible in constructors or function arguments.
- New third-party packages are not required merely to access the current time.
- This decision does not require unrelated refactoring of existing features.

## Non-decision

This ADR does not define any business duration, cutoff or feature-specific API behavior.
