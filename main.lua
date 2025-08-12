function rectUnpack(rectangle)
    ordre = {"mode", "x", "y", "width", "height"}
    args = {}
    for _, key in ipairs(ordre) do
        table.insert(args, rectangle[key])
    end
    return unpack(args)
end

player = {
    x = 1,
    y = 1
}

local grid = {
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0}
}
local redColor = {1, 0, 0}
local greenColor = {0, 1, 0}

local tileSize = 64

local initPos = 32

function placerJoueur(x, y)
    for i=1,#grid do
        for iB, keyB in ipairs(grid[i]) do
            if iB==x and i==y then
                grid[i][iB] = 1
            else
                grid[i][iB] = 0
            end
        end
    end
end


function drawTile()
    for i=1,#grid do
        for iB, keyB in ipairs(grid[i]) do
            if keyB == 0 then
                love.graphics.setColor(redColor)
                love.graphics.rectangle("line", initPos+tileSize*iB, initPos+tileSize*i, tileSize, tileSize)
            else
                love.graphics.setColor(greenColor)
                love.graphics.rectangle("fill", initPos+tileSize*iB, initPos+tileSize*i, tileSize, tileSize)
            end
        end
    end
end

function love.load()
    love.window.setTitle("Move on grid")
    love.window.setMode(1280, 720, {resizable = true})
end


function love.keypressed(key, scancode, isrepeat)
    if key == "right" then
        if player.x < #grid then
            player.x = player.x + 1
        end
    elseif key == "left" then
        if player.x > 1 then
            player.x = player.x - 1
        end
    elseif key == "down" then
        if player.y < #grid then
            player.y = player.y + 1
        end
    elseif key == "up" then
        if player.y > 1 then
            player.y = player.y - 1
        end
    end
    if key == "escape" then
        love.event.quit()
    end
end

function love.update()
    placerJoueur(player.x, player.y)
end

function love.draw()
    drawTile()
end