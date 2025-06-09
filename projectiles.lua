projectiles = {}

function projectiles.load()
    --Bullets
    projectiles.friendly = {}
    projectiles.hostile = {}

    --Sprites
    Spear = love.graphics.newImage("sprites/spearProjectile.png")
end

function projectiles.update(dt)
    for i, projectile in ipairs(projectiles.friendly) do
        projectile.x = projectile.x + projectile.speed * projectile.dx  
        projectile.y = projectile.y + projectile.speed * projectile.dy

        if projectile.x > love.graphics.getWidth() or projectile.x < 0 then
            print("ID: "..i.." has been deleted")
            table.remove(projectiles.friendly,i)
        end
    end
end

function projectiles.draw()
    for i, projectile in ipairs(projectiles.friendly) do
        if projectile.id == "spear" then
            love.graphics.draw(Spear,projectile.x,projectile.y,nil,1.5,1.5)
        end
    end
end

return projectiles