--BLUE SOUL MODE (GRAVITY) DONE BY TURRETBOT! PLEASE DON'T SAY YOU MADE IT OR I'LL SPARE YOU MENACINGLY
Soulmask = CreateProjectile('pink-heart', Player.x, Player.y)
speedy = 0

function Update()
    Player.MoveTo(Player.x, Player.y + speedy, false)
    speedy = speedy - 0.45
    if Input.Up == 1 and Player.y == -Arena.height/2+8 then --This is no longer really inneficient.
        speedy = 5
    end
    --Hide real soul
    Soulmask.MoveTo(Player.x, Player.y)
end

function OnHit(bullet)
end
