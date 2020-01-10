///movement_range(OriginNode,AP)
//argument0 - origin node, the node to pathfind from
//argument1 - unit's MovementPoints

//reset all node data
wipe_nodes();

var NodesToEvaluate, NodesThatHaveBeenEvaluated;
var OriginNode, CurrentNodeToEvaluate, neighbor;
var tempDistanceFromOriginNode, MovementPoints, costMod;

//declare relevant variables from arguments
OriginNode = argument0;
MovementPoints = argument1;

//create data structures
NodesToEvaluate = ds_priority_create();
NodesThatHaveBeenEvaluated = ds_list_create();

//add OriginNode node to the NodesToEvaluate list
ds_priority_add(NodesToEvaluate, OriginNode, 0);

//while NodesToEvaluate queue is not empty.. repeat following untill all nodes have been looked at
while(ds_priority_size(NodesToEvaluate) > 0){
    //remove node with lowest DistanceFromOriginNode score from NodesToEvaluate
    CurrentNodeToEvaluate = ds_priority_delete_min(NodesToEvaluate);
    
    //add that node to the NodesThatHaveBeenEvaluated list
    ds_list_add(NodesThatHaveBeenEvaluated, CurrentNodeToEvaluate);
    
    //step through all of CurrentNodeToEvaluate's neighbors
    for(ii= 0; ii < ds_list_size(CurrentNodeToEvaluate.neighbors); ii += 1){
        neighbor = ds_list_find_value(CurrentNodeToEvaluate.neighbors, ii);
        
        //add neighbor to NodesToEvaluate list if it qualifies, ís passable, has no occupant, projected DistanceFromOriginNode score is less than MovementPoints, isn't already in the NodesThatHaveBeenEvaluated list
        
        
        if(ds_list_find_index(NodesThatHaveBeenEvaluated, neighbor) < 0 and neighbor.passable and neighbor.occupant == noone and neighbor.cost + CurrentNodeToEvaluate.DistanceFromOriginNode <= MovementPoints){
            //only calculate a new DistanceFromOriginNode score for neighbor if it hasn't already been calculated
            
            if(ds_priority_find_priority(NodesToEvaluate,neighbor) == 0 or ds_priority_find_priority(NodesToEvaluate, neighbor) == undefined){
                costMod = 1;
                
                //give neighbor the appropriate Parent
                neighbor.Parent = CurrentNodeToEvaluate;
                
                
                             
                //calculate DistanceFromOriginNode score of neighbor
                if CurrentNodeToEvaluate = OriginNode{
                    CurrentNodeToEvaluate.DistanceFromOriginNode = 0
                }
                neighbor.DistanceFromOriginNode = CurrentNodeToEvaluate.DistanceFromOriginNode + (neighbor.cost * costMod);
                //add neighbor to the NodesToEvaluate list so it can be checked out too!
                ds_priority_add(NodesToEvaluate, neighbor, neighbor.DistanceFromOriginNode);
            //if neighbor's score has already been calculated
            }else{
                //figure out if the neighbor's score would be LOWER if found from CurrentNodeToEvaluate!
                costMod = 1;
                
                tempDistanceFromOriginNode = CurrentNodeToEvaluate.DistanceFromOriginNode +(neighbor.cost * costMod);
                
                if(tempDistanceFromOriginNode < neighbor.DistanceFromOriginNode){
                    neighbor.Parent = CurrentNodeToEvaluate;
                    neighbor.DistanceFromOriginNode = tempDistanceFromOriginNode;
                    ds_priority_change_priority(NodesToEvaluate, neighbor, neighbor.DistanceFromOriginNode);
                    }
            }
        
        
    
        }
    
    }
    
}

with(oNoDeH){
    DistanceFromOriginNode = floor(DistanceFromOriginNode);
}

//destroy NodesToEvaluate
ds_priority_destroy(NodesToEvaluate);







//lets color all those move nodes and destroy the NodesThatHaveBeenEvaluated list as well.

for(ii = 0; ii<ds_list_size(NodesThatHaveBeenEvaluated); ii += 1){
    CurrentNodeToEvaluate = ds_list_find_value(NodesThatHaveBeenEvaluated, ii);
    CurrentNodeToEvaluate.MoveNode = true;
    
    color_move_nodes(CurrentNodeToEvaluate, argument1);
    
}
OriginNode.MoveNode = false;

ds_list_destroy(NodesThatHaveBeenEvaluated);






















