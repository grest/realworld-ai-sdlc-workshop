---
paths:
  - "src/Conduit/**/*.cs"
  - "tests/**/*.cs"
  - "openspec/**/*.md"
---

# Testing rules

- Derive tests from approved requirements and scenarios, not only from implementation structure.
- Cover relevant positive, negative, authorization, validation and boundary behavior.
- Follow existing xUnit and integration-test conventions.
- Reuse existing fixtures and helpers before creating new infrastructure.
- Do not delete, disable, skip or weaken a test merely to make a change pass.
- Investigate a failing existing test as an implementation defect, specification defect or obsolete-test decision.
- Run focused tests after meaningful implementation steps.
- Run the standard repository validation before completion.
- Report tests not executed and explain why.
- Use behavior-oriented test names.
