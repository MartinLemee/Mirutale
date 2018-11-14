spawntimer = 0
bullets = {}

function Update()
  spawntimer = spawntimer + 1

  if spawntimer%20 == 0 then  --This happens every 30 frames.
      local posx = math.random(85)  - math.random(105) --Set a random X position between -30 and 30
      local posy = 60 --and set the Y position to 65, on the top edge of the arena.
      local bullet = CreateProjectile('knife', posx, posy) -- Create projectile with sprite chat.png
      bullet.SetVar('velx', 1 - 1*math.random()) -- We'll use this for horizontal speed. Random between -1/1
      bullet.SetVar('vely', -2) -- We'll use this for fall speed. We're starting without downward movement.
      table.insert(bullets, bullet) -- Add this new Bullet object to the bullets table up there.
  end

  for i=1,#bullets do -- #bullets in Lua means 'length of bullets table'.
      local bullet = bullets[i] -- For convenience, so we don't have to use bullets[i]
      local velx = bullet.GetVar('velx') -- Get the X/Y velocity we just set
      local vely = bullet.GetVar('vely')
      local newposx = bullet.x + velx-- New position will be old position + velocity
      local newposy = bullet.y + vely
      if(bullet.x > -Arena.width/2 and bullet.x < Arena.width/2) then -- Are we inside the arena (horizontally)?
          if(bullet.y < -Arena.height/2 + 8) then -- And did we go past the bottom edge?
              bullet.MoveTo(bullet.x, -Arena.height/2 + 8 ) -- Don't move it past the edge!
              -- Note the +8; I know the bullet sprite I'm using is 16x16.
              -- Without adding 8 it'll be inside the edge.
              -- vely = 4 --reverse bounce direction
          end
      end
      vely = vely - 0.04 -- Apply gravity
      bullet.MoveTo(newposx, newposy) -- and finally, move our bullet
      bullet.SetVar('vely', vely) -- and store our new fall speed into the bullet again.
  end
end
