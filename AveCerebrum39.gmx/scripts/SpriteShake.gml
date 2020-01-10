//If we have been hit 
if Shake{
    
    if State = "Idle"{
        sprite_index = Hurt;
    }
    ShakeTime += DELTA_TIME;
    if ShakeTime < ShakeDuration{
        CurrentX = map[gridX,gridY].x;
        x = CurrentX + SpriteShakeAmount*(sign(ShakeDir)*(ShakeDuration-ShakeTime));
        ShakeDir = ShakeDir *(-1);
    }else{
        if sprite_index = Hurt{
            sprite_index = Idle;
        }
        Shake = false;
        ShakeTime = 0;
        SpriteShakeAmount = 0;
    }
}
