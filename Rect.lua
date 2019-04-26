Utils = require("utils")

local Rect = {}

function Rect:new(x, y, w, h, col, row, grid)
    rect = {}

    rect.grid = grid
    rect.x =  x or nil
    rect.y =  y or nil
    rect.w = w or nil
    rect.h = h or nil
    rect.col = col or nil
    rect.row = row or nil
    rect.active = true
    rect.siblings = {
        top_left = function() return rect:sibling(-1, -1) end,
        top = function() return rect:sibling(0, -1) end,
        top_right = function() return rect:sibling(1, -1) end,

        left = function() return rect:sibling(-1, 0) end,
        right = function() return rect:sibling(1, 0) end,

        bottom_left = function() return rect:sibling(-1, 1) end,
        bottom = function() return rect:sibling(0, 1) end,
        bottom_right = function() return rect:sibling(1, 1) end,
    }

    function rect:draw()
        if not self.active then return end

        love.graphics.rectangle(
            'fill', 
            self.x, 
            self.y, 
            self.w, 
            self.h
        )
    end

    function rect:sibling(diffX, diffY)
        x = diffX or 0
        y = diffY or 0

        col = (((self.col - 1) + x + grid.resolution) % grid.resolution) + 1
        row = (((self.row - 1) + y + grid.resolution) % grid.resolution) + 1

        return self.grid[col][row]
    end

    function rect:set(x, y, w, h)
        self.x =  x or self.x
        self.y =  y or self.y
        self.w = w or self.w
        self.h = h or self.h
    end

    return rect
end

return Rect