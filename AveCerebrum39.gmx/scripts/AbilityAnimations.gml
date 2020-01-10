if sprite_index != AbilityAnimation{
    sprite_index = AbilityAnimation;
    image_index = 0;
    Timer = 0;
    AnimationTime = image_number*DELTA_TIME / image_speed;
    image_speed = AnimationSpeed;
}
Timer += DELTA_TIME;
if Timer >= AnimationTime{
    if TargetedAbility{
        image_speed = 0;
        image_index = image_number-1;
        if gridX <= oCursor.MapHeight{
            TargetedGridX = gridX+1;
        }else{
            TargetedGridX = gridX;
        }
        TargetedGridY = gridY;
        State = "Targeting";
    }else{
        audio_play_sound_on(oSFX.SFXEmitter,AbilitySound,false,8);
        effects_handler.State="UseParticles";
        effects_handler.use_effect = UsingAbility;
        Ability = instance_create(x,y,UsingAbility);
        Ability.Owner = id;
        Ability.gridX = gridX;
        Ability.gridY = gridY;
        State = "AbilityReturn";
    }
}
