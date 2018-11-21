-- A basic encounter script skeleton you can copy and modify for your own creations.

music = "battle" --Always OGG. Extension is added automatically. Remove the first two lines for custom music.
encountertext = "Miru is really angry" --Modify as necessary. It will only be read out in the action select screen.
nextwaves = {"blank"}
current_attacks = {"blank"} -- A custom list with attacks to choose from. Actual selection happens in EnemyDialogueEnding(). Put here in case you want to use it.
pink_heart = false; -- Boolean i use in order to set the gravity or not
wavetimer = 4.0
arenasize = {155, 130}
SetGlobal("intro", true)
SetGlobal("attackNum",0)

enemies = {
"Miru"
}

enemypositions = {
{0, 0}
}




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



  pink_heart = true;
  current_attacks = {"lapin_run"}

  --[[local turn = GetGlobal("attackNum")
  if ( turn == 1 ) then

    -- You can set the dialog bubble Here
    enemies[1].SetVar('dialogbubble', 'rightwide')
    -- Dialog for the turn 1
    enemies[1].SetVar('currentdialogue', 'Je vais te trancher\ntu va voir !!!')
    -- And you set the current attack for the turn
    current_attacks = {"raining_knives"}

  elseif ( turn == 2 ) then
    enemies[1].SetVar('dialogbubble', 'rightwide')
    enemies[1].SetVar('currentdialogue', 'Youki, attaque !!!')
    current_attacks = {"youki_firing"}

  elseif ( turn == 3 ) then
    enemies[1].SetVar('dialogbubble', 'rightwide')
    enemies[1].SetVar('currentdialogue', 'Tu fera moins\nle malin quand tu\nsera mort !!!\nXD nya')
    current_attacks = {"bullettest_touhou"}
  end]]


end

function EnemyDialogueEnding()
    --Audio.Play();
    -- Good location to fill the 'nextwaves' table with the attacks you want to have simultaneously.
    -- This example line below takes a random attack from 'possible_attacks'.
    if (pink_heart == true) then
      nextwaves = { current_attacks[math.random(#current_attacks)], "gravity" }
    else
      nextwaves = { current_attacks[math.random(#current_attacks)] }
    end


end

function DefenseEnding() --This built-in function fires after the defense round ends.
      if (GetGlobal("attackNum") ~= 0) then
          encountertext = RandomEncounterText() --This built-in function gets a random encounter text from a random enemy.
      end
    SetGlobal("attackNum",GetGlobal("attackNum") + 1) -- Each DefenseEnding, the turn gain +1
end

function HandleSpare()
     State("ENEMYDIALOGUE")
end

function HandleItem(ItemID)
    BattleDialog({"Selected item " .. ItemID .. "."})
end
