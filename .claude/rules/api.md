---
paths:
  - "src/Conduit/Features/**/*.cs"
  - "tests/Conduit.IntegrationTests/Features/**/*.cs"
---

# API implementation rules

- Inspect an existing feature with similar behavior before adding a new
  endpoint or handler.
- Preserve existing request, response, envelope, validation, and error
  conventions.
- Use FluentValidation where the repository already uses it for request
  validation.
- Obtain authenticated identity from the trusted server-side user
  context, never from an identifier supplied in the request body.
- Perform authorization and ownership checks on the server.
- Preserve the established HTTP error representation.
- Do not change an existing public API contract without:
  1. an explicit source decision,
  2. an approved OpenSpec change,
  3. a human approval gate.
- Do not change official contract tests merely to make an implementation
  pass.
- Validate resource relationships expressed in the route, such as a
  child resource belonging to the parent resource in the URL.
