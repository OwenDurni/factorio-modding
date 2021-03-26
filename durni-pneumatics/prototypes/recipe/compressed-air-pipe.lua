local devmode = settings.startup["durni:startup:dev-mode"].value

local recipe = {
  type = "recipe",
  name = "durni:compressed-air-pipe",
  result = "durni:compressed-air-pipe",
  ingredients = {
    {"copper-plate", 1}
  },
  enabled = devmode
}

data:extend {recipe}
