enemies = {}

function enemies.load()
    --enemies.spawn("name",xPos,yPos,Width,Height,health,damage,ai,speed)
    enemies.spawn("Jeff",200,200,24,24,10,2,"Fighter",100)

    --Enemy AI updater
end

function enemies.update(dt)


    for i, enemy in ipairs(enemies) do
        if enemy.ai == "Fighter" then
            FighterAI(enemy,player,enemy.speed,dt)
        end
    end

end

function enemies.draw()
    for i, enemy in ipairs(enemies) do
        love.graphics.rectangle("fill",enemy.x,enemy.y,enemy.width,enemy.height)
    end
end

function enemies.spawn(name,x,y,width,height,health,damage,ai,speed)
    enemy = {}
    enemy.name = tostring(name)
    enemy.x = x
    enemy.y = y
    enemy.width = width
    enemy.height = height
    enemy.health = health
    enemy.damage = damage
    enemy.ai = tostring(ai)
    enemy.speed = speed
    enemy.AIupdater = 0
    --enemy.anim = enemiesanimations.animations.jeff.walk

    table.insert(enemies,enemy)
end

function FighterAI(enemy,target,speed,dt)

    enemy.AIupdater = enemy.AIupdater + 60 * dt

    if enemy.AIupdater >= 0.1 then
        local dx = target.x - enemy.x
        local dy = target.y - enemy.y
        local distance = math.sqrt(dx^2+dy^2)


        if distance > 0 then
            enemy.x = enemy.x + (dx / distance) * speed * dt
            enemy.y = enemy.y + (dy / distance) * speed * dt
        end

        enemy.AIupdater = 0
    end
end


return enemies
