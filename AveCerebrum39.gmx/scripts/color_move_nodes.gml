///color_move_nodes(color,move,actions)

//argument 0 node ID to color
//argument1 SelectedActor's AP
//argument2 SelectedActor's actions

var node, move;
node = argument0;
move = argument1;
//actions = argument2;


if (node.DistanceFromOriginNode <= move){
        node.Shadow = true;
        }

