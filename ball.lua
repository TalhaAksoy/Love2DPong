Ball = {}

function Ball:load()
    self.width = 20
    self.height = 20
    self.speed = 300
    self.x = (love.graphics.getWidth() - (self.width / 2)) / 2
    self.y = (love.graphics.getHeight() - (self.height / 2)) / 2
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collide()
end

function Ball:collide()
    if self:checkCollision(self, Player) then
        self.speed = self.speed + 10
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisiionPosition = middleBall - middlePlayer
        self.yVel = collisiionPosition * 5
    end

    if self:checkCollision(self, AI) then
        self.speed = self.speed + 10
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisiionPosition = middleBall - middleAI
        self.yVel = collisiionPosition * 5
    end


    if self.y < 0 then
        self.speed = self.speed + 10
        self.y = 0
        self.yVel = -self.yVel
    end
    if self.y + self.height > love.graphics.getHeight() then
        self.speed = self.speed + 10
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    if self.x < 0 then
        self.speed = 300
        self.x = (love.graphics.getWidth() - self.width) / 2
        self.y = (love.graphics.getHeight() - self.height) / 2
        self.yVel = 0
        self.xVel = self.speed
    end
    if self.x + self.width > love.graphics.getWidth() then
        self.speed = 300
        self.x = (love.graphics.getWidth() - self.width) / 2
        self.y = (love.graphics.getHeight() - self.height) / 2
        self.yVel = 0
        self.xVel = -self.speed
    end
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x , self.y , self.width, self.height)
end

function Ball:checkCollision(ball, object)
    if ball.x + ball.width > object.x and ball.x < object.x + object.width and ball.y + ball.height > object.y and ball.y < object.y + object.height then
        return true
    else
        return false
    end
end