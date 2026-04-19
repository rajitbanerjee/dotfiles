---
inclusion: always
---

# Rajit's Global Kiro Steering

## Writing

<!-- How Kiro should write prose, docs, and narratives -->

## Coding

<!-- Language preferences, patterns, style rules -->

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
