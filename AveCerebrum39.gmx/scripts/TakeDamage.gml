if Damage > 0{
    if State != "Dead" and State != "Death"{
        audio_play_sound_on(oSFX.SFXEmitter,HurtSound,0,false);
        HitPoints -= floor(Damage*DamageMultiplier);
        Damage = 0;
        flashElapsed = flashTim;
        flash = 1;
        if HitPoints <= 0{
            State = "Dead";
            if Owner = "Player"
            {
                ds_queue_clear(actionQueue);
                ds_list_clear(queuePainter.drawTable);
            }
        }
    }else{
        Damage = 0;
    }
    
}

if CanTakeDamage = false{
    Timer += DELTA_TIME;
    if Timer >= TimeToTakeDamageMax{
        CanTakeDamage = true;
        Timer = 0;
    }
    
}
