projectiles = {}
spr_youki_closed = "youki_closed"
spr_youki_open = "youki_open"
spr_projectile = "projectile"
timer = 0
Arena.Resize(300, 300)

youki_closed = CreateProjectile(spr_youki_closed, 60, 60)
youki_closed.MoveTo(-129,90)

function Update()
  timer = timer + 1

  if timer%20 == 0 then
    youki_closed.Remove()
    local youki_open = CreateProjectile(spr_youki_open, 60, 60)
    youki_open.MoveTo(-130,5)
  end

  if timer%30 == 0 then
    projectile = CreateProjectile(spr_projectile, -129, 5)
    projectile.SetVar('xspeed', 0)
    projectile.SetVar('yspeed', 0)
    table.insert(projectiles, projectile)
  end

for i=1,#projectiles do
    local xdifference = Player.x - projectile.x
    local ydifference = Player.y - projectile.y
    local xspeed = projectile.GetVar('xspeed') / 2 + xdifference / 100
    local yspeed = projectile.GetVar('yspeed') / 2 + ydifference / 100
    projectile.SetVar('xspeed', xspeed)
    projectile.SetVar('yspeed', yspeed)
    projectile.Move(xspeed, yspeed)
end


end
