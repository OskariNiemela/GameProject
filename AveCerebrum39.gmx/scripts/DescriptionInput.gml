///TextBoxInput(MessageCount);
    
MessageCount = argument0;


Speechbox = instance_create(0,view_hport-360,oDescriptionText);
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
