
var i;
i = 0;
repeat(3){
    oCursor.Toolbar[i] = noone;
    i += 1
}

oCursor.NoMoreAbilities = false;
with(oSkillbar){
    instance_destroy();
}

