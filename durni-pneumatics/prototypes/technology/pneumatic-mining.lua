local tech = {
  type = "technology",
  name = "durni:pneumatic-mining",
  icon = "__durni-pneumatics__/graphics/technology/pneumatic-mining.png",
  icon_size = 128,
  prerequisites = {"durni:pneumatics"},
  unit = {
    count = 10,
    time = 10,
    ingredients = {
      {"automation-science-pack", 1}
    }
  },
  effects = {}
}

data:extend {tech}
