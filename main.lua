local keysPressed = {}
local mousePressed = {}
local scrollAmountX = 0
local scrollAmountY = 0
local controllerButtonsPressed = {}
local joystickaxis = {}


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

-- function love.joystickadded(joystick)
--   mainjoystick = joystick
-- end

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
    for k, _ in pairs(keysPressed) do
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
    for k, _ in pairs(mousePressed) do
        love.graphics.print("Button " .. k, 200, y)
        y = y + 15
    end

    love.graphics.print("Controller buttons pressed:", 400, 10)
    y = 30
    for k, _ in pairs(controllerButtonsPressed) do
        love.graphics.print("Button " .. k, 400, y)
        y = y + 15
    end

    love.graphics.print("Controller joysitcks positions:", 400, 200)
    y = 220
    for k, v in pairs(joystickaxis) do
        love.graphics.print("Button " .. k .. " : " .. v, 400, y)
        y = y + 15
    end

    love.graphics.print("Horizontal scroll amount: " .. scrollAmountX, 10, 200)
    love.graphics.print("Vertical scroll amount: " .. scrollAmountY, 10, 220)
end
