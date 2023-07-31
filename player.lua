Player = {}

function Player:load()
    self.width = 20
    self.height = 100
    self.speed = 500
    self.x = 50
    self.y = (love.graphics.getHeight() - self.height) / 2
end

function Player:update(dt)
    self:move(dt)
    self:chechBounderies()
end

function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
end

function Player:chechBounderies()
    if self.y < 0 then
        self.y = 0
    end
    if self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Player:draw()
    love.graphics.rectangle("fill", self.x , self.y , self.width, self.height)
end