



if AbilityReady = false{
    //if our target is right next to us, dont do anything just wait.
    if  abs(Target.gridY-gridY) <= 1 and abs(Target.gridX-gridX) <= 1{
            MovementTimer = 0.1;
            State = "Idle";
    
    }
    //If our target is on our Y plane(+1)
    else if abs(Target.gridY-gridY) <= 1{
        //Check whether the target is on our left or on our right
        if Target.gridX > gridX{
            if map[gridX+1,gridY].occupant = noone{
                MoveXMelee(1);
            }
        }else {
             if map[gridX-1,gridY].occupant = noone{
                MoveXMelee(-1);
            }
        }
            //If we cant move one Y up (something is blocking us from doing so) move one X to either side
    
    }
    //If our target is on our X plane(+1)
    else if abs(Target.gridX-gridX) <= 1{
        //Check whether our target is up or down from us
        if Target.gridY > gridY{
            if map[gridX,gridY+1].occupant = noone{
                MoveYMelee(1);
            }
        }else{
            if map[gridX,gridY-1].occupant = noone{
                MoveYMelee(-1);
            }
        
        
        }
    
    }
    //If our target is on neither
    else if instance_exists(Target) {
        //If our target is down from us and to the left
        if Target.gridY > gridY and Target.gridX < gridX{
            if LastDirectionWeMovedIn ="HZ" or LastDirectionWeMovedIn = "n/a"{
                if map[gridX,gridY+1].occupant = noone{
                    MoveYMelee(1);
                }
            
            }else{
                if map[gridX-1,gridY].occupant = noone{
                    MoveXMelee(-1);
                
                }
            
            
            
            }
        
        }
        //If our target is down from us and to the right
        if Target.gridY > gridY and Target.gridX > gridX{
            if LastDirectionWeMovedIn ="HZ" or LastDirectionWeMovedIn = "n/a"{
                if map[gridX,gridY+1].occupant = noone{
                    MoveYMelee(1);
                }
            
            
            }else{
                 if map[gridX+1,gridY].occupant = noone{
                    MoveXMelee(1);
                
                }
            
            
            }
        
        }
        //If our target is up from us and to the left
        if Target.gridY < gridY and Target.gridX < gridX{
            if LastDirectionWeMovedIn ="HZ" or LastDirectionWeMovedIn = "n/a"{
                if map[gridX,gridY-1].occupant = noone{
                    MoveYMelee(-1);
                }
            
            
            }else{
                if map[gridX-1,gridY].occupant = noone{
                    MoveXMelee(-1);
                
                }
            
            
            }
        
        }
        //If our target is up from us and to the right
        if Target.gridY < gridY and Target.gridX > gridX{
            if LastDirectionWeMovedIn ="HZ" or LastDirectionWeMovedIn = "n/a"{
                if map[gridX,gridY-1].occupant = noone{
                    MoveYMelee(-1);
                }
            
            
            }else{
                if map[gridX+1,gridY].occupant = noone{
                    MoveXMelee(1);
                
                }
            
            
            }
        
        }
    }
    
    
}else if AbilityReady{
    //if our ability is ready, our main objective is to get to the optimal position to use our ability (we want our TargetXPositionDifference and TargetYPositionDifference to equal zero).
    
    //if we're on the left and up from our target (plus x or plus y)
    if TargetXPositionDifference > 0 and TargetYPositionDifference > 0{
        if LastDirectionWeMovedIn = "HZ" or LastDirectionWeMovedIn = "n/a"{
            if map[gridX,gridY+1].occupant = noone{
                if map[gridX,gridY+1].occupant = noone{
                    MoveYMelee(1);
                }else if map[gridX+1,gridY].occupant = noone{
                    MoveXMelee(1);
                }    
            
            }
        
        }else{
            if map[gridX+1,gridY].occupant = noone{
                MoveXMelee(1);
            }  
        }
        
    //if we're on the left and down from our target (plus x or minus y)
    }else if TargetXPositionDifference > 0 and TargetYPositionDifference < 0{
        if LastDirectionWeMovedIn = "HZ" or LastDirectionWeMovedIn = "n/a"{
            if map[gridX,gridY-1].occupant = noone{
                if map[gridX,gridY-1].occupant = noone{
                    MoveYMelee(-1);
                }else if map[gridX+1,gridY].occupant = noone{
                    MoveXMelee(1);
                }    
            
            }
        
        }else{
            if map[gridX+1,gridY].occupant = noone{
                MoveXMelee(1);
            }
              
        }
    
    //If we're on the right and down from our target (minus x or minus y)
    }else if TargetXPositionDifference < 0 and TargetYPositionDifference < 0{
        if LastDirectionWeMovedIn = "HZ" or LastDirectionWeMovedIn = "n/a"{
            if map[gridX,gridY-1].occupant = noone{
                if map[gridX,gridY-1].occupant = noone{
                    MoveYMelee(-1);
                }else if map[gridX-1,gridY].occupant = noone{
                    MoveXMelee(-1);
                }    
            
            }
        
        }else{
            if map[gridX-1,gridY].occupant = noone{
                MoveXMelee(-1);
            }  
        }
    //If we're on the right and up from our target ( minus x or plus y)
    }else if TargetXPositionDifference < 0 and TargetYPositionDifference > 0 {
        if LastDirectionWeMovedIn = "HZ" or LastDirectionWeMovedIn = "n/a"{
            if map[gridX,gridY+1].occupant = noone{
                if map[gridX,gridY+1].occupant = noone{
                    MoveYMelee(1);
                }else if map[gridX-1,gridY].occupant = noone{
                    MoveXMelee(-1);
                }    
            
            }
        
        }else{
            if map[gridX-1,gridY].occupant = noone{
                MoveXMelee(-1);
            }  
        }
    //If we're right from our target and in the correct y position (minus x)
    }else if TargetXPositionDifference < 0 and TargetYPositionDifference = 0{    
            if map[gridX-1,gridY].occupant = noone{
                MoveXMelee(-1);
            }  
    //If we're left from our target and in the correct y position (plus x)
    }else if TargetXPositionDifference > 0 and TargetYPositionDifference = 0{
            if map[gridX+1,gridY].occupant = noone{
                MoveXMelee(1);
            }
    
    //If we're in the correct x position and up from our target (plus y)
    }else if TargetXPositionDifference = 0 and TargetYPositionDifference > 0{
        if  map[gridX,gridY+1].occupant = noone{
            MoveYMelee(1);
        }
    
    //If we're in the correct x position and down from our target(minus y)
    }else if TargetXPositionDifference = 0 and TargetYPositionDifference < 0{
        if map[gridX,gridY-1].occupant = noone{
            MoveYMelee(-1);
        }
    
    //If we're in the correct position, just postpone our movement by alittle so the ability has a chance to activate.
    }else if TargetXPositionDifference = 0 and TargetYPositionDifference = 0{
        MovementTimer = MovementTime;
        State = "Idle";
    }


}

State = "Idle";






















