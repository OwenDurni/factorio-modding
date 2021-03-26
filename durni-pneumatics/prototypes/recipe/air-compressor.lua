local devmode = settings.startup["durni:startup:dev-mode"].value

local recipe = {
  type = "recipe",
  name = "durni:air-compressor",
  result = "durni:air-compressor",
  ingredients = {
    {"electronic-circuit", 2},
    {"iron-gear-wheel", 5},
    {"durni:compressed-air-pipe", 10}
  },
  enabled = devmode
}

data:extend {recipe}
