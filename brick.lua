local brickClass = { }
brickClass.__index = brickClass

function Brick(x, y)
	local instance = {
		broken = false,
		h = 10,
		w = 20,
		x = x,
		y = y
		-- make sure width and height match the image w/h
	}
	setmetatable(instance, brickClass)
	return instance
end

function brickClass:draw()
	if not self.broken then
		love.graphics.rectangle( 'fill', self.x, self.y, self.w, self.h )
		-- love.graphics.draw(love.graphics.newImage('/images/brick.png', self.x, self.y)
	end
end

function brickClass:update(dt)
end

return Brick