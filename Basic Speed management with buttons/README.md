# Roblox Click Counter & Speed Upgrade System

A beginner-friendly Roblox Studio project featuring an interactive counter and player-specific movement speed upgrades using Luau, `ClickDetector`, and `ModuleScript`.

## Features

- **Increase Button:** Increases the shared counter and the clicking player's walking speed.
- **Decrease Button:** Decreases the shared counter and the clicking player's walking speed, provided the counter is greater than zero.
- **Shared Counter Data:** Stores the counter value in a `ModuleScript`.
- **Shared Speed Configuration:** Stores the speed increment in a separate `ModuleScript`.
- **3D UI:** Displays the current counter value using a `SurfaceGui` and `TextLabel`.

## Explorer Hierarchy

```text
Workspace
└── Counter (Model)
    ├── CounterPart (Part)
    │   └── SurfaceGui
    │       └── Count (TextLabel)
    │
    ├── increase numebr (Part)
    │   ├── ClickDetector
    │   └── Script
    │
    ├── decrease number (Part)
    │   ├── ClickDetector
    │   └── Script
    │
    ├── CounterData (ModuleScript)
    │
    └── SpeedGlobal (ModuleScript)
```

> **Note:** Adjust the names and nesting in this example to match your actual Roblox Studio Explorer hierarchy. The scripts use object names to locate their dependencies.

## How It Works

### 1. CounterData

The `CounterData` ModuleScript stores the shared counter value.

```lua
local CounterData = {}

CounterData.count = 0

return CounterData
```

Both button scripts require this module to access and modify the same counter value on the server.

### 2. SpeedGlobal

The `SpeedGlobal` ModuleScript stores the amount of speed added or removed per click.

```lua
local SpeedGlobal = {}

SpeedGlobal.speedCurrent = 16

return SpeedGlobal
```

Change `speedCurrent` to configure the speed increment used by both buttons.

### 3. Increase Button

When a player clicks the increase button:

1. The `ClickDetector.MouseClick` event identifies the player.
2. The shared counter increases by one.
3. The `Count` TextLabel displays the updated counter.
4. The clicking player's `Humanoid.WalkSpeed` increases by `SpeedGlobal.speedCurrent`.

### 4. Decrease Button

When a player clicks the decrease button:

1. The script checks whether the shared counter is greater than zero.
2. If the condition is satisfied, the counter decreases by one.
3. The TextLabel displays the updated counter.
4. The clicking player's walking speed decreases by the configured speed increment.

## Concepts Learned

- Luau variables and tables
- Functions and event callbacks
- `ClickDetector` and `MouseClick`
- Instance properties and methods
- `WaitForChild()` and object references
- ModuleScripts and `require()`
- Shared state and configuration
- Player characters and Humanoid movement
- Basic separation of responsibilities between scripts

## Limitations

This is a learning prototype, not a production-ready upgrade system.

- The counter is shared across players on the server, while speed changes apply to the individual player who clicks.
- The counter does not automatically represent each player's personal upgrade level.
- Walking speed resets when a character respawns unless the game explicitly restores it.
- The current design does not persist counter values between sessions.
- Additional validation is needed for a production multiplayer experience.

## Future Improvements

- Track upgrades separately for each player.
- Restore upgrades after character respawns.
- Add a maximum speed limit.
- Add currency costs and upgrade requirements.
- Save player progress using DataStores.
- Improve server-side validation.
- Add visual and audio feedback when buttons are clicked.

## Technologies

- Roblox Studio
- Luau
- Roblox `ClickDetector`
- Roblox `ModuleScript`
- Roblox `SurfaceGui` and `TextLabel`

## License

This project is intended as a learning resource. Add a license file if you want to specify how others may use, modify, and distribute the code.
