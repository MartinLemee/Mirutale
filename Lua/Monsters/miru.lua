-- A basic monster script skeleton you can copy and modify for your own creations.
comments = {"Miru's savagery words fill you\nwith sadness", "Miru's savagery words fill you\nwith sadness", "Miru's savagery words fill you\nwith sadness"}
commands = {"Pat", "Pizza", "Act 3"}
randomdialogue = {"Tu va\nrien\nfaire !!!!"}

sprite = "empty" --Always PNG. Extension is added automatically.
name = "Miru"
hp = 999
atk = 0
def = 99
check = "Check message goes here."
dialogbubble = "right" -- See documentation for what bubbles you have available.
canspare = false
cancheck = true


-- Happens after the slash animation but before
function HandleAttack(attackstatus)
    if attackstatus == -1 then
        -- player pressed fight but didn't press Z afterwards
    else
        -- player did actually attack
    end
end

-- This handles the commands; all-caps versions of the commands list you have above.
function HandleCustomCommand(command)
    if command == "Pat" then
        currentdialogue = {"Selected\nAct 1."}
    elseif command == "Pizza" then
        currentdialogue = {"Selected\nAct 2."}
    elseif command == "Act 3" then
        currentdialogue = {"Selected\nAct 3."}
    end
    BattleDialog({"You selected " .. command .. "."})
end
