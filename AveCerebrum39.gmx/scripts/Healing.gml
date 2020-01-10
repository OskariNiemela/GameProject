if Heal > 0{
    if HitPoints = MaxHitPoints{
        Heal = 0;
    }else if HitPoints < MaxHitPoints{
        HitPoints += Heal;
        if HitPoints > MaxHitPoints{
            HitPoints = MaxHitPoints;
        }
    }

    Heal = 0;  
}
