 //if we press the right mouse button we cancel the ability
    if mouse_check_button_pressed(mb_right){
        Owner.State ="EvaluateMovement";
        
        instance_destroy();    
        //Make sure that if our Owner's turn ends for whatever reason that we destroy ourselves
    }else if Owner.State = "EndTurn"{
        instance_destroy();
    }
