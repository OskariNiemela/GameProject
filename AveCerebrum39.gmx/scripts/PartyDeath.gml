sprite_index = DeathAnimation;
oBattleScreen.Players -= 1;
map[gridX,gridY].occupant = noone;
State = "Death";
oCursor.Party[PartyNumber] = noone;
oPlayerPortrait.Deactive = true;
ds_list_add(oBattleScreen.DeadPlayers,id);
AbilityCooldown1 = 0;
AbilityCooldown2 = 0;
