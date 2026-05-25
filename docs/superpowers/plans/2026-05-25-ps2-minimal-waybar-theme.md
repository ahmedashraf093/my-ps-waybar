# PS2 Minimal Waybar Theme Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a custom Waybar theme inspired by the retro Playstation 2 aesthetic with controller button workspace icons.

**Architecture:** A new theme directory in `~/.config/waybar/themes/ps2-minimal` with a `default` variation. It uses the global `modules.json` but overrides specific module icons and styles.

**Tech Stack:** Waybar (JSON/CSS), Bash, Nerd Fonts (JetBrainsMono).

---

### Task 1: Initialize Theme Directory Structure

**Files:**
- Create: `~/.config/waybar/themes/ps2-minimal/default/`

- [ ] **Step 1: Create the directory structure**
Run: `mkdir -p ~/.config/waybar/themes/ps2-minimal/default`

- [ ] **Step 2: Verify directory exists**
Run: `ls -d ~/.config/waybar/themes/ps2-minimal/default`
Expected: Path exists.

- [ ] **Step 3: Commit**
```bash
git add ~/.config/waybar/themes/ps2-minimal
git commit -m "feat: initialize ps2-minimal theme directory"
```

### Task 2: Register Theme Variation

**Files:**
- Create: `~/.config/waybar/themes/ps2-minimal/default/config.sh`

- [ ] **Step 1: Create config.sh with theme name**
Write to `~/.config/waybar/themes/ps2-minimal/default/config.sh`:
```bash
#!/bin/bash
theme_name="PS2 Minimal"
```

- [ ] **Step 2: Verify file content**
Run: `cat ~/.config/waybar/themes/ps2-minimal/default/config.sh`
Expected: `theme_name="PS2 Minimal"`

- [ ] **Step 3: Commit**
```bash
git add ~/.config/waybar/themes/ps2-minimal/default/config.sh
git commit -m "feat: register PS2 Minimal theme variation"
```

### Task 3: Create Waybar Configuration

**Files:**
- Create: `~/.config/waybar/themes/ps2-minimal/config`

- [ ] **Step 1: Write the Waybar JSON configuration**
Override `hyprland/workspaces` with Playstation icons and `custom/appmenu` with PS Logo.
Write to `~/.config/waybar/themes/ps2-minimal/config`:
```json
{
    "layer": "top",
    "margin-bottom": 0,
    "margin-left": 0,
    "margin-right": 0,
    "spacing": 0,
    "include": [
        "~/.config/ml4w/settings/waybar-quicklinks.json",
        "~/.config/waybar/modules.json"
    ],
    "hyprland/workspaces": {
        "on-click": "activate",
        "active-only": false,
        "all-outputs": true,
        "format": "{icon}",
        "format-icons": {
            "1": "󰔱",
            "2": "󰐤",
            "3": "󰅖",
            "4": "󰓅",
            "5": "󰔱",
            "6": "󰐤",
            "7": "󰅖",
            "8": "󰓅",
            "default": "󰐤"
        },
        "persistent-workspaces": {
            "*": 4
        }
    },
    "custom/appmenu": {
        "format": "",
        "on-click": "~/.config/ml4w/scripts/ml4w-apps",
        "tooltip-format": "Open App Menu"
    },
    "pulseaudio": {
        "format": "󰕾  {volume}%",
        "format-muted": "󰝟",
        "on-click": "pavucontrol"
    },
    "battery": {
        "format": "󰂃 {capacity}%",
        "format-charging": "󰂄 {capacity}%",
        "format-plugged": "󰂄 {capacity}%"
    },
    "network": {
        "format-wifi": "󰖩  {essid}",
        "format-ethernet": "󰈀",
        "format-disconnected": "󰖪"
    },
    "modules-left": [
        "custom/appmenu",
        "hyprland/workspaces"
    ],
    "modules-center": [
        "clock"
    ],
    "modules-right": [
        "network",
        "pulseaudio",
        "battery",
        "tray"
    ]
}
```

- [ ] **Step 2: Verify JSON syntax**
Run: `jq . ~/.config/waybar/themes/ps2-minimal/config > /dev/null`
Expected: No errors.

- [ ] **Step 3: Commit**
```bash
git add ~/.config/waybar/themes/ps2-minimal/config
git commit -m "feat: add waybar config for ps2-minimal theme"
```

### Task 4: Create CSS Styles

**Files:**
- Create: `~/.config/waybar/themes/ps2-minimal/default/style.css`

- [ ] **Step 1: Write the CSS styles**
Set background to PS2 Black and map workspace colors.
Write to `~/.config/waybar/themes/ps2-minimal/default/style.css`:
```css
@import "../../colors.css";

* {
    font-family: "JetBrainsMono Nerd Font", "Roboto", "Helvetica", "Arial", sans-serif;
    font-size: 14px;
    border: none;
    border-radius: 0;
}

window#waybar {
    background-color: #1a1a1a;
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
}

#workspaces button {
    padding: 0 10px;
    color: #ffffff;
    background-color: transparent;
}

#workspaces button.active {
    background-color: rgba(255, 255, 255, 0.1);
    border-bottom: 2px solid #ffffff;
}

/* Playstation Button Colors */
#workspaces button:nth-child(1) { color: #00ac9f; } /* Triangle */
#workspaces button:nth-child(2) { color: #f05053; } /* Circle */
#workspaces button:nth-child(3) { color: #568ec9; } /* Cross */
#workspaces button:nth-child(4) { color: #cd70a7; } /* Square */

/* Repeat colors for 5-8 */
#workspaces button:nth-child(5) { color: #00ac9f; }
#workspaces button:nth-child(6) { color: #f05053; }
#workspaces button:nth-child(7) { color: #568ec9; }
#workspaces button:nth-child(8) { color: #cd70a7; }

#clock,
#network,
#pulseaudio,
#battery,
#tray,
#custom-appmenu {
    padding: 0 15px;
    color: #ffffff;
}

#custom-appmenu {
    font-size: 18px;
    color: #ffffff;
}
```

- [ ] **Step 2: Verify file exists**
Run: `ls ~/.config/waybar/themes/ps2-minimal/default/style.css`
Expected: Path exists.

- [ ] **Step 3: Commit**
```bash
git add ~/.config/waybar/themes/ps2-minimal/default/style.css
git commit -m "feat: add css styles for ps2-minimal theme"
```

### Task 5: Final Validation & Testing

**Files:**
- Modify: `~/.config/ml4w/settings/waybar-theme.sh` (Temporary for testing)

- [ ] **Step 1: Check if theme appears in switcher (Manual check simulation)**
Run: `~/.config/waybar/themeswitcher.sh` (This will open a UI, I can't do it, so I'll skip and manually set it)

- [ ] **Step 2: Manually set the theme and launch**
Run: `echo "/ps2-minimal;/ps2-minimal/default" > ~/.config/ml4w/settings/waybar-theme.sh && ~/.config/waybar/launch.sh`
Expected: Waybar restarts with the new theme.

- [ ] **Step 3: Check waybar logs for errors**
Run: `pgrep waybar && sleep 1 && journalctl --user -u waybar | tail -n 20` (or similar)
Actually, waybar is usually run directly by the launch script.
I'll just check if it's running.
Run: `pgrep waybar`
Expected: Process ID(s) returned.

- [ ] **Step 4: Commit final changes**
```bash
git add ~/.config/ml4w/settings/waybar-theme.sh
git commit -m "feat: apply ps2-minimal theme"
```
