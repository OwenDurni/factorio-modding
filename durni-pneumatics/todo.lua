local todo = {}

todo.tint = {r = 1, g = 0.3, b = 0, a = 1}
todo.copperTint = {r = 0.922, g = 0.751, b = 0.5, a = 1}

function todo.tintPictures(pictures, tint)
  for _, picture in pairs(pictures) do
    picture.tint = tint
    if picture.hr_version then
      picture.hr_version.tint = tint
    end
  end
end

return todo
