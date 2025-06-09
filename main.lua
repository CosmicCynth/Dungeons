projectiles = require("projectiles")
player = require("player")


function love.load()
    --Image rendering
    love.graphics.setDefaultFilter("nearest","nearest")

    --Modules
    player.load()
    projectiles.load()
end

function love.update(dt)
    player.update(dt)
    projectiles.update(dt)
end

function love.draw()
    projectiles.draw()
    player.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    player.mousepressed(x, y, button, istouch, presses)
end