playeranimations = {}

function playeranimations.load()
    playeranimations.characterSS = love.graphics.newImage("sprites/CharacterSpriteSheet.png")
    playeranimations.grid = anim8.newGrid(24,24,playeranimations.characterSS:getWidth(),playeranimations.characterSS:getHeight())

    playeranimations.animations = {}
    playeranimations.animations.lanca = {}
    playeranimations.animations.lanca.walk = anim8.newAnimation(playeranimations.grid('1-4',1),0.125)
    
    playeranimations.animations.koechi = {}
    playeranimations.animations.koechi.walk = anim8.newAnimation(playeranimations.grid('1-4',2),0.125)

    playeranimations.anim = playeranimations.animations.lanca.walk
end

function playeranimations.update(dt)
    local isMoving = false

    if love.keyboard.isDown("w") then
        isMoving = true
        if player.skin == "Lanca" then
            playeranimations.anim = playeranimations.animations.lanca.walk
        elseif player.skin == "Koechi" then
            playeranimations.anim = playeranimations.animations.koechi.walk
        end

    end

    if love.keyboard.isDown("a") then
        isMoving = true
        if player.skin == "Lanca" then
            playeranimations.anim = playeranimations.animations.lanca.walk
        elseif player.skin == "Koechi" then
            playeranimations.anim = playeranimations.animations.koechi.walk   
        end
    end

    if love.keyboard.isDown("s") then
        isMoving = true
        if player.skin == "Lanca" then
            playeranimations.anim = playeranimations.animations.lanca.walk
        elseif player.skin == "Koechi" then
            playeranimations.anim = playeranimations.animations.koechi.walk
        end
    end

    if love.keyboard.isDown("d") then
        isMoving = true
        if player.skin == "Lanca" then
            playeranimations.anim = playeranimations.animations.lanca.walk
        elseif player.skin == "Koechi" then
            playeranimations.anim = playeranimations.animations.koechi.walk
        end
    end

    if player.skin == "Lanca" then
        player.weapon.skin = love.graphics.newImage("sprites/spearProjectile.png")
    elseif player.skin == "Koechi" then
        player.weapon.skin = love.graphics.newImage("sprites/KoechiStaff.png")
    end

    player.weapon.x = player.x
    player.weapon.y = player.y
    player.weapon.rotation = math.atan2(mouseY-player.y,mouseX-player.x)

    if isMoving == false then
        playeranimations.anim:gotoFrame(2)
    end
    playeranimations.anim:update(dt)
end

function playeranimations.draw()
    --love.graphics.draw(playeranimations.lanca.idle,player.x,player.y,nil,player.rotation,2,player.width/2,player.height/2)
    playeranimations.anim:draw(playeranimations.characterSS,player.x,player.y,nil,player.rotation,2,player.width/2,player.height/2)
    love.graphics.draw(player.weapon.skin,player.weapon.x,player.weapon.y+10,player.weapon.rotation,1.25,1.25,player.weapon.skin:getWidth()/2,player.weapon.skin:getHeight()/2)


end



return playeranimations
