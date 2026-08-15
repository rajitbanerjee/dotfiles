# Obsidian Setup

Personal vault: `~/Documents/Obsidian/`

## Settings

- Theme: default Obsidian, light mode
- Accent color: `#d79921` (warm amber)
- Base font size: 15px
- Line numbers: on
- Readable line length: on
- Inline title: off
- Indent using tabs: off
- Properties in document: hidden
- Strict line breaks: on
- Always update links: on
- Ribbon: hidden

## Hotkeys

- `Cmd+E`: toggle left sidebar (unbound from toggle source/live preview)

## Community Plugins

- Excalidraw
- Tasks

## Sync (Syncthing)

### macOS

```bash
brew install syncthing
syncthing
```

Opens the Syncthing UI at `http://127.0.0.1:8384`.

### Vault Configuration

Add the vault folder to Syncthing with folder ID: `obsidian-vault`

### iPhone

Apps: Obsidian, VaultSync for Obsidian

Workflow:
1. Open VaultSync
2. Let sync complete
3. Open Obsidian

### Ignore Patterns

Reduce desktop/mobile conflicts:

```text
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache
```

## Notes

- Laptop is the source-of-truth device
- Avoid editing the same note simultaneously across devices
- iOS background sync is limited; open VaultSync periodically
