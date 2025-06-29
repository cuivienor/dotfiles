# AeroSpace Configuration

This configuration replicates your i3 setup as closely as possible on macOS, with special considerations for dual monitor usage.

## Dual Monitor Setup

### Workspace Assignment
**When Docked (Two External Monitors):**
- **Workspaces 1-5**: Primary external monitor
  - Workspace 1:  Terminal (Ghostty)
  - Workspace 2:  Code Editor (Cursor)
  - Workspace 3:  Browser (Chrome)
  - Workspace 4:  Development Tools (VSCode, IntelliJ, Docker)
  - Workspace 5:  Files/Documents

- **Workspaces 6-10**: Secondary external monitor (vertical orientation)
  - Workspace 6:  Communication (Slack, Teams, Discord)
  - Workspace 7:  System/Monitoring
  - Workspace 8:  Media/Music (Spotify)
  - Workspace 9:  Notes/Writing
  - Workspace 10:  General/Misc
  - **Note**: Use `Cmd + Shift + T` to reorganize existing windows into horizontal layout (stacked windows) for vertical monitor

**When Undocked (Single Built-in Display):**
- **All Workspaces 1-10**: Available on built-in display
  - Same workspace symbols and app assignments
  - Seamless transition between docked/undocked states

### Key Bindings

#### Basic Navigation (same as i3)
- `Cmd + h/j/k/l`: Focus left/down/up/right
- `Cmd + Shift + h/j/k/l`: Move window left/down/up/right
- `Cmd + Enter`: Open **new** terminal window (Ghostty)
- `Cmd + Shift + Enter`: Open **new** browser window (Chrome)
- `Cmd + Shift + Q`: Close window
- `Cmd + D`: App launcher (Raycast)

#### Workspaces
- `Cmd + 1-9,0`: Switch to workspace 1-10
- `Cmd + Shift + 1-9,0`: Move window to workspace 1-10

#### Layout Controls
- `Cmd + F`: Fullscreen
- `Cmd + Shift + Space`: Toggle floating/tiling
- `Cmd + Space`: Cycle layouts
- `Cmd + -`: Join with left window (side-by-side)
- `Cmd + Shift + \`: Join with upper window (stacked)
- `Cmd + Shift + -`: Join with right window (alternative side-by-side)
- `Cmd + Shift + =`: Join with lower window (alternative stacked)

#### Monitor-Specific Layout Optimization
- `Cmd + Shift + V`: Force vertical layout (side-by-side windows, ideal for main monitor)
- `Cmd + Shift + T`: Force horizontal layout (stacked windows, ideal for secondary vertical monitor)

**Note**: These commands flatten the workspace and reorganize ALL existing windows into the new layout.

#### Monitor Navigation (Dual Monitor)
- `Cmd + Ctrl + h/l`: Focus left/right monitor
- `Cmd + Ctrl + Shift + h/l`: Move workspace to left/right monitor
- `Cmd + Shift + Ctrl + 1/2`: Move window to left/right monitor and follow

#### Resize Mode
- `Cmd + R`: Enter resize mode
  - `h/j/k/l`: Resize window
  - `Enter/Esc`: Exit resize mode

#### Configuration
- `Cmd + Shift + C`: Reload config
- `Cmd + Shift + R`: Restart AeroSpace

## Features

- **Mouse follows focus**: When switching monitors, mouse moves to center
- **Auto-start**: AeroSpace starts at login
- **Window rules**: Apps automatically assigned to appropriate workspaces
- **No gaps**: Seamless window tiling with zero gaps
- **i3-like behavior**: Familiar key bindings and workflow
- **Proper new windows**: Uses AppleScript to create new windows instead of focusing existing ones
- **Monitor-optimized layouts**: Quick commands to set ideal layouts for each monitor orientation
- **Focus follows mouse**: Uses AutoRaise for true focus-follows-mouse behavior

## Usage Tips

1. **Docked Setup**: Workspaces 1-5 on primary external monitor, 6-10 on secondary external monitor (built-in closed)
2. **Undocked Setup**: All workspaces 1-10 available on single built-in display
3. **Seamless Transition**: Same workspace numbers work in both configurations - your workflow stays consistent
4. Use `Cmd + Ctrl + h/l` to quickly switch between external monitors when docked
5. Communication apps (Slack, Teams) auto-assign to workspace 6 (secondary external when docked, built-in when undocked)
6. Development tools auto-assign to workspace 4 (primary external when docked, built-in when undocked)
7. **Muscle Memory**: Your i3 workspace habits transfer perfectly - `Cmd + 1` always gets you to your terminal workspace regardless of monitor setup

## Installation Requirements

To get the full experience, install AutoRaise for focus-follows-mouse:

**Manual Installation:**
1. Download AutoRaise from: https://github.com/sbmpost/AutoRaise
2. Follow the installation instructions in the repository
3. AutoRaise will start automatically with AeroSpace once installed

AutoRaise provides seamless focus-follows-mouse behavior just like i3. 