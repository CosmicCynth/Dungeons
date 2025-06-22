--Notes the function activates way to often
function love.load()
    player = {x = 30,y = 40,width = 64,height = 64}
    enemy = {x = 200,y=200,width = 64,height=64,AIupdater = 0, AI = "Shooter"}
    projectiles = {}
end

function love.update(dt)

    for i, projectile in ipairs(projectiles) do
        projectile.x = projectile.x + projectile.speed * projectile.dx
        projectile.y = projectile.y + projectile.speed * projectile.dy
    end

    if enemy.AI == "Shooter" then
        ShooterAI(enemy,player,10,10,dt)
    end
    
end

function love.draw()
    for i, projectile in ipairs(projectiles) do
        love.graphics.rectangle("fill",projectile.x,projectile.y,32,32)
    end

    love.graphics.rectangle("fill", player.x,player.y,player.width,player.height)
    love.graphics.rectangle("fill", enemy.x,enemy.y,enemy.width,enemy.height)
end

function ShooterAI(enemy, target,shootspeed,cd,dt)
    print("Bomba")
    enemy.AIupdater = enemy.AIupdater + 60 * dt

    if enemy.AIupdater >= cd then
        spawnShooterAI(enemy.x,enemy.y,target.x,target.y,shootspeed)
        enemy.AIupdater = 0
    end
end

function spawnShooterAI(x,y,targetX,targetY,speed)
    print("bomba2")
    proj = {}
    dx = targetX - x
    dy = targetY - y 
    magnitude = math.sqrt(dx^2+dy^2)
    proj.x = x
    proj.y = y
    proj.dx = dx / magnitude
    proj.dy = dy / magnitude
    proj.speed = speed
    proj.direction = math.atan2(dy,dx)
    table.insert(projectiles,proj)
end
