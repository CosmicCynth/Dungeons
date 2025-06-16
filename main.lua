projectiles = require("projectiles")
playeranimations = require("playeranimations")
anim8 = require("libaries.anim8")
enemies = require("enemies")
--enemiesanimations = require("enemiesanimations")
player = require("player")



function love.load()
    --FPS
    FPS = tostring(love.timer.getFPS())
    --Image rendering
    love.graphics.setDefaultFilter("nearest","nearest")

    --Mouse cords
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()

    --Modules
    player.load()
    projectiles.load()
    playeranimations.load()
    --enemiesanimations.load()
    enemies.load()
end

function love.update(dt)
    player.update(dt)
    projectiles.update(dt)
    playeranimations.update(dt)
    enemies.update(dt)
    --enemiesanimations.update(dt)

    --Misc
    FPS = tostring(love.timer.getFPS())
    mouseX = love.mouse.getX()
    mouseY = love.mouse.getY()
end

function love.draw()
    love.graphics.print(FPS)
    projectiles.draw()
    player.draw()
    playeranimations.draw()
    --enemiesanimations.draw()
    enemies.draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    player.mousepressed(x, y, button, istouch, presses)
end
