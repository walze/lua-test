Rect = require("Rect")

function love.load()
    w = love.graphics.getWidth()
    h = love.graphics.getHeight()
    resolution = 100
    spacing = 5

    grid = {}
    
    for y = 1, resolution do
        grid[y] = {}
        for x = 1, resolution do
            rx = (x - 1) * (w / resolution) + (spacing / 2)
            ry = (y - 1) * (h / resolution) + (spacing / 2)
            rw = w / resolution - spacing
            rh = h / resolution - spacing

            grid[y][x] = Rect:new(
                rx,
                ry,
                rw,
                rh 
            )
            
            rect = grid[y][x] 
            print(rect.x, rect.y)
        end
        print("\n")
    end

end

function love.update(dt)
    for y, row in pairs(grid) do
        for x, rect in pairs(row) do
            randX = math.random(2, -2)

            rect:set(rect.x + randX)
        end
    end
end

function love.draw()


    for y, row in pairs(grid) do
        for x, rect in pairs(row) do
            rect:draw()
        end
    end

end