//make him the selected character
oCursor.SelectedActor = CurrentTurn;
oCursor.SelectedActor.AP = oCursor.SelectedActor.MaxAP+oCursor.SelectedActor.ModSpeed;
//do movement range for that character
with(oCursor){
    wipe_nodes();
    SelectedActor.State = "EvaluateMovement";
}
