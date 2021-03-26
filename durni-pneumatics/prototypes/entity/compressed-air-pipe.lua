local todo = require "todo"

local vPipeEntity = data.raw["pipe"]["pipe"]
local vHeatPipeEntity = data.raw["heat-pipe"]["heat-pipe"]
local vHeatPipeSpritesCopy = util.copy(vHeatPipeEntity.connection_sprites)
local entity =
  util.merge {
  vPipeEntity,
  {
    name = "durni:compressed-air-pipe",
    minable = {
      result = "durni:compressed-air-pipe"
    },
    max_health = vPipeEntity.max_health / 2,
    -- If we disable collision for the player entirely then the native way pipes are rendered
    -- causes clipping with the player model. So instead, replicate Squeek Through pipe
    -- collision boxes to prevent the majority of the clipping while still allowing the player
    -- to (mostly) walk over these pipes.
    collision_box = {{-0.078125, -0.078125}, {0.078125, 0.078125}},
    pictures = {
      -- use the heat pipe graphics from vanilla (with a copper tint applied below)
      straight_vertical_single = vHeatPipeSpritesCopy.single[1],
      straight_vertical = vHeatPipeSpritesCopy.straight_vertical[1],
      straight_vertical_window = vHeatPipeSpritesCopy.straight_vertical[1],
      straight_horizontal = vHeatPipeSpritesCopy.straight_horizontal[1],
      straight_horizontal_window = vHeatPipeSpritesCopy.straight_horizontal[1],
      corner_up_right = vHeatPipeSpritesCopy.corner_right_up[1],
      corner_up_left = vHeatPipeSpritesCopy.corner_left_up[1],
      corner_down_right = vHeatPipeSpritesCopy.corner_right_down[1],
      corner_down_left = vHeatPipeSpritesCopy.corner_left_down[1],
      t_up = vHeatPipeSpritesCopy.t_up[1],
      t_down = vHeatPipeSpritesCopy.t_down[1],
      t_right = vHeatPipeSpritesCopy.t_right[1],
      t_left = vHeatPipeSpritesCopy.t_left[1],
      cross = vHeatPipeSpritesCopy.cross[1],
      ending_up = vHeatPipeSpritesCopy.ending_up[1],
      ending_down = vHeatPipeSpritesCopy.ending_down[1],
      ending_right = vHeatPipeSpritesCopy.ending_right[1],
      ending_left = vHeatPipeSpritesCopy.ending_left[1]
    }
  }
}
-- vanilla heat pipe sprites were not designed for windows
entity.horizontal_window_bounding_box = {{0, 0}, {0, 0}}
entity.vertical_window_bounding_box = {{0, 0}, {0, 0}}
entity.pictures.horizontal_window_background = util.empty_sprite(0)
entity.pictures.vertical_window_background = util.empty_sprite(0)
todo.tintPictures(entity.pictures, todo.copperTint)

data:extend {entity}
