local keysPressed = {}
local mousePressed = {}
local scrollAmountX = 0
local scrollAmountY = 0
local controllerButtonsPressed = {}
local joystickaxis = {}


function love.load()
	-- Set the window title
	love.window.setTitle("Keyjammer and controller raw output - by PepSakdoek")
end

function love.keypressed(key)
    keysPressed[key] = true
end

function love.keyreleased(key)
    keysPressed[key] = nil
end

function love.mousepressed(x, y, button)
    mousePressed[button] = true
end

function love.mousereleased(x, y, button)
    mousePressed[button] = nil
end

function love.wheelmoved(x, y)
    scrollAmountX = scrollAmountX + x
    scrollAmountY = scrollAmountY + y
end

function love.gamepadaxis(joystick, axis, value)
    joystickaxis[axis] = value
end

function love.gamepadpressed(joystick, button)
    controllerButtonsPressed[button] = true
end

function love.gamepadreleased(joystick, button)
    controllerButtonsPressed[button] = nil
end

function love.draw()
    love.graphics.print("Keys pressed:", 10, 10)
    local y = 30
    for _, pair in ipairs(getKeyValuePairs(keysPressed)) do
        local k = pair[1]
        local v = pair[2]
        if (k == " ") then 
            st = "Space" 
        else 
            st = k 
        end
        love.graphics.print(st, 20, y)
        y = y + 15
    end
    
    love.graphics.print("Mouse buttons pressed:", 200, 10)
    y = 30
    for _, pair in ipairs(getKeyValuePairs(mousePressed)) do
        local k = pair[1]
        local v = pair[2]
        love.graphics.print("Button " .. k, 200, y)
        y = y + 15
    end

    love.graphics.print("Controller buttons pressed:", 400, 10)
    y = 30
    for _, pair in ipairs(getKeyValuePairs(controllerButtonsPressed)) do
        local k = pair[1]
        local v = pair[2]
        love.graphics.print("Button " .. k, 400, y)
        y = y + 15
    end

    love.graphics.print("Controller joysitcks positions:", 400, 200)
    y = 220
    for _,pair in ipairs(getKeyValuePairs(joystickaxis)) do
        local k = pair[1]
        local v = pair[2]
        love.graphics.print("Button " .. k .. " : " .. v, 400, y)
        y = y + 15
    end

    love.graphics.print("Horizontal scroll amount: " .. scrollAmountX, 10, 200)
    love.graphics.print("Vertical scroll amount: " .. scrollAmountY, 10, 220)
end

function getKeyValuePairs(dict)
	local result = {}
	local keys = {}
	
	-- Extract keys
	for k in pairs(dict) do
		table.insert(keys, k)
	end
	
	-- Sort keys alphabetically
	table.sort(keys)
	
	-- Create the 2D array with sorted keys
	for _, k in ipairs(keys) do
		table.insert(result, {k, dict[k]})
	end
	
	return result
end