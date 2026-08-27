@AGENTS.md

# Workshop-specific instructions

## Purpose

This repository is a controlled training environment for AI-assisted
software development using Claude Code, Visual Studio Code, OpenSpec,
Markdown, Git, and ASP.NET Core.

Claude assists with analysis, specification, implementation, testing,
and review. Human participants remain responsible for requirements,
architecture decisions, quality, security, and approval.

## Repository map

- Application code: `src/Conduit/`
- Integration tests: `tests/Conduit.IntegrationTests/`
- Official RealWorld specification submodule: `realworld/`
- Controlled project documentation: `docs/`
- OpenSpec artifacts: `openspec/`
- Workshop instructions and templates: `workshop/`
- Workshop automation: `scripts/`

## Source-of-truth model

For existing RealWorld behavior:

1. The official RealWorld specification and contract tests describe the
   externally agreed existing API behavior.
2. Accepted OpenSpec specifications describe behavior formally adopted
   by this workshop repository.
3. Approved ADRs and architecture documentation describe technical
   constraints and decisions.
4. Source requirements and decision records describe the business need
   for a proposed change.
5. Existing code and tests are evidence of the current implementation.
   They do not automatically define the intended future behavior.

When sources disagree, do not silently choose one. Report the conflict,
identify the sources, and stop for a human decision.

## Required working method

1. Read the relevant requirements, specifications, architecture,
   implementation, and tests before proposing changes.
2. Separate facts, assumptions, recommendations, and human decisions.
3. Use OpenSpec for non-trivial behavioral changes.
4. Do not implement a behavioral change before the relevant OpenSpec
   proposal, specifications, design, and tasks have been reviewed and
   approved by a human.
5. Apply approved tasks in small, reviewable batches.
6. Review the diff and run focused tests after each meaningful change.
7. Run the repository validation command before declaring work complete.
8. Report commands executed, results, unverified areas, deviations, and
   remaining risks.

## Development commands

Standard repository validation:

`dotnet run --project build/build.csproj -- test`

Run the API locally:

`dotnet run --project src/Conduit/Conduit.csproj`

Do not invent commands. Read `AGENTS.md`, the build project, and existing
configuration before recommending a command.

## Protected areas

Treat the following as protected:

- `realworld/`
- `.github/workflows/`
- `global.json`
- `Directory.Packages.props`
- NuGet lock files
- existing official contract tests
- secrets and local environment files

Do not modify protected areas unless a human explicitly approves the
specific modification.

Do not add, remove, or upgrade dependencies without explicit approval.

## Security constraints

- Never read, reveal, commit, or log secrets.
- Never use production data.
- Never derive authenticated identity from an untrusted request payload.
- Authorization and ownership checks must be performed server-side.
- Do not weaken validation, authorization, or tests to make a change pass.
- Do not perform deployment, infrastructure changes, or database
  migrations without explicit approval.

## Stop conditions

Stop and request a human decision when:

- requirements or authoritative sources conflict;
- a required source cannot be found;
- the change would alter an externally visible API contract;
- a new dependency is required;
- a database migration is required;
- an architectural decision is missing;
- implementation would exceed the approved scope;
- an existing test conflicts with the approved specification;
- a security control would need to be weakened;
- a protected file or directory would need to be modified.

## Documentation discipline

- Preserve source identifiers, versions, owners, and review status.
- Technical document conversion must not silently change meaning.
- OpenSpec specifications describe observable behavior.
- OpenSpec design documents describe the technical approach for one
  change; they do not replace stable architecture documentation.
- Update documentation and traceability together with code.
