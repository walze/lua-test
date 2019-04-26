Rect = require("Rect")

function love.resize(nw, nh)
    love.load()
end

function love.load()
    grid = {}
    grid.spacing = 1
    grid.resolution = 300
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
    love.graphics.print(dt)
    
    delta = 1 + dt

    for col = 1, grid.resolution do
        for row = 1, grid.resolution do
            rect = grid[col][row]
            aliveCell = rect.active
            aliveNeighbours = rect.aliveN()

            if aliveCell and aliveNeighbours < 2 then
                rect.active = false
            elseif aliveCell and (aliveNeighbours == 2 or aliveNeighbours == 3) then
                rect.active = true
            elseif aliveCell and aliveNeighbours > 3 then
                rect.active = false
            elseif (not aliveCell) and aliveNeighbours == 3 then
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

function getClick(x, max)
    for i = 1, grid.resolution do
        match = x >= max * (i - 1) and x < max * i

        if match then return i end
    end
end

function love.mousereleased()
    pressed = false
end

function love.mousepressed(_, _, b)
    button = b
    pressed = true
end

function love.mousemoved( x, y )
    if not pressed then return end

    row = getClick(x, grid.rowSize)
    col = getClick(y, grid.colSize)

    rect = grid[col][row]

    if button == 1 then
        rect.active = true
        for _, neighbour in pairs(rect.siblings()) do
            neighbour.active = true
        end
    else
        rect.active = false
    end
end