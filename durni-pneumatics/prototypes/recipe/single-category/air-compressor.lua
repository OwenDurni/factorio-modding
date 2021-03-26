local devmode = settings.startup["durni:startup:dev-mode"].value

data:extend(
  {
    {
      type = "recipe-category",
      name = "durni:air-compressor"
    },
    {
      type = "recipe",
      name = "durni:air-compressor:compressed-air",
      category = "durni:air-compressor",
      ingredients = {},
      results = {
        {type = "fluid", name = "durni:compressed-air", amount = 100}
      },
      enabled = devmode,
      hide_from_player_crafting = true
    }
  }
)
