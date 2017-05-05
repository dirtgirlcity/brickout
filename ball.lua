local Vector = require('vector')

local ballClass = { }
ballClass.__index = ballClass

function Ball(x, y)
	local instance = {
        location = Vector(x, y),
		velocity = Vector(0, 0),
		radius = 5,
		speed = 5
	}
	setmetatable(instance, ballClass)
	return instance
end

function ballClass:touchingEdge()
	local width, height = love.graphics.getDimensions()
    local edge = ''

    if self.location.x <= 0 then
        edge = 'left'
    end
    if (self.location.x + self.radius) >= width then
        edge = 'right'
    end
    if self.location.y <= 0 then
        edge = 'top'
    end
    if (self.location.y + self.radius) >= height then
        edge = 'bottom'
    end

    return edge
end

function ballClass:reflect(edge)
	if edge == 'bottom' then
		gameOver = true
	end
	if edge == 'top' then
		self.velocity:reverseY()
	end
	if (edge == 'right') or (edge == 'left') then
		self.velocity:reverseX()
	end
end

function ballClass:draw()
	if not self.under then
		love.graphics.setColor(183, 3, 3)
	    love.graphics.circle('fill', self.location.x, self.location.y, self.radius)
	end
end

function ballClass:update(dt)
	local width, height = love.graphics.getDimensions()

	edge = self.touchingEdge(self)
    print(edge)
    if not edge == '' then
    	self:reflect(edge)
    end

    --constant for now
	self.velocity = self.velocity:add(Vector(.00, -.01))
    self.location = self.location:add(self.velocity)
end

return Ball