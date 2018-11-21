projectiles = {}
spr_lapin_small = "lapin_small"
timer = 0
xcoord = 250
ycoord = -49

Arena.Resize(600, 100)

lapin = CreateProjectile(spr_lapin_small, xcoord, ycoord)

function Update()
  timer = timer + 1

  if timer%1 == 0 then
    xcoord = xcoord - 3
    lapin.MoveTo(xcoord, -35)
  end

end
