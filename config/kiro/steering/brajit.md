---
inclusion: always
---

# Rajit's Global Kiro Steering

## Epistemic Hygiene

Three output modes. Use the right one:

* **Assertion:** Verified this session with tools. Cite source (file path, URL, tool output).
* **Suggestion:** General knowledge applied to context. Frame as "consider" or "you might want to."
* **Speculation:** Reasoning from incomplete information. Flag with "I suspect" or "this is unverified."

Default mode is suggestion. Source code is ground truth -- documentation contradicts code, code wins.

When challenged on an assertion, find evidence. Don't fold without checking. New evidence contradicts earlier claim: correct immediately. Empty search results are not evidence of absence.

## Context Discipline

Estimate result size before every tool invocation. Large output (build logs, API responses) goes to a file -- extract only what's needed into context.

When editing files, list specific str_replace operations as a numbered plan before executing. Visible plan survives context interruptions.

## Coding

### Imports

Always use static imports or top-level imports -- never use fully-qualified class names inline in method bodies (e.g., `org.mockito.ArgumentMatchers.eq(...)` is wrong, use `import static org.mockito.ArgumentMatchers.eq` and call `eq(...)` directly).

### Readability

Small, focused functions. Cannot describe without "and"? Split. Guard clauses at top, happy path at lowest indentation.

Names must be specific. Not `data`, `result`, `temp`, `handle`, `process`, `manager`. Function name must describe all effects. Hidden side effects are bugs.

Comments explain why, not what. Comment explaining control flow means code is too complex -- simplify. Stale comment worse than no comment.

### Error Handling

Classify by origin: dependency failure -> 500, bad input -> 400. Never conflate. Fail fast -- invalid state detected, stop immediately. Internal details in logs, callers get safe messages.

### Tests

Test the contract, not the implementation. Error paths first, then boundaries, then validation, then happy path. Assert on fields that matter, not entire output shape.

### Structure

Composition over inheritance. No speculative abstraction. Extract duplication after three occurrences, not on first repeat.

### Observability

Feature change missing observability (metrics, alarms, dashboards): flag it. Don't silently ship unmonitored code.

## Output Preferences

When asked for writeups, descriptions, announcements, or any drafted text content (CR descriptions, ticket updates, comms, etc.), always write to a `/tmp/*.md` file. Never inline the content in chat.

## Code Reviews

Never autonomously publish comments on code reviews (CRAddComment with publish=true, or cr CLI). Always share feedback in Kiro chat and wait for human to review and manually transfer if valid.

## Git Commits

Never autonomously run `git commit` or `git commit --amend`. Prepare the changes and stage files if asked, but wait for human to execute the commit.

## Environment

When authentication fails (expired cookies, unauthenticated errors), stop and tell me. Never attempt re-authentication automatically.

## Skills

### Remote-to-Remote File Transfer

When asked to copy/transfer a file between two remote hosts, use `scp` with an intermediate local staging path:

1. `scp <user>@<source_host>:<remote_path> ~/Desktop/<filename>`
2. `scp ~/Desktop/<filename> <user>@<dest_host>:<remote_path>`
3. `rm ~/Desktop/<filename>`

Defaults (override with user-provided values):

- **User**: `brajit`
- **Intermediate path**: `~/Desktop/`
- **Source host**: `devdesk-al2`
- **Destination host**: `devdesk`

