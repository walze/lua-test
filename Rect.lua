local Rect = {}

function Rect:new(x, y, width, height)
    rect = {}

    rect.x =  x or nil
    rect.y =  y or nil
    rect.width = width or nil
    rect.height = height or nil

    function rect:draw()
        love.graphics.rectangle(
            'fill', 
            self.x, 
            self.y, 
            self.width, 
            self.height
        )
    end

    function rect:set(x, y, width, height)
        self.x =  x or self.x
        self.y =  y or self.y
        self.width = width or self.width
        self.height = height or self.height
    end

    return rect
end

return Rect