--[[--------------------------------------------------------------------------
Functions for quickly borrowing prototypes and graphics that already exist.

In theory the idea is to make this searchable so that all such instances could
be replaced before a "1.0" version of the mod was released.
-----------------------------------------------------------------------------]]
local todo = {}

todo.tint = {r = 1, g = 0.3, b = 0, a = 1}
todo.copperTint = {r = 0.922, g = 0.751, b = 0.5, a = 1}

--[[
These functions are probably incomplete. It was iteratively written as I encountered
scenarios where it didn't work.  
]]
local tintTableWithIconSpecification
function todo.tintEntity(entity, tint)
  tint = tint or todo.tint
  assert(
    type(entity) == "table" and entity.type and entity.name,
    "entity was not a Factorio entity prototype"
  )
  tintTableWithIconSpecification(entity, tint)
  if entity.water_reflection and entity.water_reflection.pictures then
    todo.tintPictures(entity.water_reflection.pictures)
  end
end
function todo.tintItem(item, tint)
  tint = tint or todo.tint
  assert(
    type(item) == "table" and item.type and item.type == "item",
    "item was not a Factorio item prototype"
  )
  tintTableWithIconSpecification(item, tint)
  tintTableWithIconSpecification(item, tint, "dark_background_icon", "dark_background_icons")
  if item.pictures then
    todo.tintPictures(item.pictures)
  end
end
function todo.tintPictures(pictures, tint)
  for _, sprite in pairs(pictures) do
    assert(sprite and sprite.filename, "expected Types/Sprite found " .. type(sprite))
    sprite.tint = tint
    if sprite.hr_version then
      sprite.hr_version.tint = tint
    end
  end
end
function tintTableWithIconSpecification(t, tint, icon_field_name, icons_field_name)
  icon_field_name = icon_field_name or "icon"
  icons_field_name = icons_field_name or "icons"
  if t.icons then
    for i, icon in pairs(t.icons) do
      icon.tint = tint
    end
  elseif t.icon then
    t.icons = {
      {
        icon = t.icon,
        tint = tint
      }
    }
  end
end

return todo
