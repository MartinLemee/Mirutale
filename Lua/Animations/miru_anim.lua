--For usage, check out the encounter Lua's EncounterStarting() and Update() functions.

-- First, we can create the body and the head
mirubody = CreateSprite("miru_body")
miruhead = CreateSprite("miru_head")

--We parent the body to the head, so when you move the body, the head moves too.
miruhead.SetParent(mirubody)

--Now we adjust the height for the individual parts
mirubody.y = 240
miruhead.y = 40

--We set the body's pivot point to halfway horizontally, and on the bottom vertically,
--so we can rotate it around the bottom instead of the center.
mirubody.SetPivot(0.5, 0)

--We set the body's anchor point to the top center.
mirubody.SetAnchor(0.5, 1)
miruhead.SetAnchor(0.5, 0.89)


function AnimateMiru()
    --sanslegs.Scale(1, 1+0.1*math.sin(Time.time*2))
    miruhead.MoveTo(2*math.sin(Time.time), 40 + 2*math.cos(Time.time))
    miruhead.rotation = 5*math.sin(Time.time + 1)
    mirubody.rotation = 5*math.sin(Time.time + 2)
end
