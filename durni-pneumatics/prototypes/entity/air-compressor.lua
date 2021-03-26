local todo = require "todo"

local vFurnace = data.raw["furnace"]["electric-furnace"]
local vAssembler = data.raw["assembling-machine"]["assembling-machine-2"]
local vHeatExchanger = data.raw["boiler"]["heat-exchanger"]
local entity =
  util.merge {
  vAssembler,
  {
    name = "durni:air-compressor",
    minable = {
      result = "durni:air-compressor"
    },
    crafting_categories = {"durni:air-compressor"},
    crafting_speed = 1,
    energy_usage = "100kW",
    source_inventory_size = 0,
    result_inventory_size = 0
  }
}
entity.next_upgrade = nil
entity.fluid_boxes = {
  {
    production_type = "output",
    filter = "durni:compressed-air",
    base_area = 10,
    base_level = 0.2,
    pipe_covers = vHeatExchanger.energy_source.pipe_covers,
    pipe_connections = {{type = "output", position = {0, 2}}}
  }
}
entity.icon = util.copy(vFurnace.icon)
entity.animation = util.copy(vFurnace.animation)
todo.tintEntity(entity, todo.copperTint)

data:extend {entity}
