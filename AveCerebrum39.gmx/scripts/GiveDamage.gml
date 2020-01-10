///GiveDamage(Target,DamageAmount,ShakeAmount)

Target = argument0;
DamageAmount = argument1;
ShakeAmount = argument2;




Target.Damage += DamageAmount;
Target.Shake = true;
Target.SpriteShakeAmount = ShakeAmount;
Target.AttackTimer += setBack/0.5;
Target.MovementTimer += setBack/0.5;
Target.ShakeTime = 0;

