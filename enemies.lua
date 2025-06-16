enemies = {}

function enemies.load()
    
    enemies.spawn("Jeff",200,200,10,2,"Fighter")
end

function enemies.update(dt)

end

function enemies.draw()
    for i, enemy in ipairs(enemies) do
        love.graphics.rectangle("fill",enemy.x,enemy.y,64,64)
    end
end

function enemies.spawn(name,x,y,health,damage,ai)
    enemy = {}
    enemy.name = tostring(name)
    enemy.x = x
    enemy.y = y
    enemy.health = health
    enemy.damage = damage
    enemy.ai = tostring(ai)
    --enemy.anim = enemiesanimations.animations.jeff.walk

    table.insert(enemies,enemy)
end


return enemies