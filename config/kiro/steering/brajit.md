---
inclusion: always
---

# Rajit's Global Kiro Steering

## Writing

<!-- How Kiro should write prose, docs, and narratives -->

## Coding

### Java Imports

Always use static imports or top-level imports — never use fully-qualified class names inline in method bodies (e.g., `org.mockito.ArgumentMatchers.eq(...)` is wrong, use `import static org.mockito.ArgumentMatchers.eq` and call `eq(...)` directly).

### Code Reviews

Never autonomously publish comments on code reviews (CRAddComment with publish=true, or cr CLI). Always share feedback in Kiro chat and wait for human to review and manually transfer if valid.

### Git Commits

Never autonomously run `git commit` or `git commit --amend`. Prepare the changes and stage files if asked, but wait for human to execute the commit.

## Reviewing

<!-- How Kiro should review code or docs -->

## Communication

<!-- Tone, format, verbosity preferences -->

## Environment

<!-- Machine-specific defaults, paths, hosts -->

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

Example — transferring `~/.zsh_history`:

```bash
scp brajit@devdesk-al2:~/.zsh_history ~/Desktop/ZSH_HISTORY
scp ~/Desktop/ZSH_HISTORY brajit@devdesk:~/.zsh_history
rm ~/Desktop/ZSH_HISTORY
```
