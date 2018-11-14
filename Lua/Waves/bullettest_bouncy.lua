spawntimer = 0
bullets = {}

-- This happens every frame while you're defending. --
function Update()
    spawntimer = spawntimer + 1 --Add 1 to the counter every frame

    -- This part takes care of bullet spawning. --
    if spawntimer%30 == 0 then  --This happens every 30 frames.
        local posx = 30 - math.random(60) --Set a random X position between -30 and 30
        local posy = 65 --and set the Y position to 65, on the top edge of the arena.
        local bullet = CreateProjectile('chat', posx, posy) -- Create projectile with sprite chat.png
        bullet.SetVar('velx', 1 - 2*math.random()) -- We'll use this for horizontal speed. Random between -1/1
        bullet.SetVar('vely', 0) -- We'll use this for fall speed. We're starting without downward movement.
        table.insert(bullets, bullet) -- Add this new Bullet object to the bullets table up there.
    end

    -- This part updates every bullet in the bullets table. --
    for i=1,#bullets do -- #bullets in Lua means 'length of bullets table'.
        local bullet = bullets[i] -- For convenience, so we don't have to use bullets[i]
        local velx = bullet.GetVar('velx') -- Get the X/Y velocity we just set
        local vely = bullet.GetVar('vely')
        local newposx = bullet.x + velx -- New position will be old position + velocity
        local newposy = bullet.y + vely
        if(bullet.x > -Arena.width/2 and bullet.x < Arena.width/2) then -- Are we inside the arena (horizontally)?
            if(bullet.y < -Arena.height/2 + 8) then -- And did we go past the bottom edge?
                bullet.MoveTo(bullet.x, -Arena.height/2 + 8) -- Don't move it past the edge!
                -- Note the +8; I know the bullet sprite I'm using is 16x16.
                -- Without adding 8 it'll be inside the edge.
                vely = 4 --reverse bounce direction
            end
        end
        vely = vely - 0.04 -- Apply gravity
        bullet.MoveTo(newposx, newposy) -- and finally, move our bullet
        bullet.SetVar('vely', vely) -- and store our new fall speed into the bullet again.
    end
end
