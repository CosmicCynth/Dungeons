projectiles = require("projectiles")
playeranimations = require("playeranimations")
anim8 = require("libaries.anim8")
player = require("player")


function love.load()
    --FPS
    FPS = tostring(love.timer.getFPS())
    --Image rendering
    love.graphics.setDefaultFilter("nearest","nearest")

    --Modules
    player.load()
    projectiles.load()
    playeranimations.load()
end

function love.update(dt)
    player.update(dt)
    projectiles.update(dt)

    FPS = tostring(love.timer.getFPS())
end

function love.draw()
    love.graphics.print(FPS)
    projectiles.draw()
    player.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    player.mousepressed(x, y, button, istouch, presses)
end
