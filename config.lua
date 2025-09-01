local config = {

  -- Pumping Module Tier
  tier=3,

  -- ONLY CHANGE THE "TARGET" VALUES, NOT THE AMOUNTS OR RATES

  -- Planet 2 ============================================================
  ['Chlorobenzene'] =     {target=1e10,  amount=0,  rate=896000}, -- Gas 1

  -- Planet 3 ============================================================
  ['Ender Goo'] =         {target=1e10,   amount=0,  rate=32000}, -- Gas 1
  ['Very Heavy Oil'] =    {target=1e10,  amount=0,  rate=1400000}, -- Gas 2
  ['Lava'] =              {target=1e10,  amount=0,  rate=1800000}, -- Gas 3
  ['Natural Gas'] =       {target=1e10,  amount=0,  rate=1400000}, -- Gas 4

  -- Planet 4 ============================================================
  ['Sulfuric Acid'] =     {target=1e10,  amount=0,  rate=784000}, -- Gas 1
  ['Molten Iron'] =       {target=1e10,  amount=0,  rate=896000}, -- Gas 2
  ['Oil'] =               {target=1e10,  amount=0,  rate=1400000}, -- Gas 3
  ['Heavy Oil'] =         {target=1e10,  amount=0,  rate=1792000}, -- Gas 4
  ['Molten Lead'] =       {target=1e10,  amount=0,  rate=896000}, -- Gas 5
  ['Raw Oil'] =           {target=1e10,  amount=0,  rate=1400000}, -- Gas 6
  ['Light Oil'] =         {target=1e10,  amount=0,  rate=780000}, -- Gas 7
  ['Carbon Dioxide'] =    {target=1e10,  amount=0,  rate=1680000}, -- Gas 8

  -- Planet 5 ============================================================
  ['Carbon Monoxide'] =   {target=1e10,  amount=0,  rate=4480000}, -- Gas 1
  ['Helium-3'] =          {target=1e10,  amount=0,  rate=2800000}, -- Gas 2
  ['Salt Water'] =        {target=1e10,  amount=0,  rate=2800000}, -- Gas 3
  ['Helium'] =            {target=1e10,  amount=0,  rate=1400000}, -- Gas 4
  ['Liquid Oxygen'] =     {target=1e10,  amount=0,  rate=896000}, -- Gas 5
  ['Neon'] =              {target=1e10,   amount=0,  rate=32000}, -- Gas 6
  ['Argon'] =             {target=1e10,   amount=0,  rate=32000}, -- Gas 7
  ['Krypton'] =           {target=1e10,   amount=0,  rate=8000}, -- Gas 8
  ['Methane'] =           {target=1e10,  amount=0,  rate=1792000}, -- Gas 9
  ['Hydrogen Sulfide'] =  {target=1e10,  amount=0,  rate=392000}, -- Gas 10
  ['Ethane'] =            {target=1e10,  amount=0,  rate=1194000}, -- Gas 11

  -- Planet 6 ============================================================
  ['Deuterium'] =         {target=1e10,  amount=0,  rate=1568000}, -- Gas 1
  ['Tritium'] =           {target=1e10,  amount=0,  rate=240000}, -- Gas 2
  ['Ammonia'] =           {target=1e10,  amount=0,  rate=240000}, -- Gas 3
  ['Xenon'] =             {target=1e10,   amount=0,  rate=16000}, -- Gas 4
  ['Ethylene'] =          {target=1e10,  amount=0,  rate=1792000}, -- Gas 5

  -- Planet 7 ============================================================
  ['Hydrofluoric Acid'] = {target=1e10,  amount=0,  rate=672000}, -- Gas 1
  ['Fluorine'] =          {target=1e10,  amount=0,  rate=1792000}, -- Gas 2
  ['Nitrogen'] =          {target=1e10,  amount=0,  rate=1792000}, -- Gas 3
  ['Oxygen'] =            {target=1e10,  amount=0,  rate=1729000}, -- Gas 4

  -- Planet 8 ============================================================
  ['Hydrogen'] =          {target=1e10,  amount=0,  rate=1568000}, -- Gas 1
  ['Liquid Air'] =        {target=1e10,  amount=0,  rate=875000}, -- Gas 2
  ['Molten Copper'] =     {target=1e10,  amount=0,  rate=672000}, -- Gas 3
  ['Unknown Liquid'] =    {target=1e10,  amount=0,  rate=672000}, -- Gas 4
  ['Distilled Water'] =   {target=1e10,  amount=0,  rate=17920000}, -- Gas 5
  ['Radon'] =             {target=1e10,   amount=0,  rate=64000}, -- Gas 6
  ['Molten Tin'] =        {target=1e10,  amount=0,  rate=672000} -- Gas 7
}

config.mult = 4 ^ (2 ^ (config.tier-1))
return config