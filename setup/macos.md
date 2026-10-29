# MacOS Setup

- System Settings
    - Keyboard: repeat Fast, delay Short, backlight off after 5s
        - Keyboard Shortcuts > Mission Control: Mission Control `Ctrl+Cmd+W`, Move left a space `Ctrl+Cmd+A`, Move right a space `Ctrl+Cmd+D`
    - Appearance: Dark, Liquid Glass Clear, icon and widget style Dark
    - Touch ID & Password: add fingerprint
    - Trackpad: speed 8/10, tap to click ✓, click Light
    - Dock: auto-hide ✓
    - Menu Bar: clock seconds ✓, battery percent ✓
    - Finder: path bar ✓, status bar ✓

- Accounts & Devices
    - Add Gmail accounts (Internet Accounts)
    - Pair Bluetooth: AirPods, headphones, keyboard, mouse

- Apps
    - Browsers: [Firefox](https://www.mozilla.org/firefox/)
        - Extensions:
            - [Bitwarden](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
            - [AdBlocker Ultimate](https://addons.mozilla.org/en-US/firefox/addon/adblocker-ultimate/)
            - [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
            - [Sidebery](https://addons.mozilla.org/en-US/firefox/addon/sidebery/)
                - about:config: toolkit.legacyUserProfileCustomizations.stylesheets = true
                - In 'Profile Directory' (Menu > Help > Troubleshooting Information > Profile Directory) create folder chrome with file `userChrome.css`.

                    ```
                    #TabsToolbar {
                        display: none;
                    }
                    ```

    - Dev tools:
        - Xcode
        - [Homebrew](https://brew.sh/): install first, see the README
        - [Ghostty](https://ghostty.org/)
        - [Claude Code](https://code.claude.com/docs/en/overview)
        - [VS Code](https://code.visualstudio.com/)
        - [Obsidian](https://obsidian.md/): see [obsidian.md](./obsidian.md)

    - Utilities:
        - [Bitwarden](https://bitwarden.com/download/): install first, other sign-ins need it
        - [Mos](https://mos.caldis.me/) — smooth & inverted scrolling
            - Smooth scrolling ✓, reverse scroll ✓, launch on login ✓, hide status bar ✓
            - Step 10.00, Speed 6.69, Duration 3.90
        - [Raycast](https://www.raycast.com/store)
            - Sign in with personal email rajitbanerjee15@gmail.com
            - Replace Spotlight: turn off Keyboard Shortcuts > Spotlight > Show Spotlight search, then set the Raycast hotkey to `Cmd+Space`
            - Extensions: EasyOCR, Color Picker, Visual Studio Code
        - [OpenLogi](https://openlogi.org/): Logitech mouse config
            - Middle click: Mission Control, gesture button click: right click, forward: next desktop, back: previous desktop
        - Google Drive for Desktop — sync `Documents`

    - Communication: WhatsApp
    - Media: [Spotify](https://www.spotify.com/download/)
