
 
  
   
    
     
      
       
        
         
          
           

        //If the tile we died on already has someone standing on it
if instance_exists(map[gridX,gridY].occupant){
    var i;
    i = 1;
            //Look for a nearby empty tile
    if map[gridX+i,gridY].occupant == noone{
        map[gridX+i,gridY].occupant = id;
        gridX += i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
       
    }else if map[gridX,gridY+i].occupant == noone{
        map[gridX,gridY+i].occupant = id;
        gridY += i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
       
    }else if map[gridX+i,gridY+i].occupant  == noone{
         map[gridX+i,gridY+i].occupant = id;
        gridY += i;
        gridX += i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
    
    }else if map[gridX-i,gridY].occupant == noone{
        map[gridX-i,gridY].occupant = id;
        gridX -= i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
    
    }else if map[gridX,gridY-i].occupant == noone{
         map[gridX,gridY-i].occupant = id;
        gridY -= i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
    
    }else if map[gridX-i,gridY-i].occupant == noone{
        map[gridX-i,gridY-i].occupant = id;
        gridY -= i;
        gridX -= i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
    
    }else if map[gridX+i,gridY-i].occupant == noone{
        map[gridX+i,gridY-i].occupant = id;
        gridY -= i;
        gridX += i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
          
    }else if map[gridX-i,gridY+i].occupant == noone{
        map[gridX-i,gridY+i].occupant = id;
        gridY += i;
        gridX -= i;

        oCursor.Party[PartyNumber] = id;
        oBattleScreen.Players += 1;
        sprite_index = Idle;
        State = "Idle";
    }
            //If no one is on the tile just ressurect where you died.
}else{
    map[gridX,gridY].occupant = id;
    oCursor.Party[PartyNumber] = id;
    oBattleScreen.Players += 1;
    sprite_index = Idle;
    State = "Idle";
   

}
    
        
x = map[gridX,gridY].x;
y = map[gridX,gridY].y;
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
