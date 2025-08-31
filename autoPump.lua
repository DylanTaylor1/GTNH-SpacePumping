local config = require('config')
local component = require('component')
local sides = require('sides')
local robot = require('robot')
local me = component.upgrade_me
local inv = component.inventory_controller
local r = component.redstone
local master = {}

-- ===================== FUNCTIONS ======================

function mapCards()
  for i=1, robot.inventorySize() + 1 do
    local card = inv.getStackInInternalSlot(i)

    -- Update card slot, add to master
    if card ~= nil then
      config[card.label].slot = i
      master[card.label] = config[card.label]
    else
      break
    end
  end
end


function updateFluids()
  for _, fluid in pairs(master) do
    fluid.amount = 0
  end

  -- Retrieve from ME network
  for _, fluid in ipairs(me.getFluidsInNetwork()) do
    if master[fluid.label] ~= nil then
      master[fluid.label].amount = fluid.amount
    end
  end
end


function selectFluid()
  local lowest = nil
  local lowestPercent = 1

  -- Iterate over the known cards
  for label, fluid in pairs(master) do
    local percent = fluid.amount / fluid.target
    if percent < lowestPercent then
      lowest = label
      lowestPercent = percent
    end
  end
  return lowest
end


function calcDuration(fluid)
  return 1.05 * (master[fluid].target - master[fluid].amount) / (master[fluid].rate * config.mult)
end


function setFluid(fluid, duration)
  -- Use appropriate card
  robot.select(master[fluid].slot)
  inv.equip()
  robot.use()
  inv.equip()
  r.setOutput(sides.front, 15)

  -- Wait set duration
  os.sleep(duration)
end

-- ======================== MAIN ========================

local function main()
  print('autoPump: Reading Cards')
  mapCards()

  -- THE LOOP
  while true do

    -- Determine lowest fluid (% of target)
    updateFluids()
    fluid = selectFluid()

    -- Set pump settings
    if fluid ~= nil then
      print(string.format('autoPump: Switching to %s', fluid))
      duration = calcDuration(fluid)
      setFluid(fluid, duration)
    else
      -- All targets reached, sleep for 3 minutes
      print('autoPump: Standing by...')
      os.sleep(180)
    end

    -- Pause to change fluid
    r.setOutput(sides.front, 0)
    os.sleep(1)

  end
end

main()