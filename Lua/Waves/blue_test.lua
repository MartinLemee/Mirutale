--BLUE SOUL MODE (GRAVITY) DONE BY TURRETBOT! PLEASE DON'T SAY YOU MADE IT OR I'LL SPARE YOU MENACINGLY
--[[Soulmask = CreateProjectile('pink-heart', Player.x, Player.y) -- pink-heart = blue heart in sans battle
speedy = 0
Arena.Resize(500, 115)

function Update()
    Player.MoveTo(Player.x, Player.y + speedy, false)
    speedy = speedy - 0.2
    if Input.Up == 1 and Player.y == -Arena.height/2+8 then --This is no longer really inneficient.
        speedy = 3
    end
    --Hide real soul
    Soulmask.MoveTo(Player.x, Player.y)
end

function OnHit(bullet)
end]]

--Pre-0.2.0 version for comparison. Also by TurretBot.
Soulmask = CreateProjectile('empty', Player.x, Player.y)

--Make sure you can always jump
Arenaheight = Arena.height

--Create our fake player
Soulfake = CreateProjectile('pink-heart', Player.x, Player.y)
Playery = Player.y
airborne = true
speedy = 0

function Update()
    --Fake soul
    Soulfake.MoveTo(Player.x, Soulfake.y + speedy)
    if airborne then
        if Soulfake.y < -Arena.height/2+8 then
            Soulfake.MoveTo(Player.x, -Arena.height/2+8)
            Playery = Player.y
            airborne = false
            speedy = 0
        else
            speedy = speedy - 0.25
        end
    elseif Player.y > Playery then --This is really inneficient.
        airborne = true
        speedy = 5
    end
    if Player.y == Arena.height/2-8 then --This is even worse.
        if Arena.height == Arenaheight then
            Arena.Resize(Arena.width, Arenaheight + 2)
        else
            Arena.Resize(Arena.width, Arenaheight)
        end
    end
    --Hide real soul
    Soulmask.MoveTo(Player.x, Player.y)
end

function OnHit(bullet)
end
