Rect = require("Rect")

function love.resize(nw, nh)
    love.load()
end

function love.load()
    grid = {}
    grid.spacing = 1
    grid.resolution = 4
    grid.w = love.graphics.getWidth()
    grid.h = love.graphics.getHeight()
    grid.rowSize = grid.w / grid.resolution
    grid.colSize = grid.h / grid.resolution

    for col = 1, grid.resolution do
        grid[col] = {}
        for row = 1, grid.resolution do
            rx = (row - 1) * grid.rowSize + (grid.spacing / 2)
            ry = (col - 1) * grid.colSize + (grid.spacing / 2)
            rw = grid.w / grid.resolution - grid.spacing
            rh = grid.h / grid.resolution - grid.spacing

            rect = Rect:new(
                rx,
                ry,
                rw,
                rh,
                col,
                row,
                grid
            )

            grid[col][row] = rect
        end
    end

    
end


function love.update(dt)
    delta = 1 + dt

    for y, row in ipairs(grid) do
        for x, rect in ipairs(row) do
            
         

        end
    end
end


function love.draw()

    for y, row in ipairs(grid) do
        for x, rect in ipairs(row) do
            rect:draw()
        end
    end

end

function getClick(x, max)
    for i = 1, grid.resolution do
        match = x >= max * (i - 1) and x < max * i

        if match then return i end
    end
end

function love.mousepressed( x, y, button )
    row = getClick(x, grid.rowSize)
    col = getClick(y, grid.colSize)

    rect = grid[col][row]

    if button == 1 then 
        rect.active = not rect.active
    else
        rect.siblings().top.active = not rect.siblings().top.active
    end
end