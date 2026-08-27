# Documentation areas

| Directory | Purpose | Typical owner |
|---|---|---|
| `source-materials/` | Immutable or controlled inputs supplied to the workshop | Trainer / source owner |
| `converted/` | Raw technical conversion output; never treated as approved requirements | Workshop team |
| `sources/` | Source register and provenance information | Source owner |
| `requirements/` | Human-reviewed representation of source requirements | Analyst / PO |
| `architecture/` | Current architecture and reviewed flow descriptions | Architect |
| `adr/` | Accepted architecture decisions | Architect / tech lead |
| `decisions/` | Product or API decisions released during the workshop | Decision owner |
| `traceability/` | Open questions, conversion reports, evidence and review findings | Whole team |

## Rule

A file being present in `docs/` does not automatically make it authoritative. Use its metadata, status, owner and the source-precedence model in `workshop/common/02-source-of-truth.md`.
