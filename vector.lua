local vectorClass = { }
vectorClass.__index = vectorClass

function Vector(x, y)
	local instance = {
		x = x,
		y = y
	}
	setmetatable(instance, vectorClass)
	return instance
end

function vectorClass:add(vector)
	self.x = self.x + vector.x
	self.y = self.y + vector.y
	return self
end

function vectorClass:reverseX()
	self.y = -(self.y)
end

function vectorClass:reverseY()
	self.x = -(self.x)
end

return Vector