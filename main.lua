require ("player")
require ("ball")
require("ai")

function love.load()
    Player:load()
    Ball:load()
    AI:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    drawDottedLines()
end

function drawDottedLines() 
    local windowHeight = love.graphics.getHeight()
    local windowWidth = love.graphics.getWidth()
    local dotHeight = 100
    local dotWidth = 20
    for i = 0 , windowHeight, dotHeight + (dotHeight / 2) do
        love.graphics.rectangle("line", (windowWidth  - dotWidth) / 2 , i, dotWidth, dotHeight)
    end
end