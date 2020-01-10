///EventTextInput(Index);

Index = argument0;

Speechbox = instance_create(0,view_hport-360,oEventText);
Speechbox.Owner = oPlayerWorld;
Speechbox.EventManager = id;

Speechbox.Messages[0] = 0;

Speechbox.Messages[0] = DialogueToDo[Index];


Speechbox.MessageEnd = array_length_1d(Speechbox.Messages);

Speechbox.MessageLength = string_length(Speechbox.Messages[0]);

Speechbox.Ready = true; 
