---
paths:
  - "docs/**/*.md"
  - "workshop/**/*.md"
  - "openspec/**/*.md"
---

# Documentation rules

- Preserve source ID, source version, source owner, source section, and
  review status where applicable.
- Distinguish technical conversion from semantic transformation.
- Technical conversion must not silently rewrite, clarify, or complete
  requirements.
- Mark missing, unreadable, conflicting, and unverified content
  explicitly.
- Do not resolve a source conflict without a recorded human decision.
- Use relative links between repository documents.
- Keep current architecture documentation separate from the design of a
  single proposed change.
- OpenSpec requirements describe observable behavior and must be
  testable.
- Maintain traceability between source, requirement, scenario, task,
  implementation, test, and evidence.
- Do not copy the same source-of-truth content into multiple documents.
  Prefer links and references.
