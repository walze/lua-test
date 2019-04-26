Rect = require("Rect")

function love.resize(nw, nh)
    love.load()
end

function love.load()
    print(
        Utils.hex2rgb("#ffffff")[0]
    )

    w = love.graphics.getWidth()
    h = love.graphics.getHeight()

    print(w,h)

    resolution = 100
    spacing = 1

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
        end
    end

end


function love.update(dt)
    delta = 1 + dt

    for y, row in pairs(grid) do
        for x, rect in pairs(row) do
            randX = math.random(3, -3)
            randY = math.random(2, -2)
            x = rect.x + randX * delta
            y = rect.y + randY * delta

            rect:set(x)
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