/// @arg speed
/// @arg direction

var spd = argument0;
var dir = argument1;

var xtarg = x+lengthdir_x(spd,dir);
var ytarg = y+lengthdir_y(spd,dir);

if !place_meeting(xtarg,ytarg,oSolid) and !place_meeting(xtarg,ytarg,oFriendly) and !place_meeting(xtarg,ytarg,oMask) and xtarg>0 and xtarg<room_width and ytarg>0 and ytarg<room_width{
    x = xtarg;
    y = ytarg;
    MovingAnim = true;
}else{
    var sweep_interval = 10;
    for ( var angle = sweep_interval; angle <= 80; angle += sweep_interval) {
        for ( var multiplier = -1; multiplier <= 1; multiplier += 2) {      
            var angle_to_check = dir+angle*multiplier;
            xtarg = x+lengthdir_x(spd, angle_to_check);
            ytarg = y+lengthdir_y(spd, angle_to_check);     
            if !place_meeting(xtarg,ytarg,oSolid) and !place_meeting(xtarg,ytarg,oFriendly)and !place_meeting(xtarg,ytarg,oMask) and xtarg>0 and xtarg<room_width and ytarg>0 and ytarg<room_width{
                MoveDir = angle_to_check;
                x = xtarg;
                y = ytarg;
                MovingAnim = true;  
                exit;       
            }   
        }
    }
}
