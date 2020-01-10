

if(currentAction = noone and !ds_queue_empty(actionQueue) and State = "Idle")
{
    currentAction = ds_queue_dequeue(actionQueue);
}


switch(currentAction)
{
    case "Attack":
        if AttackTimer <= 0
        {
            State = "Attack";
            currentAction = noone;
            ds_list_delete(queuePainter.drawTable,0);
        }
    
    break;
    
    case "Up":
        if MovementTimer <= 0
        {
            if gridY>0 and map[gridX,gridY-1].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridY -= 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                y = map[gridX,gridY].y;
                currentAction = noone;
                ds_list_delete(queuePainter.drawTable,0);
            }
            
        }
    
    break;
    
    case "Down":
    
        if MovementTimer <= 0
        {
            if  gridY < oCursor.MapHeight and map[gridX,gridY+1].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridY += 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                y = map[gridX,gridY].y;
                currentAction = noone;
                ds_list_delete(queuePainter.drawTable,0);
            }
            
        }
    
    break;
    
    case "Right":
    
        if MovementTimer <= 0
        {
            if  gridX < oCursor.MapWidth and map[gridX+1,gridY].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridX += 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                x = map[gridX,gridY].x;
                currentAction = noone;
                ds_list_delete(queuePainter.drawTable,0);
            }
            
        }
    
    break;
    
    case "Left":
    
        if MovementTimer <= 0
        {
            if  gridX > 0 and map[gridX-1,gridY].occupant = noone{
                map[gridX,gridY].occupant = noone;
                gridX -= 1;
                MovementTimer = MovementTime;
                map[gridX,gridY].occupant = id;
                x = map[gridX,gridY].x;
                currentAction = noone;
                ds_list_delete(queuePainter.drawTable,0);
            }
            
        }
    
    
    break;
    
    case 1:
    
        if AbilityCooldown1 <= 0
        {
            State = "UsingAbility";
            UsingAbility = Abilities[| 0];
            currentAction = noone;
            ds_list_delete(queuePainter.drawTable,0);
        }
    
    break;
    
    case 2:
    
        if AbilityCooldown2 <= 0
        {
            State = "UsingAbility";
            UsingAbility = Abilities[| 1];
            currentAction = noone;
            ds_list_delete(queuePainter.drawTable,0);
        }
    
    break;
    
    case 3:
    
        if AbilityCooldown3 <= 0
        {
            State = "UsingAbility";
            UsingAbility = Abilities[| 2];
            currentAction = noone;
            ds_list_delete(queuePainter.drawTable,0);
        }
    
    break;
    
    case "Res":
        State = "Resurrect";
        currentAction = noone;
        ds_list_delete(queuePainter.drawTable,0);
    break;
    
}

