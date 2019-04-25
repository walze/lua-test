Rect = require("Rect")

function love.load()
    w = love.graphics.getWidth()
    h = love.graphics.getHeight()
    resolution = 2
    spacing = 2

    grid = {}
    
    for y = 0, resolution do
        grid[y] = {}
        for x = 0, resolution do
            rx = x * (w / resolution) + (spacing / 2)
            ry = y * (h / resolution) + (spacing / 2)
            rw = w / resolution - spacing
            rh = h / resolution - spacing

            print(rx, ry, rw, rh)

            grid[y][x] = Rect(
                rx,
                ry,
                rw,
                rh 
            )
        end
    end

end

function love.update(dt)
end

function love.draw()

    r1 = Rect(100,200,100,100)
    r1.draw()

    for _, row in pairs(grid) do
        for _, rect in pairs(row) do
            print(rect)
        end
    end

end