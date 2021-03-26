local tech = {
  type = "technology",
  name = "durni:pneumatics",
  icon = "__durni-pneumatics__/graphics/technology/pneumatics.png",
  icon_size = 128,
  prerequisites = {},
  unit = {
    count = 5,
    time = 10,
    ingredients = {
      {"automation-science-pack", 1}
    }
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "durni:compressed-air-pipe"
    },
    {
      type = "unlock-recipe",
      recipe = "durni:air-compressor"
    },
    {
      type = "unlock-recipe",
      recipe = "durni:air-compressor:compressed-air"
    }
  }
}

data:extend {tech}
