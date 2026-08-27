---
paths:
  - "src/Conduit/Features/**/*.cs"
  - "tests/Conduit.IntegrationTests/Features/**/*.cs"
---

# API rules

- Inspect an existing feature with similar behavior before adding an endpoint or handler.
- Preserve established request, response-envelope, validation and error conventions.
- Use FluentValidation where the repository already uses it for request validation.
- Obtain the authenticated identity from trusted server-side context, never from a request-body identifier.
- Perform authorization and ownership checks server-side.
- Preserve the existing error representation.
- Do not change an existing public API contract without an approved source decision, OpenSpec change and human approval.
- Do not alter official contract tests merely to make an implementation pass.
- Validate parent-child relationships expressed in a route.
