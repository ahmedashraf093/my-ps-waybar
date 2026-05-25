# Design Specification: PS2 Minimal Waybar Theme

## Overview
A custom Waybar theme for Arch Linux (ML4W environment) inspired by the retro Playstation 2 aesthetic. It combines a modern minimal layout with iconic Playstation elements, specifically using the controller face buttons as workspace indicators.

## Architecture & Layout
- **Position**: Top of the screen.
- **Width**: 100% (Full Width).
- **Height**: 32px.
- **Background**: Solid PS2 Black (`#1a1a1a`).
- **Modules**:
  - **Left**: `custom/appmenu` (Playstation Logo), `hyprland/workspaces`.
  - **Center**: `clock`.
  - **Right**: `network`, `pulseaudio`, `battery`, `tray`.

## Visual Elements

### Icons & Colors
- **Font**: `JetBrainsMono Nerd Font`
- **App Menu**: `\uF3DF` (Playstation Logo) - Color: `#ffffff`
- **Workspaces**:
  - **Workspace 1**: `\uF0531` (Triangle) - Color: `#00ac9f`
  - **Workspace 2**: `\uF0131` (Circle) - Color: `#f05053`
  - **Workspace 3**: `\uF0156` (Cross/X) - Color: `#568ec9`
  - **Workspace 4**: `\uF04C5` (Square) - Color: `#cd70a7`
  - **Active Workspace**: Underline or slightly brighter color of the icon.
  - **Inactive Workspace**: Grayed out version or outline only.

### Modules Style
- **Clock**: Digital style, white text.
- **Network/Battery/Volume**: 
  - Wifi: `\uF05AA` (PSP-like signal)
  - Battery: `\uF0083` (Pixel-style battery)
  - Volume: `\uF057E` (Classic speaker)

## Implementation Details
1. Create a new theme directory: `~/.config/waybar/themes/ps2-minimal/`.
2. Create a variation directory: `~/.config/waybar/themes/ps2-minimal/default/`.
3. Create `config.sh` in the variation directory to register the theme name.
4. Create `config` (Waybar JSON) in the theme directory.
5. Create `style.css` in the variation directory.
6. Integrate with ML4W `themeswitcher.sh` by following the directory structure.

## Success Criteria
- The theme appears in the ML4W Waybar themeswitcher.
- Selecting the theme applies the PS2 Black background and Playstation icons.
- All modules function correctly and follow the minimal retro aesthetic.
