///GoPartyScreen(StartX,StartY)

startingX = argument0;
startingY = argument1;

for(a=0;a<3;a++)
{
    slot = instance_create(startingX,startingY+a*160,oCharacterSlot)
    slot.topRightX = startingX;
    slot.topRightY = startingY+a*160;
    slot.Owner = id;
    PartySlot[a] = slot;
    if(PlayerData[a] != noone)&&PlayerIn[a]{
    
        slot.active = true;
        switch PlayerData[a]
        {
            case oBert:
                slot.portrait = sPlayerPartyIcon;
                slot.characterKey = oBert;
            break;
            
            case oPlayerBattle:
                slot.portrait = sPartyMember2PortraitDeactive;
                slot.characterKey = oPlayerBattle;
            break;
            
            case oPride:
                slot.portrait = sPridePortraitDeactive;
                slot.characterKey = oPride;
            break
        
        }
        guy = PlayerData[a]; 
        
        //Get the abilities index 0 = activeabilities 1 = allabilities
        abil = oGame.PlayerParty2[? guy];
        
        //Get all the abilities
        allAbil = abil[| 1];
        
        
        for(c=0;c<ds_list_size(allAbil);c++)
        {
            //Get the info of the ability were checking
            abilityInfo = oGame.abilityData[? allAbil[| c]];
            // 1 = abilitySprite 0 = abilityInfo
            abilityS = abilityInfo[| 1]
            abilityDesc = abilityInfo[| 0];
            // add the abilitysprite and description to the slots map
            slot.allAbilitiesDisplay[| c] = abilityS;
            slot.allAbilities[? abilityS] = abilityDesc;
        }
        
        // Check active abilities
        activ = abil[| 0];

        // Get the ability info and add it to the activeabilities list in the slot
        abilityInfo = oGame.abilityData[? activ[| 0]];
        slot.activeAbilities[| 0] = abilityInfo[| 1];
            
        
        abilityInfo = oGame.abilityData[? activ[| 1]];
        slot.activeAbilities[| 1] = abilityInfo[| 1];
        abilityInfo = oGame.abilityData[? activ[| 2]];
        slot.activeAbilities[| 2] = abilityInfo[| 1];
        
    }
}



