///movement_range(OriginNode,AP)
//argument0 - origin node, the node to pathfind from
//argument1 - unit's MovementPoints

//reset all node data
wipe_nodes();

var NodesToEvaluate, NodesThatHaveBeenEvaluated, TargetX, TargetY;
var OriginNode, CurrentNodeToEvaluateFrom, neighbor;
var tempDistanceFromOriginNode, MovementPoints;
//Get our Targets x and y coordinates
TargetX = Target.gridX;
TargetY = Target.gridY;

//declare relevant variables from arguments
OriginNode = argument0;
MovementPoints = argument1;

//create data structures
NodesToEvaluate = ds_priority_create();
NodesThatHaveBeenEvaluated = ds_list_create();
//Calculate the value of the OriginNode
if  TargetX-OriginNode.gridX = 1 and TargetY-OriginNode.gridY = 0 or TargetX-OriginNode.gridX = 0 and TargetY-OriginNode.gridY = 1 {
    State = "Attack";
    Destination = OriginNode;
}else{
    OriginNode.Value = 0;
}

//add OriginNode node to the NodesToEvaluate list
ds_priority_add(NodesToEvaluate, OriginNode, 0);

//while NodesToEvaluate queue is not empty.. repeat following untill all nodes have been looked at
while(ds_priority_size(NodesToEvaluate) > 0) and Destination != OriginNode {
    //remove node with lowest DistanceFromOriginNode score from NodesToEvaluate
    CurrentNodeToEvaluateFrom = ds_priority_delete_min(NodesToEvaluate);
    
    //add that node to the NodesThatHaveBeenEvaluated list
    ds_list_add(NodesThatHaveBeenEvaluated, CurrentNodeToEvaluateFrom);
    
    //step through all of CurrentNodeToEvaluateFrom's neighbors
    for(ii= 0; ii < ds_list_size(CurrentNodeToEvaluateFrom.neighbors); ii += 1){
        neighbor = ds_list_find_value(CurrentNodeToEvaluateFrom.neighbors, ii);
        neighbor.Value = 100/(max(abs(TargetX-neighbor.gridX),abs(TargetY-neighbor.gridY))+1);
        //add neighbor to NodesToEvaluate list if it qualifies, ís passable, has no occupant, projected DistanceFromOriginNode score is less than MovementPoints, isn't already in the NodesThatHaveBeenEvaluated list and it has more value than CurrentNodeToEvaluateFrom
        
        if(ds_list_find_index(NodesThatHaveBeenEvaluated, neighbor) < 0 and neighbor.passable and neighbor.occupant == noone and neighbor.cost + CurrentNodeToEvaluateFrom.DistanceFromOriginNode <= MovementPoints)and neighbor.Value > CurrentNodeToEvaluateFrom.Value {
            //only calculate a new DistanceFromOriginNode score for neighbor if it hasn't already been calculated 
            if(ds_priority_find_priority(NodesToEvaluate,neighbor) == 0 or ds_priority_find_priority(NodesToEvaluate, neighbor) == undefined){
             
                
                //give neighbor the appropriate Parent
                neighbor.Parent = CurrentNodeToEvaluateFrom;
                
                
                             
                //calculate DistanceFromOriginNode score of neighbor
                if CurrentNodeToEvaluateFrom = OriginNode{
                    CurrentNodeToEvaluateFrom.DistanceFromOriginNode = 0
                }
                neighbor.DistanceFromOriginNode = CurrentNodeToEvaluateFrom.DistanceFromOriginNode + neighbor.cost;
                //add neighbor to the NodesToEvaluate list so it can be checked out too!
                ds_priority_add(NodesToEvaluate, neighbor, neighbor.DistanceFromOriginNode);
            //if neighbor's score has already been calculated
            }else{
                //figure out if the neighbor's score would be LOWER if found from CurrentNodeToEvaluateFrom!
               
                
                tempDistanceFromOriginNode = CurrentNodeToEvaluateFrom.DistanceFromOriginNode +neighbor.cost;
                
                if(tempDistanceFromOriginNode < neighbor.DistanceFromOriginNode){
                    neighbor.Parent = CurrentNodeToEvaluateFrom;
                    neighbor.DistanceFromOriginNode = tempDistanceFromOriginNode;
                    ds_priority_change_priority(NodesToEvaluate, neighbor, neighbor.DistanceFromOriginNode);
                    }
            }
        
        
    
        }
    
    }
    
}



//destroy NodesToEvaluate
ds_priority_destroy(NodesToEvaluate);






if Destination != OriginNode{
    //lets step through all the evaluated nodes and pick the one which has the most value(Gets us closest to our intended target)
    var NodeValue, DestinationX, DestinationY;
    NodeValue = 0;
    for(ii = 0; ii<ds_list_size(NodesThatHaveBeenEvaluated); ii += 1){
        CurrentNodeToEvaluateFrom = ds_list_find_value(NodesThatHaveBeenEvaluated, ii);
        if CurrentNodeToEvaluateFrom.Value > NodeValue and CurrentNodeToEvaluateFrom.occupant = noone {
            DestinationX = CurrentNodeToEvaluateFrom.gridX;
            DestinationY = CurrentNodeToEvaluateFrom.gridY;
            NodeValue = CurrentNodeToEvaluateFrom.Value
        }
    }
    
    Destination = map[DestinationX,DestinationY];
    
    ds_list_destroy(NodesThatHaveBeenEvaluated);
    State = "Move";
}else{
    ds_list_destroy(NodesThatHaveBeenEvaluated);
}
    
    
    

