local playerClass = { }
playerClass.__index = playerClass

function Player(h, w)
-- function Player(image, h, w)
  local width, height = love.graphics.getDimensions()
  local instance = {
    -- img = love.graphics.newImage('/images/brick.png', self.x, self.y
    h = h,
    w = w,
    x = width/2,
    y = height - h
  }
  setmetatable(instance, playerClass)
  return instance
end

function playerClass:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
  -- love.graphics.draw(self.image, self.x, self.y)
end

function playerClass:update(dt)
    local dx = 0    
    local gameWidth = love.graphics.getDimensions()

    if love.keyboard.isDown('left') then
        dx = -10
    end
    if love.keyboard.isDown('right') then
        dx = 10
    end

    if self.x < 0 then
      dx = 2
    end
    if self.x + self.w > gameWidth then
      dx = -2
    end

    self.x = self.x + dx
end

return Player