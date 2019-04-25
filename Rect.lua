local Rect = {}

Rect.x = 0
Rect.y = 0
Rect.width = 0
Rect.height = 0

function Rect.draw()
    love.graphics.rectangle('fill', Rect.x, Rect.y, Rect.width, Rect.height)
end

function Rect.set(x, y, width, height)
    Rect.x = x and x or Rect.x
    Rect.y = y and y or Rect.y
    Rect.width = width and width or Rect.width
    Rect.height = height and height or Rect.height
end

return function(x, y, width, height)
    Rect.set(x, y, width, height)

    return Rect
end