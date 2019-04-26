Utils = require("utils")

local Rect = {}

function Rect:new(x, y, w, h, col, row, grid)
    rect = {}

    rect.grid = grid
    rect.x = x or nil
    rect.y = y or nil
    rect.w = w or nil
    rect.h = h or nil
    rect.col = col or nil
    rect.row = row or nil
    rect.active = false

    rect._siblings = nil
    rect.siblings = function()
        if rect._siblings then return rect._siblings end

        rect._siblings = {
            top_left = rect:sibling(-1, -1),
            top = rect:sibling(0, -1),
            top_right = rect:sibling(1, -1),
            left = rect:sibling(-1, 0),
            right = rect:sibling(1, 0),
            bottom_left = rect:sibling(-1, 1),
            bottom = rect:sibling(0, 1),
            bottom_right = rect:sibling(1, 1)
        }

        return rect._siblings
    end

    function rect:aliveN()
        sib = rect:siblings()
        c = 0

        for _, neighbour in pairs(sib) do
            if neighbour.active then
                c = c + 1
            end
        end

        return c
    end

    function rect:draw()
        if not self.active then
            return
        end

        love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    end

    function rect:sibling(diffX, diffY)
        x = diffX or 0
        y = diffY or 0

        col = (((self.col - 1) + y + grid.resolution) % grid.resolution) + 1
        row = (((self.row - 1) + x + grid.resolution) % grid.resolution) + 1

        return self.grid[col][row]
    end

    function rect:set(x, y, w, h)
        self.x = x or self.x
        self.y = y or self.y
        self.w = w or self.w
        self.h = h or self.h
    end

    return rect
end

return Rect
