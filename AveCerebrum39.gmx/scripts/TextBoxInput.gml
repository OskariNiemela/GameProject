///TextBoxInput(MessageCount);
    
MessageCount = argument0;

if Dialogues{
    SpeechBox = instance_create(0,view_hport-360,oDialogue);
    SpeechBox.Owner = id;
    var TextBoxHeight, IndexLength;
    TextBoxHeight = array_height_2d(TextBox);
    //Copy textbox to messages on the dialogue object
    for(i=0;i<TextBoxHeight;i+=1){
        IndexLength = array_length_2d(TextBox,i);
        for(b=0;b<IndexLength;b+=1){
            SpeechBox.Messages[i,b] = TextBox[i,b];
        }
    
    }
    //Copy the options that the player has onto the dialogue object
    TextBoxHeight = array_height_2d(Options);
    
    for(i=0;i<TextBoxHeight;i+=1){
        IndexLength = array_length_2d(Options,i);
        for(b=0;b<IndexLength;b+=1){
            SpeechBox.OptionsSelect[i,b] = Options[i,b];
        }
    
    }
    TextBoxHeight = array_length_1d(EndingLines);
    //Copy the ending lines
    for(i=0;i<TextBoxHeight;i+=1){
        SpeechBox.Endings[i] = EndingLines[i];
    }
    SpeechBox.OptionsAmount = array_height_2d(Options);
    SpeechBox.StartingLine = StartingLine;
    SpeechBox.MessageLength = string_length(TextBox[StartingLine,0]);
    SpeechBox.MessageEnd = array_length_2d(TextBox,StartingLine);
    var c;
    c = 0;
    repeat(array_height_2d(Options)){
        SpeechBox.ButtonActive[c] = 0;
    }
    SpeechBox.Ready = true;
}else{

    Speechbox = instance_create(0,view_hport-360,oTextbox);
    Speechbox.Owner = id;
    var b;
    b = 0;
    repeat(MessageCount){
        Speechbox.Messages[b] = 0;
        b += 1;
    }
    
    var i;
    i = 0;
    repeat(MessageCount){
        Speechbox.Messages[i] = CurrentMessage[i];
        i += 1;
    }
    
    Speechbox.MessageEnd = array_length_1d(Speechbox.Messages);
    
    Speechbox.MessageLength = string_length(Speechbox.Messages[0]);
    
    Speechbox.Ready = true; 
}
