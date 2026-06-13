# Obsidian Setup

Vault: `~/Documents/Obsidian/`

## Settings

- Editor
    - Display
        - Readable line length: off
        - Line numbers: on
    - Behavior
        - Indent using tabs: off
- Appearance
    - Accent color: HEX `#d79921`
    - Theme: [Minimal](https://github.com/kepano/obsidian-minimal)
- Interface
    - Inline title: off

## Community Plugins

- Importer
- Minimal Theme Settings
    - Dark mode color scheme: Gruvbox
    - Dark mode background contrast: True black

## Sync Setup

### macOS

Install dependencies using Homebrew:

```bash
brew install syncthing
```

Start Syncthing:

```bash
syncthing
```

This opens the Syncthing UI at:

```text
http://127.0.0.1:8384
```

### Vault Configuration

Add the vault folder to Syncthing with:

```text
Folder ID: obsidian-vault
```

### iPhone Setup

Apps:

- Obsidian
- VaultSync for Obsidian

Workflow:

1. Open VaultSync
2. Let sync complete
3. Open Obsidian

### Ignore Patterns

Recommended ignores to reduce desktop/mobile conflicts:

```text
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache
```

## Notes

- Laptop is the primary/source-of-truth device
- Avoid editing the same note simultaneously across devices
- iOS background sync is limited; open VaultSync periodically to ensure sync completes
