@AGENTS.md

# Workshop-specific instructions

## Purpose

This repository is a controlled training environment for AI-assisted software development with Claude Code, Visual Studio Code, OpenSpec, Markdown, Git and ASP.NET Core.

Claude may assist with analysis, specification, implementation, testing and review. Human participants remain responsible for requirements, architecture decisions, security, quality and approval.

## Repository map

- Application code: `src/Conduit/`
- Integration tests: `tests/Conduit.IntegrationTests/`
- Official RealWorld specification submodule: `realworld/`
- Controlled source material and reviewed documentation: `docs/`
- OpenSpec artifacts: `openspec/`
- Workshop instructions and templates: `workshop/`
- Workshop automation: `scripts/`

## Source-of-truth model

For existing RealWorld behavior:

1. The official RealWorld specification and its contract tests describe the agreed external API behavior.
2. Accepted OpenSpec specifications describe behavior formally adopted by this workshop repository.
3. Approved ADRs and architecture documents describe technical constraints and decisions.
4. Approved source requirements and decision records describe the business intent of a proposed change.
5. Existing code and tests are evidence of current implementation; they do not automatically define intended future behavior.

When sources disagree, do not silently select one. Report the conflict, cite the sources and stop for a human decision.

## Required working method

1. Inspect relevant requirements, specifications, architecture, code and tests before proposing a change.
2. Separate confirmed facts, assumptions, recommendations and human decisions.
3. Use OpenSpec for non-trivial behavioral changes.
4. Do not implement before the proposal, specifications, design and tasks have passed the required human review.
5. Apply approved tasks in small, reviewable batches.
6. Review the diff and run focused tests after each meaningful change.
7. Run the repository validation command before declaring completion.
8. Report commands executed, results, deviations, unverified areas and remaining risks.

## Development commands

Standard repository validation:

```powershell
dotnet run --project .\build\build.csproj -- test
```

Run the API locally:

```powershell
$env:ASPNETCORE_URLS = "http://localhost:5000"
dotnet run --project .\src\Conduit\Conduit.csproj
```

Do not invent commands. Read `AGENTS.md`, the build project and existing configuration first.

## Protected areas

Treat the following as protected unless a trainer explicitly approves a specific modification:

- `realworld/`
- `.github/workflows/`
- `global.json`
- `Directory.Packages.props`
- NuGet lock files
- official RealWorld contract tests
- secrets and local environment files

Do not add, remove or upgrade dependencies without explicit approval.

## Security constraints

- Never read, reveal, commit or log secrets.
- Never use production data.
- Never derive authenticated identity from an untrusted request payload.
- Perform authorization and resource-ownership checks on the server.
- Do not weaken validation, authorization or tests to obtain a green result.
- Do not perform deployments, infrastructure changes or database migrations without explicit approval.

## Stop conditions

Stop and request a human decision when:

- authoritative sources conflict;
- a required source cannot be located;
- a proposed change would alter an external API contract without an approved decision;
- a new dependency or database migration appears necessary;
- an architectural decision is missing;
- implementation would exceed the approved scope;
- an existing test conflicts with the approved specification;
- a security control would need to be weakened;
- a protected file or directory would need modification.

## Documentation discipline

- Preserve source identifiers, versions, owners and review status.
- Technical conversion must not silently change meaning.
- OpenSpec specifications describe observable behavior.
- A change-specific `design.md` does not replace stable architecture documentation.
- Update documentation and traceability together with code.
