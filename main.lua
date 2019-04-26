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
    grid.rows = grid.w / grid.resolution
    grid.cols = grid.h / grid.resolution

    for col = 1, grid.resolution do
        grid[col] = {}
        for row = 1, grid.resolution do
            rx = (row - 1) * grid.rows + (grid.spacing / 2)
            ry = (col - 1) * grid.cols + (grid.spacing / 2)
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

            if math.random(10) <= 5 then
                rect.active = false
            end

            grid[col][row] = rect
        end
    end

    print(grid[2][1]:sibling(1, -3))
end


function love.update(dt)
    delta = 1 + dt

    for y, row in ipairs(grid) do
        for x, rect in ipairs(row) do
            
            if math.random(10) <= 5 then
                rect.active = false
            else
                rect.active = true
            end

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
