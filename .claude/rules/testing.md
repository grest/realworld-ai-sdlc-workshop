---
paths:
  - "src/Conduit/**/*.cs"
  - "tests/**/*.cs"
  - "openspec/**/*.md"
---

# Testing rules

- Derive tests from approved requirements and scenarios, not only from
  the implementation.
- Cover positive, negative, authorization, validation, and relevant
  boundary behavior.
- Follow the existing xUnit and integration-test conventions.
- Reuse the existing test infrastructure and fixtures before creating
  new infrastructure.
- Do not delete, disable, skip, or weaken a test merely to make a change
  pass.
- A failing existing test must be investigated as one of:
  - an implementation defect,
  - a specification defect,
  - an obsolete test requiring an explicit decision.
- Run focused tests after a meaningful implementation step.
- Run the standard repository validation before completion.
- Report tests not executed and explain why.
- Test names should describe behavior and expected outcome.
