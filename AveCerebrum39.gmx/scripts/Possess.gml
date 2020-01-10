

if sprite_index != Ability1Animation{
    sprite_index = Ability1Animation;
    Timer = 0;
    image_index = 0;
    image_speed = AnimationSpeed
    AnimationTime = image_number*DELTA_TIME / image_speed;
}

Timer += DELTA_TIME

if Timer >= AnimationTime{
    //Check the tile infront of us, if there is someone there, then possess them
    audio_play_sound_on(oSFX.SFXEmitter,AttackSound,false,8);
    if AbilityDir = "Left"{
        if instance_exists(map[gridX-1,gridY].occupant) and map[gridX-1,gridY].occupant.Owner = "Player"{
            PossessionTarget = map[gridX-1,gridY].occupant;
            
        }
    }else if AbilityDir = "Right"{
        if instance_exists(map[gridX+1,gridY].occupant) and map[gridX+1,gridY].occupant.Owner = "Player"{
            PossessionTarget = map[gridX+1,gridY].occupant;
            
        }
    
    }else if AbilityDir = "Down"{
        if instance_exists(map[gridX,gridY+1].occupant) and map[gridX,gridY+1].occupant.Owner = "Player"{
            PossessionTarget = map[gridX,gridY+1].occupant;
            
        }
    
    }else if AbilityDir = "Up"{
        if instance_exists(map[gridX,gridY-1].occupant) and map[gridX,gridY-1].occupant.Owner = "Player"{
            PossessionTarget = map[gridX,gridY-1].occupant;
            
        }
    
    }
    if instance_exists(PossessionTarget){
        State = "Possession";
        map[gridX,gridY].occupant = noone;
    }else{
        State = "Return";
    }

    AnimationTime = 0;
}
