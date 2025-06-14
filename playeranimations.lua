playeranimations = {}

function playeranimations.load()
    playeranimations.characterSS = love.graphics.newImage("sprites/LancaSS.png")
    playeranimations.grid = anim8.newGrid(24,24,playeranimations.characterSS:getWidth(),playeranimations.characterSS:getHeight())
end



return playeranimations