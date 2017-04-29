local Player = require('player')
local Brick = require('brick')

local width, height = love.graphics.getDimensions()
local entities = { }

local player = Player(10, 100)
table.insert(entities, player)

function makeBricks(num)
	xBase = 10
	yBase = 10
	for brick=1,num do
		local brick = Brick(xBase, yBase)
		if (xBase + 40) > width then
			yBase = yBase + 30
			xBase = 10
		else
			xBase = xBase + 30
		end	
		table.insert(entities, brick)
	end
end

function love.load()
	-- music = love.audio.newSource('/audio/brickmusic.mp3')
	-- music:setLooping(true)
	-- music:play()
	local nBricks = 300
	makeBricks(nBricks)
end

function love.draw()
	for idx, entity in ipairs(entities) do
		entity:draw()
	end
end

function love.update(dt)
	for idx, entity in ipairs(entities) do
		entity:update(dt)
	end
end