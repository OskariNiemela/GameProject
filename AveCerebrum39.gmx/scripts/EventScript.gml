switch Event
        {
            case "Animating":
                switch AnimationTime
                {   
                    //Just do animation once and move on ´(Info: Animation to do)
                    case 0:
                        AnimatingTime = 0;
                        Event = "Animate";
                    break;
                    
                    //Get to the end of this animation and move on to the next one (Info: AnimatingTime, AnimationtoTransitionInto)
                    case 1:
                        AnimatingTime = -1;
                        CurrentAnimTime = (image_number-image_index)*DELTA_TIME/image_speed;
                        AnimationTimer = 0;
                        Event = "TransitionAnim";
                    break;
                    
                    //Indefinite animation  (Info: animation to loop indefinetly);
                    case 2:
                        AnimatingTime = 0;
                        
                        sprite_index = Animation;
                        image_speed = AnimationSpeed;
                        Event = "Loop";
                        ManagingEvent.NextOrder = true;
                    break;
                    
                    
                    //Play an animation, set Nextorder to true and play a return animation info: animation to play, return animation
                    case 3:
                        Event = "SegmentAnimation";
                        AnimationTime = 0;
                    break;
                    
                    default:
                        AnimatingTime = AnimationTime*DELTA_TIME/image_speed;
                        Event = "Animate";
                    break;
                    
                } 
            
            
            break;
            
            case "SegmentAnimation":
                if(sprite_index != Animation)
                {
                    SetUpAnimation(Animation);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    image_index = image_number-1;
                    image_speed = 0;
                    ManagingEvent.NextOrder = true;
                    Event = "ReturnAnim";
                }
            
            break;
            
            case "ReturnAnim":
                if(sprite_index != ReturnAnim)
                {
                    SetUpAnimation(ReturnAnim);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    Event = "Loop";
                    image_speed = 0;
                    image_index = image_number-1;
                }
            break;
            
            
            case "Animate":
                if(sprite_index != Animation)
                {
                    SetUpAnimation(Animation);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    image_index = image_number-1;
                    image_speed = 0;
                    ManagingEvent.NextOrder = true;
                    Event = "Loop";
                }
            break;
            
            // LOOP DOES NOTHINMG; DO NOT TOUCH THIS!!! ANIMATE ENDS ON THE LAST IMAGE_INDEX COS OF THIS
            case "Loop":
            
            break;
            
            case "TransitionAnim":
                    AnimationTimer += DELTA_TIME;
                    
                    if((AnimationTimer+DELTA_TIME) >=CurrentAnimTime)
                    {
                        Event = "Animate";
                        
                    }
            break;
            
            case "Giv":
                if sprite_index != sCompassionHandGlass
                {
                    SetUpAnimation(sCompassionHandGlass);
                }
                AnimationTimer += DELTA_TIME;
                
                if(AnimationTimer >= AnimatingTime)
                {
                    oPlayerWorld.Event = "Animating";
                    oPlayerWorld.AnimationTime = 3;
                    oPlayerWorld.Animation = sPlayer64TakeGlass;
                    oPlayerWorld.ReturnAnimation = sPlayer64GlassReturn;
                }
                
            break;
            
            case "GetUp":
                image_speed = AnimationSpeed;
                if x > instance_nearest(x,y,oChairMarker).x 
                {
                    
                    AnimationTime = 0;
                    Event = "Animating";
                    Animation = sPlayer64RightIdle;
                }
                else
                {
                    AnimationTime = 0;
                    Event = "Animating";
                    Animation = sPlayer64LeftIdle;
                }
            break;
            
            case "Water":
                if(instance_exists(oRustySink))
                {
                    if !Moved
                    {
                        if oRustySink.y > y{
                            yCoordinateMove = (oRustySink.y-40);
                        }else{
                            yCoordinateMove = (oRustySink.y+40);
                        }
                        //Figure out where we're going
                        xCoordinateMove = oRustySink.x;
                        Moved = true;
                    }
                    
                    MoveToCoordinates();
                    //If we're within certain parameters, make our coordinates exactly where we're supposed to be
                    if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                        x = xCoordinateMove;
                        y = yCoordinateMove;
                        image_speed = 0;
                        Moved = false;
                        image_index = 0;
                        Event = "Pour";
                    }
                    
                }
                else
                {
                    Event = "Idle";
                    ManagingEvent.NextOrder = true;
                }
            break;
            
            case "Pour":
                if(sprite_index != sCompassionPour)
                {
                    SetUpAnimation(sCompassionPour);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    oRustySink.State = "Open";
                    Event = "Wait";
                    WaitTime = 1.5;
                    Goto = "Return";
                    ReturnAnim = sPourReturn;
                }
                
            break;
            
            case "Wait":
                WaitTime-=DELTA_TIME;
                
                if(WaitTime<=0)
                {
                    WaitTime = 0;
                    Event = Goto;
                }
            break;
            
            case "Return":
                if(sprite_index != ReturnAnim)
                {
                    SetUpAnimation(ReturnAnim);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    Event = "TakeTo";
                }
                
            
            break;
            
            case "DropGlass":
                if sprite_index != ReturnAnim
                {
                    SetUpAnimation(ReturnAnim);
                    instance_create(x+10,y-20,oFallGlass);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer >= AnimatingTime)
                {
                    Event = "Loop";
                    image_index = image_number-1;
                    ManagingEvent.NextOrder = true;
                    image_speed = 0;
                }
            break;
            
            case "TakeTo":
            
                if !Moved {
                    if oPlayerWorld.x > x{
                        xCoordinateMove = (oPlayerWorld.x-100);
                    }else{
                        xCoordinateMove = (oPlayerWorld.x+100);
                    }
                    //Figure out where we're going
                    yCoordinateMove = oPlayerWorld.y;
                    Moved = true;
                }
                //If we're above the intended yCoordinateMove
                if y < yCoordinateMove{
                    if sprite_index != sCompassionWalkDownGlass{
                        sprite_index = sCompassionWalkDownGlass;
                    }
                    if(abs(y-yCoordinateMove) <MySpeed)
                    {
                        y = yCoordinateMove;
                        vspeed = 0;
                    }
                    else
                    {
                        vspeed = MySpeed;
                    }
                    
                //If we're below our intended yCoordinateMove
                }else if y > yCoordinateMove{
                    if sprite_index != MoveUp{
                        sprite_index = MoveUp
                    }
                    if(abs(y-yCoordinateMove) <MySpeed)
                    {
                        y = yCoordinateMove;
                        vspeed = 0;
                    }
                    else
                    {
                        vspeed = -MySpeed;
                    }
                    
                //If we're to the right of our intended xCoordinateMove
                }else if x < xCoordinateMove{
                    if sprite_index != MoveRight{
                        sprite_index = MoveRight    
                    }
                    
                    if(abs(x-xCoordinateMove) < MySpeed)
                    {
                        x = xCoordinateMove;
                        hspeed = 0;
                    }
                    else
                    {
                        hspeed = MySpeed;
                    }
                //If we're to the left of our intended xCoordinateMove
                }else if x > xCoordinateMove{
                    if sprite_index != sCompassionWalkGlass{
                        sprite_index = sCompassionWalkGlass;
                    
                    }
                    
                    if(abs(x-xCoordinateMove) < MySpeed)
                    {
                        x = xCoordinateMove;
                        hspeed = 0;
                    }
                    else
                    {
                        hspeed = -MySpeed;
                    }
                    

                }
                //If we're within certain parameters, make our coordinates exactly where we're supposed to be
                if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;
                    ManagingEvent.NextOrder = true;
                    Event = "Loop";
                }
            
            
            break;
            
            case "DeSpawn":
                //If we dont know where we're going yet, get the player coordinates and calculate where we're supposed to go to
                if Moved == false{
                    xCoordinateMove = oPlayerWorld.x;
                    yCoordinateMove = oPlayerWorld.y;
                    Moved = true;
                }
                image_speed = AnimationSpeed;
                MoveToCoordinates();
                
                //If we're within certain parameters, make our coordinates exactly where we're supposed to be
                if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;
                    ManagingEvent.NextOrder = true;
                    destroyOverworldInstance();
                }
            break;
            
            case "SpawnPlayer":
                switch dir
                {
                    case 0:
                        if(object_index = oCompassionWorld)
                        {
                            xCoordinateMove = oPlayerWorld.x-100;
                        }
                        else
                        {
                            xCoordinateMove = oPlayerWorld.x+100;
                        }
                        yCoordinateMove = oPlayerWorld.y;
                    break;
                    
                    case 1:
                        if(object_index = oCompassionWorld)
                        {
                            xCoordinateMove = oPlayerWorld.x-100;
                        }
                        else
                        {
                            xCoordinateMove = oPlayerWorld.x+100;
                        }
                        yCoordinateMove = oPlayerWorld.y;
                    break;
                    
                    case 2:
                        if(object_index = oCompassionWorld)
                        {
                            yCoordinateMove = oPlayerWorld.y-100;
                        }
                        else
                        {
                            yCoordinateMove = oPlayerWorld.y+100;
                        }
                        xCoordinateMove = oPlayerWorld.x;
                    break;
                    
                    case 3:
                        if(object_index = oCompassionWorld)
                        {
                            yCoordinateMove = oPlayerWorld.y-100;
                        }
                        else
                        {
                            yCoordinateMove = oPlayerWorld.y+100;
                        }
                        xCoordinateMove = oPlayerWorld.x;
                    break;
                    
                    case 10:
                    if oPlayerWorld.x > 500
                    {
                        yCoordinateMove = oPlayerWorld.y;
                        xCoordinateMove = oPlayerWorld.x-10;
                    }
                    else
                    {
                        yCoordinateMove = oPlayerWorld.y;
                        xCoordinateMove = oPlayerWorld.x+10;
                    }
                        
                    break;
                }
                Event = "Move";
            break;
            
            case "Move":
                image_speed = AnimationSpeed;
                //If we're above the intended yCoordinateMove
                MoveToCoordinates();
                //If we're within certain parameters, make our coordinates exactly where we're supposed to be
                if abs(x-xCoordinateMove) <= MySpeed and abs(y-yCoordinateMove) <= MySpeed{
                    switch dir
                    {
                        case 0:
                            sprite_index = IdleDown;
                        break;
                        
                        case 1:
                            sprite_index = IdleUp;
                        break;
                        
                        case 2:
                            sprite_index = IdleLeft;
                        break;
                        
                        case 3:
                            sprite_index = IdleRight;
                        break;
                        
                        case 10:
                            if x>oPlayerWorld.x
                            {
                                sprite_index = IdleLeft;
                            }
                            else
                            {
                                sprite_index = IdleRight;
                            }
                            
                        break;
                    }
                    dir = -1;
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    speed = 0;
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;
                    ManagingEvent.NextOrder = true;
                    Event = "Idle";
                }
            break;
            
            case "MovePlayer":
                //If we dont know where we're going yet, get the player coordinates and calculate where we're supposed to go to
                if Moved == false{
                    if oPlayerWorld.x > x{
                        xCoordinateMove = (oPlayerWorld.x-100);
                    }else{
                        xCoordinateMove = (oPlayerWorld.x+100);
                    }
                    //Figure out where we're going
                    yCoordinateMove = oPlayerWorld.y;
                    Moved = true;
                }
                //If we're above the intended yCoordinateMove
                MoveToCoordinates();
                //If we're within certain parameters, make our coordinates exactly where we're supposed to be
                if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    image_speed = 0;
                    speed = 0;
                    image_index = 0;
                    Moved = false;
                    Event = "Idle";
                    ManagingEvent.NextOrder = true;
                    
                }
                
            break;
        
            case "Idle":
                image_speed = 0;
                image_index = 0;
            break;
        
            case "SitChair":
                if(interInstance == noone)
                {
                    if(instance_exists(oChairMarker))
                    {
                        interInstance = instance_nearest(x,y,oChairMarker);
                    }
                    else
                    {
                        ManagingEvent.NextOrder = true;
                        Event = "Idle";
                    }
                }
                
                if Moved==false and interInstance!= noone
                {
                    yCoordinateMove = interInstance.y;
                    if x>interInstance.x
                    {
                        xCoordinateMove = interInstance.x+64;
                    }
                    else
                    {
                        xCoordinateMove = interInstance.x-64;
                    }
                    Moved = true;
                }
                MoveToCoordinates();
                if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                    AnimationTime = 3;
                    if(x>interInstance.x)
                    {
                        Animation = sPlayer64Left;
                        ReturnAnim = sPlayer64SitLeftIdle;
                    }
                    else
                    {
                        Animation = sPlayer64Right;
                        ReturnAnim = sPlayer64SitRightIdle;
                    }
                    
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;
                    interInstance = noone;
                    Event = "Animating";
                }
                
            break;
            
            case "Take":
                if(interInstance == noone)
                {
                    if(instance_exists(Interactable))
                    {
                        interInstance = instance_nearest(x,y,Interactable);
                        if sprite_index !=Animation 
                        {
                            SetAnimation(Animation);
                        }
                    }
                    else
                    {
                        ManagingEvent.NextOrder = true;
                        Event = "Idle";
                    }
                }
                Timer += DELTA_TIME;
                if Timer>=AnimationTime
                {
                    with interInstance
                    {
                        instance_destroy();
                    }
                    Event = "ReturnAnim";
                    ManagingEvent.NextOrder = true;
                }
            break;
            
            case "PickUp":
                 if(interInstance == noone)
                {
                    if(instance_exists(Interactable))
                    {
                        interInstance = instance_nearest(x,y,Interactable);
                    }
                    else
                    {
                        ManagingEvent.NextOrder = true;
                        Event = "Idle";
                    }
                }
                if Moved==false and interInstance!= noone
                {
                    xCoordinateMove = interInstance.x;
                    if y>interInstance.y
                    {
                        yCoordinateMove = interInstance.y+32;
                    }
                    else
                    {
                        yCoordinateMove = interInstance.y-32;
                    }
                    Moved = true;
                }
                MoveToCoordinates();
                if abs(x-xCoordinateMove) < MySpeed and abs(y-yCoordinateMove) < MySpeed{
                    AnimationTime = 3;
                    if(x>interInstance.x)
                    {
                        Animation = sCompassionSetDown;
                        ReturnAnim = sCompassionReadMag;
                    }
                    else
                    {
                        Animation = sCompassionSetDown;
                        ReturnAnim = sCompassionReadMag;
                    }
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    xCoordinateMove = interInstance.x;
                    yCoordinateMove = interInstance.y;
                    instance_destroy(interInstance);
                    
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;
                    interInstance = noone;
                    Event = "Animating";
                }
                
            
            break;
            
            case "PutDown":
                if sprite_index != sCompassionSetDown
                {
                    SetUpAnimation(sCompassionSetDown);
                }
                AnimationTimer+=DELTA_TIME;
                if(AnimationTimer>=AnimatingTime)
                {
                    instance_create(xCoordinateMove,yCoordinateMove,Interactable);
                    ReturnAnim = sCompassionOverworldDown;
                    Event = "ReturnAnim";
                }
            break;
            
            case "LiftOut":
                if(interInstance == noone)
                {
                    if(instance_exists(Interactable))
                    {
                        interInstance = instance_nearest(x,y,Interactable);
                        xCoordinateMove = interInstance.x;
                        if y>interInstance.y
                        {
                            yCoordinateMove = interInstance.y+32;
                        }
                        else
                        {
                            yCoordinateMove = interInstance.y-32;
                        }
                    }
                    else
                    {
                        ManagingEvent.NextOrder = true;
                        Event = "Idle";
                        
                    }
                }
                MoveToCoordinates();
                if abs(x-xCoordinateMove) <= MySpeed and abs(y-yCoordinateMove) <= MySpeed{
                    x = xCoordinateMove;
                    y = yCoordinateMove;
                    image_speed = 0;
                    image_index = 0;
                    Moved = false;

                    Event = "PreLift";
                }
            break;
            
            case "PreLift":
                if(sprite_index != PreLift)
                {
                    SetUpAnimation(PreLift);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer>=AnimatingTime)
                {
                    Event = "Lift";
                }
            break;
            
            case "Lift":
                if(sprite_index != Lift)
                {
                    SetUpAnimation(Lift);
                    startX = x;
                    startY = interInstance.y;
                    midX = x;
                    midY = y-32;
                    endY = y-64;
                    endX = x;
                }
                AnimationTimer += DELTA_TIME;
                interInstance.x = MoveInBezierCurve(AnimationTimer/AnimatingTime,startX,midX,endX);
                interInstance.y = MoveInBezierCurve(AnimationTimer/AnimatingTime,startY,midY,endY);
                if(AnimationTimer>=AnimatingTime)
                {
                    interInstance.x = endX;
                    interInstance.y = endY;
                    Event = "Throw";
                }
                
            break;
            
            case "Throw":
                if(sprite_index != Throw)
                {
                    interInstance.State = "Thrown";
                    SetUpAnimation(Throw);
                }
                AnimationTimer += DELTA_TIME;
                if AnimationTimer >= AnimatingTime
                {
                    Animation = ThrowReturn;
                    Event = "Animate";
                }
            break;
            
            case "Drop":
                if(sprite_index != dropAnim)
                {
                    SetUpAnimation(dropAnim);
                }
                AnimationTimer += DELTA_TIME;
                if(AnimationTimer>=AnimatingTime)
                {
                    drop = instance_create(x-32,y,droppable);
                    drop.image_angle = 90;
                    Event = "Loop";
                    image_index = image_number-1;
                    image_speed = 0;
                    ManagingEvent.NextOrder = true;
                }
            break;
            
        }
