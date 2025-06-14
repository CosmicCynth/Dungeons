player = {}

function player.load()
    player.x = 0
    player.y = 0
    player.speed = 0.5
    player.skin = "Lanca"
    player.width = 24
    player.height = 24
    player.rotation = 2 --love.graphics.draw() change the scale factor to flip image
    
end

function player.update(dt)
    --Movement
    directions = {x = 0, y = 0}

    if love.keyboard.isDown("d") then
        directions.x = directions.x + 1
        player.rotation = 2
    elseif love.keyboard.isDown("a") then
        directions.x = directions.x - 1
        player.rotation = -2
    end

    if love.keyboard.isDown("s") then
        directions.y = directions.y + 1
    elseif love.keyboard.isDown("w") then
        directions.y = directions.y - 1
    end

    local length = math.sqrt(directions.x^2 + directions.y^2)
    if length > 0 then
        directions.x = directions.x / length
        directions.y = directions.y / length
    end

    player.x = player.x + player.speed * directions.x
    player.y = player.y + player.speed * directions.y
    --

end


function player.draw()
    if player.skin == "Lanca" then
        love.graphics.draw(playeranimations.lanca.idle,player.x,player.y,nil,player.rotation,2,player.width/2,player.height/2)
    end
end

function player.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        print("pressed "..x.." "..y)
        if player.skin == "Lanca" then
            player.shoot(x,y,"spear",0.5)
        end
    end
end

function player.shoot(mx,my,id,projectileSpeed)
    local dx = mx - player.x
    local dy = my - player.y
    local magnitude = math.sqrt(dx^2+dy^2)
    projectile = {}
    projectile.x = player.x
    projectile.y = player.y
    projectile.id = id
    projectile.dx = dx / magnitude  
    projectile.dy = dy / magnitude
    projectile.speed = projectileSpeed
    projectile.direction = math.atan2(dy,dx)

    --Testing
    print(projectile.direction*(180/math.pi))

    table.insert(projectiles.friendly,projectile)
end

return player
