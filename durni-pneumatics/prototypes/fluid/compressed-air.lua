local fluid = {
  type = "fluid",
  name = "durni:compressed-air",
  icon = "__durni-pneumatics__/graphics/icons/fluids/compressed-air.png",
  icon_size = 64,
  icon_mipmaps = 4,
  base_color = {r = 1, g = 1, b = 1, a = 0.6},
  flow_color = {r = 1, g = 1, b = 1, a = 0.6},
  default_temperature = 15,
  max_temperature = 15,
  fuel_value = "1J", -- TODO: Needs balancing
  auto_barrel = false
}

data:extend {fluid}
