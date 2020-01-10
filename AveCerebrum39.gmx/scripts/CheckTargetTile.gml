///CheckTargetTile(SpecificTile,TargetX,TargetY);

/*
If SpecificTile = true script will check whether the specific targeted tile is open, if not it will try other tiles up and down from the specific tile, 
if SpecificTile = false, script will check if the tile specified in relation to the target (if TargetX = 1 and TargetY = 0, script will check the tile
that is one X tile away from the target were currently attacking), if it is not script will change targets and try again, until all targets have been checked,
if no target fits the criteria, move on to the next move in the pattern
*/
SpecificTile = argument0;
TargetX = argument1;
TargetY = argument2;


if SpecificTile{
    if map[TargetX,TargetY].occupant != noone{
        var Neighbors, Neighbor, Index;
        Neighbors = ds_list_size(map[Target.gridX,Target.gridY].neighbors);
        Neighbor = noone;
        Index = 0;
        for(i=0;i>Neighbors;i+=1){
            Neighbor = ds_list_find_value(map[gridX,gridY].neighbors,i);
                if Neighbor.occupant = noone{
                    DestinationGridX = Neighbor.gridX;
                    DestinationGridY = Neighbor.gridY;
                    UseAbility = true;
                    break;
                }
                if i = Neighbors{
                    UseAbility = false;
                }
            
        }
        
    }else{
        DestinationGridX = map[TargetX,TargetY].gridX;
        DestinationGridY = map[TargetX,TargetY].gridY;
        UseAbility = true;
    }
    

}else{
    //If the specified tile in relation to the target isnt open, change the target
    if Target.gridX+TargetX<oCursor.MapWidth and Target.gridY+TargetY<oCursor.MapHeight and map[Target.gridX+TargetX,Target.gridY+TargetY].occupant = noone{
        DestinationGridX = map[Target.gridX+TargetX,Target.gridY+TargetY].gridX;
        DestinationGridY = map[Target.gridX+TargetX,Target.gridY+TargetY].gridY;
        UseAbility = true;

    }else{
        UseAbility = false;
    }
}


