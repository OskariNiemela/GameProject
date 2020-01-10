Text = argument0;


switch Text[0,0] 
{
    case TextTypes.text:
        box =instance_create(0,0,oTextbox);
        box.Owner = id;
        box.Ready = true;
        box.textSound = textSound;
        box.Messages = Text;
        box.textPortrait = textPortrait;
        box.Increase = Text[0,2];
        draw_set_font(Text[0,1]);
        box.MessageLength = string_length(Text[2,0]);
    break;
    
    case TextTypes.dialogue:
        box =instance_create(0,0,oDialogue);
        box.OptionsAmount = array_height_2d(Text[3,0]);
        box.Increase = Text[0,2];
        box.font = Text[0,1];
        box.textPortrait = textPortrait;
        box.Messages = Text[2,0];
        box.OptionsSelect = Text[3,0];
        box.Owner = id;
        box.textSound = textSound;
        box.Ready = true;
    break;
    
    case TextTypes.description:
        box =instance_create(0,0,oDescriptionText);
        box.Owner = id;
        box.textSound = textSound;
        box.Messages = Textbox;
        box.MessageEnd = array_length_1d(Textbox);
    break;
}
