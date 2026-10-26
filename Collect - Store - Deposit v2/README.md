# Essence Pipeline

**Status: Still Working**

## 1. Overview

The Essence Pipeline is a resource collection and transfer system being developed in Roblox Studio using Luau.

The goal is to simulate a basic resource economy in which players collect Essence, store it in their inventory, and transfer it into machine storage by interacting with physical plates.

The current implementation focuses on resource transfer, ModuleScripts, shared state, collision detection, and UI updates. The system is being developed incrementally, with an emphasis on understanding the underlying logic before introducing more complex gameplay mechanics.

## 2. Core Concept

The system consists of three resource states:

- **Collectable Essence:** The amount of Essence currently available for collection.
- **Inventory Essence:** The amount of Essence currently held in the inventory.
- **Machine Essence:** The amount of Essence deposited into machine storage.

Each state has its own responsibility and is tracked independently using ModuleScripts.

### Resource Flow

1. The player interacts with the collection plate.
2. The system detects contact with the plate and checks whether collection is permitted.
3. The available Essence is transferred into the inventory.
4. The collectable Essence amount is reset to zero after a successful collection.
5. The player interacts with the deposit plate.
6. The inventory's Essence is transferred into machine storage.
7. The inventory amount is reset to zero after the transfer.
8. The relevant UI TextLabels update to display the current resource values.

Collection and deposit are handled as separate interactions.

## 3. System Components

### Collection Plate

The Collection Plate is the physical interaction point used to collect Essence.

It uses Roblox's `Touched` event to detect contact with a character. A basic debounce mechanism prevents repeated touch events from immediately triggering duplicate collections.

When a valid interaction occurs, the available Essence is transferred into the inventory, and the collectable amount is reset.

### Collectable Essence

Represents the amount of Essence currently available for collection.

The original prototype used a fixed collection amount of **10 Essence per successful collection**. The current transfer logic uses the amount displayed by the collection counter, allowing the collected quantity to be transferred into the inventory.

The collectable amount is reset after collection.

### Inventory

Stores the Essence collected from the collection plate.

The inventory data is managed through the `InventoryEssence` ModuleScript.

When Essence is collected, the inventory balance increases. When Essence is deposited into machine storage, the inventory balance is reset to zero.

### Machine Storage

Stores Essence deposited from the inventory.

The machine's stored amount is managed through the `MachineEssence` ModuleScript.

When the player interacts with the deposit plate, the inventory balance is transferred into machine storage, and the machine's displayed count is updated.

The current implementation focuses on transferring Essence rather than implementing the machine's eventual conversion mechanics.

### User Interface

The system uses Roblox GUI `TextLabel` objects to display resource amounts.

The current UI includes:

1. **Can Collect Count** — displays the available Essence amount.
2. **Your Inventory Count** — displays the Essence currently held in the inventory.
3. **Machine Storage Count** — displays the Essence deposited into machine storage.

The labels are updated by the corresponding scripts when collection or deposit operations occur.

## 4. ModuleScript Architecture

The system uses separate ModuleScripts to represent its resource states:

- `CanCollectEssence`
- `InventoryEssence`
- `MachineEssence`

The modules return tables containing resource data, which scripts access through `require()`.

For example, the inventory module stores its Essence balance as a table field:

```lua
local InventoryEssence = {
    Essence = 0
}

return InventoryEssence
```

The returned table can be accessed through its field:

```lua
InventoryEssence.Essence
```

The collection and deposit scripts explicitly update these values and refresh the corresponding UI labels.

**Important:** ModuleScripts do not automatically transfer resources or synchronize separate tables. Their returned values are cached within the relevant Luau execution environment. The current prototype uses shared module data; separate player inventories and robust multiplayer handling remain future improvements.

## 5. Current Implementation

The following mechanics have been implemented or are being tested:

- Collection plate touch detection.
- Basic debounce logic for collection interactions.
- Inventory data stored in a ModuleScript.
- Machine storage data stored in a separate ModuleScript.
- Transfer of available Essence into inventory.
- Transfer of inventory Essence into machine storage.
- Resetting the source balance after a successful transfer.
- Updating UI TextLabels to reflect resource amounts.
- Using `tonumber()` and `tostring()` to handle conversions between numeric values and GUI text.

The system is still being tested, and additional refinement is required to ensure reliable interactions.

## 6. Current Development Goals

- Complete and test the collection-to-inventory pipeline.
- Complete and test the inventory-to-machine deposit pipeline.
- Verify that all resource values and UI labels remain consistent.
- Improve touch detection and debounce handling.
- Organize scripts and ModuleScripts for easier maintenance.
- Test resource transfers under different interaction conditions.
- Separate player inventories when implementing multiplayer support.
- Prepare the system for future machine conversion mechanics.

## 7. Scope and Limitations

The current prototype is intended for learning and testing resource management in Roblox Studio.

The following features are not yet implemented or fully validated:

- Persistent saving of player data.
- Automatic Essence production or regeneration.
- Essence-to-coin conversion.
- Machine upgrades.
- Advanced inventory management.
- Separate inventories for individual players.
- Robust multiplayer resource handling.
- Final validation of touch detection and UI synchronization.

These features may be added after the basic collection and deposit pipeline is stable.

## 8. Current Explorer Structure

The project uses a collection plate, inventory objects, machine storage objects, GUI elements, and ModuleScripts.

The exact hierarchy may change as development continues. The following is a partial structure based on the current implementation:

```text
Collection Plate
├── Collection interaction objects
├── CanCollectEssence
├── InventoryEssence
├── MachineEssence
└── PlateForCollect
    └── Gui1
        └── CanCollectCount

Inventory
└── Gui1
    └── YourInventoryCount

MachineStorage
└── Gui1
    └── MachineStorageCount
```

This is a logical overview rather than a verified, complete Explorer hierarchy. Object paths in the scripts must match the actual project structure.

---

## Development Status

**Still Working**

The collection and deposit mechanics are being developed as part of an ongoing effort to learn Luau, Roblox events, ModuleScripts, resource management, and UI integration.