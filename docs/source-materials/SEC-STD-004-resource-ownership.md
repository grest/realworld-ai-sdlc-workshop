---
source_id: SEC-STD-004
version: "2.1"
owner: Application Security
status: approved
classification: workshop-internal
---

# SEC-STD-004 — Resource ownership and authenticated identity

## Mandatory rules

1. Authenticated identity SHALL come from trusted server-side authentication context.
2. A user identifier supplied in a request body, query string or custom client header SHALL NOT be treated as proof of identity.
3. Ownership checks SHALL be performed on the server against the stored resource relationship.
4. A parent-child relationship represented in a route SHALL be validated before a child resource is changed.
5. Authorization failure SHALL not modify the resource.
6. Tokens, passwords and raw authentication material SHALL NOT be written to logs or test output.

## Review evidence

A change affecting user-owned resources must include tests for at least:

- the owner;
- a different authenticated user;
- an unauthenticated request;
- an invalid or mismatched resource relationship.

## Scope

This standard defines security constraints. It does not select feature-specific HTTP status codes unless another approved contract does so.
