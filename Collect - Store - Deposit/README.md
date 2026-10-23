# Essence Pipeline

**Status: Still Working**

## 1. Overview

The Essence Pipeline is a resource collection and transfer system being developed in Roblox Studio using Luau.

The goal is to simulate a basic resource economy in which players collect Essence, store it in their inventory, and transfer it into a machine by interacting with physical plates.

The current version uses fixed values for testing. Each collection grants exactly **10 Essence**. The primary focus is learning Roblox events, ModuleScripts, shared state, collision detection, and UI updates before introducing more complex gameplay mechanics.

## 2. Core Concept

The system consists of three resource states:

- **Collectable Essence:** The amount of Essence currently available for collection.
- **Inventory Essence:** The amount of Essence currently held by the player.
- **Machine Essence:** The amount of Essence deposited into the machine.

Each state has its own responsibility and should be tracked independently.

### Resource Flow

1. The player approaches and steps onto the collection plate.
2. The system detects contact with the plate.
3. If collection is permitted, the player collects exactly 10 Essence.
4. The player's inventory is updated.
5. The player steps onto the deposit plate.
6. The inventory Essence is transferred into the machine's storage.
7. The UI updates to reflect the current resource values.

The collection and deposit operations are separate interactions.

## 3. System Components

### Collection Plate

The Collection Plate is the physical interaction point used to collect Essence.

It uses Roblox interaction events to detect when a character touches the plate. The collection logic will validate the interaction and prevent repeated collision events from granting duplicate rewards.

### Collectable Essence

Represents the fixed amount of Essence available to collect.

For the current prototype, the collection amount is **10 Essence per successful collection**.

### Player Inventory

Stores the Essence collected by the player.

The inventory is separate from both the collectable amount and the machine's storage. Collecting Essence increases inventory, while depositing Essence transfers it out of inventory.

### Machine Storage

Stores Essence deposited by the player.

The machine's stored amount increases when a valid deposit occurs. This prototype focuses on transferring Essence rather than implementing the machine's eventual conversion mechanics.

### User Interface

Three TextLabels will display the current system state:

1. **Can Collect** — displays the amount of Essence available to collect.
2. **Inventory** — displays the player's current Essence balance.
3. **Essence Stored in Machine** — displays the amount deposited into the machine.

The displayed values should update when the corresponding resource state changes.

## 4. ModuleScript Architecture

The system is planned around three separate ModuleScripts:

- `CanCollectEssence`
- `InventoryEssence`
- `MachineEssence`

Each module represents a distinct resource state and provides a place to organize its associated data.

Scripts attached to different parts can use `require()` to access the appropriate modules, provided those modules are located at the expected paths and run in the same Luau execution environment.

**Important:** ModuleScripts return values; they do not automatically synchronize separate tables or transfer resources between them. The collection and deposit scripts must explicitly perform these operations.

For multiplayer correctness, authoritative inventory and machine changes should be handled by server-side code. Player inventories must remain separate, while shared machine storage can be managed centrally.

## 5. Current Development Goals

- Implement the collection plate's contact detection.
- Track successful collection interactions.
- Grant exactly 10 Essence per successful collection.
- Implement the player's inventory state.
- Implement the machine's storage state.
- Add the deposit plate and resource transfer logic.
- Connect the three TextLabels to the relevant values.
- Prevent duplicate collection or deposit caused by repeated touch events.
- Test the system in Roblox Studio.
- Keep the implementation modular and understandable.

## 6. Scope and Limitations

The current prototype uses constant collection values and is intended for learning and testing.

The following features are not yet implemented or confirmed:

- Persistent saving of player data.
- Production or regeneration of Essence.
- Essence-to-coin conversion.
- Machine upgrades.
- Advanced inventory management.
- Final multiplayer validation and UI synchronization.

These features may be considered after the basic collection and deposit pipeline works correctly.

## 7. Current Explorer Folder Structure

The following structure reflects the visible objects in the current Roblox Studio Explorer screenshot. Only visible items are listed; additional children may exist outside the captured area.

```text
Collection Plate
├── ClickDetector
├── TouchDetected
├── CanCollectEssence
├── InventoryEssence
├── MachineEssence
└── PlateForCollect
    └── Gui1
        ├── CanCollect
        └── CanCollectCount
```

The exact object classes and the implementation of the scripts still need to be verified. The deposit plate and the remaining UI elements will be documented when they are added.

---

## Development Status

**Still Working**
