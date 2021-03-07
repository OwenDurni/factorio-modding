local function sprite(name)
    return '__durni-pneumatics__/sprites/'..name
    end

data:extend({{
  type = 'technology',
  name = 'durni:tech-pneumatics',

  icon = sprite 'tech-pneumatics.png',
  icon_size = 128,
  
  prerequisites = {},
  unit = {
      count = 5,
      time = 10,
      ingredients = {
          {'automation-science-pack', 1},
      },
  },
  effects = {},
}})