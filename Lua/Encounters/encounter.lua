-- A basic encounter script skeleton you can copy and modify for your own creations.

music = "battle" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Miru is really angry" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"bullettest_chaserorb"}
wavetimer = 4.0
arenasize = {155, 130}
SetGlobal("intro", true)

enemies = {
"Miru"
}

enemypositions = {
{0, 0}
}

-- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
possible_attacks = {"blue_test"}

function EncounterStarting()
    -- If you want to change the game state immediately, this is the place.
    require "Animations/miru_anim"
    State("ENEMYDIALOGUE")
end

function Update()
    --By calling the AnimateMiru() function on the animation Lua file, we can create some movement!
    AnimateMiru()
end

function EnemyDialogueStarting()

    -- Good location for setting monster dialogue depending on how the battle is going.
    --Exemple : enemies[1].SetVar('currentdialogue', {"Tu va\nrien\nfaire !!!!"})
    --local intro = GetGlobal("intro") --updates the variable "intro" everytime the EnemyDialogueStarting() function is triggered
  --  if intro == true then
    --  Audio.Stop();
  --    enemies[1].SetVar('currentdialogue', {"[noskip]Eh tete de fesse", "[noskip]J'ai tres bien vu\nton petit jeu,[w:20]\nsalput !!!", "[noskip]on days like these,[w:20]\nkids like you...", "[func:AudioStop][noskip][effect:none][novoice][waitall:5]should be coding\nin hell.[w:10][next]"})
    --  enemies[1].SetVar('dialogbubble', "rightwide")
    --  SetGlobal("intro", false) -- sets the variable "intro" to false so that this line of dialogue only plays once
  --  end
end

function EnemyDialogueEnding()
    --Audio.Play();
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    nextwaves = { possible_attacks[math.random(#possible_attacks)] }

end

function DefenseEnding() --This built-in function fires after the defense round ends.
    encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
end

function HandleSpare()
     State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"Selected item " .. ItemID .. "."})
end
