tables = require "tables"
collision_mask_util = require "collision-mask-util"

local function tintPictures(pictures, tint)
    for _, picture in pairs(pictures) do
        picture.tint = tint
        if picture.hr_version then
            picture.hr_version.tint = tint
        end
    end
end

data:extend(
    {
        {
            type = "technology",
            name = "durni:tech-pneumatics",
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
            effects = {}
        }
    }
)

--[[---------------------------------------------------------------------------
Compressed air pipes
-----------------------------------------------------------------------------]]
local copperTint = {r = 0.922, g = 0.751, b = 0.5, a = 1}
local vPipeItem = data.raw["item"]["pipe"]
local vHeatPipeItem = data.raw["item"]["heat-pipe"]
local item =
    tables.copyUpdateAll(
    vPipeItem,
    {
        name = "durni:item-compressed-air-pipe",
        place_result = "durni:entity-compressed-air-pipe",
        icon = "__durni-pneumatics__/graphics/icons/compressed-air-pipe.png",
        icon_size = 64,
        icon_mipmaps = 4
    }
)
local recipe = {
    type = "recipe",
    name = "durni:recipe-compressed-air-pipe",
    result = "durni:item-compressed-air-pipe",
    ingredients = {
        {"copper-plate", 1}
    }
}
local vPipeEntity = data.raw["pipe"]["pipe"]
local vHeatPipeEntity = data.raw["heat-pipe"]["heat-pipe"]
local vHeatPipeSpritesCopy = table.deepcopy(vHeatPipeEntity.connection_sprites)
local entity =
    tables.copyUpdateAll(
    vPipeEntity,
    {
        name = "durni:entity-compressed-air-pipe",
        minable = tables.copyUpdateAll(
            vPipeEntity.minable,
            {result = "durni:item-compressed-air-pipe"}
        ),
        max_health = vPipeEntity.max_health / 2,
        -- If we disable collision for the player entirely then the native way pipes are rendered
        -- causes clipping with the player model. So instead, replicate Squeek Through pipe
        -- collision boxes to prevent the majority of the clipping while still allowing the player
        -- to (mostly) walk over these pipes.
        collision_box = {{-0.078125, -0.078125}, {0.078125, 0.078125}},
        pictures = tables.copyUpdateAll(
            vPipeEntity.pictures,
            {
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
                ending_left = vHeatPipeSpritesCopy.ending_left[1],
                -- vanilla heat pipe sprites were not designed for windows.
                horizontal_window_background = {
                    filename = "__durni-pneumatics__/graphics/blank.png",
                    size = 1
                },
                vertical_window_background = {
                    filename = "__durni-pneumatics__/graphics/blank.png",
                    size = 1
                }
            }
        )
    }
)
tintPictures(entity.pictures, copperTint)

data:extend({item, recipe, entity})
