---
source_id: NFR-OBS-003
version: "1.3"
owner: Operations
status: approved
classification: workshop-internal
---

# NFR-OBS-003 — Logging and audit for user content changes

## Requirements

- Logs MAY include operation name, authenticated username, resource identifier, result category and correlation identifier.
- Logs SHALL NOT include authentication tokens, passwords or full raw user-content payloads.
- Validation and authorization failures SHALL be distinguishable from unexpected server errors through status and structured error handling.
- A failed operation SHALL leave the persistent resource unchanged.
- Existing global error formatting and logging conventions SHALL be preserved unless an approved design changes them.

## Scope boundary

This document does not require a permanent revision-history table. Product requirements decide whether historical content must be stored.
