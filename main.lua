--Collision detection Idea I had while going to sleep

local forest = require("forest")

local push = require("Libraries/push")

function love.load()

    forest = forest:new()

end


function love.update(dt)


    forest:update(dt)

    


end



function love.draw()

    love.graphics.circle("fill", 20, 20, 20)
    forest:setActive(true)

    forest:draw()

    love.graphics.print(tostring(forest:getActive()), 100, 100)

end

--In löve 0.11 the values for rgba go now from 0 to 1 instead of 0 to 255. But I dont want to rewrite all setColor function in this program so I replace the love.graphics.setColor function with a new one
--which handles the conversion for me
function setColor(r, g, b, a)
	local r_new = r/255 --Divide with 255 to get the same value in 0-1 format
	local g_new = g/255
	local b_new = b/255

	local a_new = 1 --If only rgb values are the input then go full alpha, if given do the calculations beneath
	if a ~= nil then
		a_new = a/255
	end

	love.graphics.setColor(r_new, g_new, b_new, a_new)

end