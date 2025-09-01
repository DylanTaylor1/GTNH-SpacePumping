These Open Computers (OC) scripts automatically switch a Space Elevator's (SE) Pumping Module settings based on which fluids are needed at the time. This saves from having to manually change the Pumping Module settings all the time, or creating dedicated modules for each fluid. This guide walks through every step of the process, from building the pump bot to debugging and troubleshooting. No prior knowledge of OC is necessary.

The general idea is that the robot sits next to the Pumping Module with preconfigured parametrizer memory cards stored in its inventory. The parametrizer memory cards are renamed to identify them (ie. "Chlorobenzene"). The robot detects when certain fluids are low and automatically applies the appropriate card to change the Pumping Module settings. The fluids themselves should be stored in an AE2 subnetwork rather than the player's main network to save TPS.

# Bare Minimum Components

The following list is everything that is required to build the pump bot. Lower tier components could technically be used instead, but the cost is irrelevant by UHV. The solar generator upgrades are also not technically necessary, but it foregoes the need for an OC charger sitting underneath the robot; it can sustainably power itself with sky access.

- OC Electronics Assembler
- Tier 3 Computer Case
- Tier 3.5 Memory
- Tier 3 Graphics Card
- Tier 3 Central Processing Unit
- Tier 3 Hard Disk Drive
- Tier 1 Screen
- Tier 1 Redstone Card
- Internet Card
- Keyboard
- Disk Drive (Block)
- ME Upgrade
- Solar Generator Upgrade x2
- Inventory Controller Upgrade
- Inventory Upgrade x3
- EEPROM (Lua Bios)
- OpenOS Floppy Disk

![PumpBotComponents](media/PumpBotComponents.png?)

Not included in this list are all the parametrizer memory cards needed to switch the Pumping Module settings. Each unique fluid requires its own parametrizer memory card so make a lot of them. The three inventory upgrades provide the robot with 48 internal inventory slots which is more than enough to support all 40 SE fluids. Follow the steps below in preparing the parametrizer memory cards for use. Note that the parametrizer card copies all available recipes and the number of parallels so ALL cards must be updated every time the Pumping Module is upgraded.

  1. Manually adjust the Pumping Module settings to the desired fluid. For MK-II and MK-III Pumping Modules, ensure all four recipes are set to the same fluid with the maximum number of parallels.

  2. Right-click the Pumping Module with the parametrizer memory card in hand to copy the settings. A message in chat should appear to confirm a successful exchange.

  3. Switch the parametrizer memory card to paste-mode by sneak right-clicking with the card in hand. The blue slider on the edge of the card should be in the down position.

  4. Rename the parametrizer memory card to the display name of the fluid. The name must match exactly (ie. "Carbon Dioxide") or else the script will throw an error and crash.

Also not included in the list is an ME security terminal and ME wireless access point. They are needed to connect the robot to the SE subnetwork containing all the fluids. Ensure the Pumping Module is within range of the wireless access point. The range can be extended with wireless boosters.

![PumpBotCards](media/PumpBotCards.png?)

# Building the Robot

  1. Insert the computer case into the OC Electronics Assembler. Power it with any GT cable.

  2. Shift-click all the components into the computer case except the OpenOS floppy disk. Click assemble and wait until it completes (~5min 30sec).

  3. Rename the robot in an anvil (optional).

  4. Pass the robot through an ME security terminal on the SE subnetwork with all the SE fluids. This links the robot to the network and allows it to read the current fluid levels.

  5. Place the robot facing the side of the SE Pumping Module. Ensure that it has sky access if using solar generator upgrades, otherwise use an OC Charger and power it with any GT cable. The OC Charger must be activated using some form of redstone such as a lever.

  6. Insert the OpenOS floppy disk into the disk slot of the robot and press the power button.

  7. Follow the commands on screen install --> Y --> Y (The OpenOS floppy disk is no longer needed in the robot afterwards).

  8. Install the required scripts by copying this line of code into the robot (middle-click to paste).

    wget https://raw.githubusercontent.com/DylanTaylor1/GTNH-SpacePumping/main/setup.lua && setup

  10. Edit the config by entering ```edit config.lua```. Change only the TARGET values as necessary. Any fluid without a parametrizer memory card inside the robot is ignored. Changing anything inside the config requires you to restart your robot.

  11. Place the parametrizer memory cards in the robot. Insert them top-to-bottom and left-to-right, as shown in the image above.

![PumpBotInventory](media/PumpBotInventory.png?)

# Building the Setup

The pump bot faces the side of the SE Pumping Module. Place a machine controller cover set to ENABLE WITH REDSTONE on the same side. Also place a 1,024k ME fluid storage cell (or larger) in the ME output hatch connected to the SE subnetwork (blue). The SE subnetwork (blue) should have at least one ME drive for storing fluids and a security terminal for linking the robot. It may be useful to partition the fluid storage cells for additional control. The wireless access point's default range is 16 blocks which is more than enough for this setup.

Place an ME dual interface somewhere on the SE subnetwork (blue) facing directly into an ME fluid storage bus on the main network (green). This allows the main network to use all the available fluids while also minimizing the size of the AE2 queries that the pump bot routinely makes. Lastly, an anvil sits nearby for quick and easy renaming of the parametrizer memory cards.

![PumpBotSetup](media/PumpBotSetup.png?)

# Running the Program

The only program autoPump first maps the parametrizer memory cards inside of its inventory to the fluids that they are named after. Next, it enters a loop that begins with querying the SE subnetwork to determine which fluid is the lowest percent relative to its target value. The pump bot then switches the pumping module settings to that fluid and lets it run until the target value is reached. If all current fluid levels are above their target values, the pump bot starts to idle for 3 minute intervals until it is needed again. To run, simply enter:

    autoPump

To interrupt the program, simply restart the robot or press CTRL+ALT+C. One last reminder that changing anything in the config requires you to restart your robot.

# Troubleshooting

**Attempt to index a nil value.** This error can occur if the robot was never passed through the ME security terminal to link it to the SE subnetwork. The wireless access point may also not be in range.

**Attempt to index a nil value (field '?').** This error can occur if a parametrizer memory card has an invalid name. Check for typos and that it matches the display name of the fluid exactly.

# Fluids

![PumpBotFluids](media/PumpBotFluids.png?)

## Other Helpful Commands

To list all of the files installed on the robot, enter

    ls

To edit (or create) a new file, enter

    edit <filename>.lua

To remove any one file installed on the robot, enter

    rm <filename>

To uninstall all of the files from this repo, enter

    uninstall

To view an entire error message regardless of how long it may be, enter

    <program> 2>/errors.log

    edit /errors.log

## Thanks
Huge thanks to hacatu for their initial implementation and inspiration!
