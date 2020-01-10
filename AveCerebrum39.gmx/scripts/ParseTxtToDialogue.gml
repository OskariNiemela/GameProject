///ParseTxtToDialogue(file);

file = argument0;
file += ".txt";
file = "Dialogue\"+file;

textu = file_exists(file);



if !file_exists(file)
{
    error_message = object_get_name(id);
    error_message += " UR TEXT AINT FOUIND VOBIIIIIIIIIII";
    show_error(error_message,true);
    return false;
}
Textlist = ds_list_create();
Text = file_text_open_read(file);
line = file_text_read_string(Text);

while(line!="%")
{
    //MAKE TEMPORARY VARIABLES
    var TextType, TextSpeed, Effect, TextArray, LineNumber,TextFont,EffectArray,at;
    TextArray = noone;
    at = noone;
    TextType = noone;
    Effect = noone;
    EffectArray = noone;
    LineNumber = noone;
    TextFont = noone;
    
    //GO THROUGH ANY POSSIBLE EMPTY LINES TO FIND THE RELEVANT INFO
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    TextType = line;
    
    //FIGURE OUT THE TEXT TYPE OF THIS SHITE
    if(TextType=="T")
    {
        TextArray[0,0] = TextTypes.text;
    }
    else if(TextType=="D")
    {   
        TextArray[0,0] = TextTypes.dialogue;
    }
    else if(TextType=="Desc")
    {
        TextArray[0,0] = TextTypes.description;
    }
    
    file_text_readln(Text);
    
    line = file_text_read_string(Text);
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    TextFont = line;
    
    if(TextFont == "def")
    {
        TextArray[0,1] = fDefault;
    }
    else
    {
        
        //TO DO: MAKE MAP OF TEXTFONTS SO THEY CAN BE ACCESSED VIA THE TEXT FILE
        TextArray[0,1] = fDefault;
    }
    
    file_text_readln(Text);
    line = file_text_read_string(Text);
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    
    TextSpeed = real(line);
    
    //GET THE TEXT SPEED 0=DEFAULT
    if(TextSpeed==0)
    {
        TextArray[0,2] = DEFAULTTEXTSPEED;
    }
    else
    {
        TextArray[0,2] = TextSpeed*DELTA_TIME;
    }
    
    file_text_readln(Text);
    line = file_text_read_string(Text);
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    
    //FIGUYR OUT IF THERE IS ANY EFFECT 0=NO EFFECT, 1=THERE IS EFFECT
    Effect = real(line);
    
    if(Effect)
    {
        TextArray[1,0] = true;
        
        file_text_readln(Text);
        //Get the effect;
        Effect = file_text_read_string(Text);
        
        TextArray[1,1] = ds_map_find_value(global.textEffectsMap,Effect);
        
        if(is_undefined(TextArray[1,1]))
        {
            TextArray[1,0] = false;
        }
        else
        {   
            at = 0;
            file_text_readln(Text);
            line = file_text_read_string(Text);
            while(line!="*")
            {
                EffectArray[at] = real(line);
                file_text_readln(Text);
                line = file_text_read_string(Text);
                at++;
            }
            TextArray[1,2] = EffectArray;
        }

        
    }
    else
    {
        TextArray[1,0] = false;
    }
    
    
    
    file_text_readln(Text);
    //BUILD THE ACTUAL FOOKING TEXT LINES NOW
    line = file_text_read_string(Text);
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    
    //IF THE TEXT IS MEANT TO BE JUST TEXT OR A DESCRIPTION
    if(TextArray[0,0] == TextTypes.text or TextArray[0,0] == TextTypes.description)
    {
        var currentLine;
        currentLine = 0;
        //# denotes when this text is finished so we can move on and see if there are different types of texts
        while(line!="#")
        {
            //- indicates to put an end point on this text
            if(line =="-")
            {
                TextArray[2,currentLine] = 0;
            }
            else
            {
                TextArray[2,currentLine] = line;
            }
            currentLine+=1;
            file_text_readln(Text);
            line = file_text_read_string(Text);
        }
        file_text_readln(Text);
        line = file_text_read_string(Text);
        ds_list_add(Textlist,TextArray);
    }
    //IF THE TEXT IS DIALOGUE
    else
    {
        var dialogue, options, lineNumber,textNumber;
        lineNumber = 0;
        
        //Parse the text choices
        //= indicates that the text portion of the dialogue is finished parsing, so we can move on to options
        while(line!="=")
        {
            textNumber = 0;
            //- indicates a split in the line
            while(line!="-")
            {
            // 1 indicates that after this line of text we need to present the option
                if(line=="1")
                {
                    dialogue[lineNumber,textNumber] = 1;
                }
                else
                {
                    dialogue[lineNumber,textNumber] = line;
                }
                
                file_text_readln(Text);
                line = file_text_read_string(Text);
                textNumber += 1;
            }
            dialogue[lineNumber,textNumber] = 0;
            file_text_readln(Text);
            line = file_text_read_string(Text);
            lineNumber+=1;
        }
        TextArray[2,0] = dialogue;
        
        lineNumber = 0;
        //Parse the options
        file_text_readln(Text);
        line = file_text_read_string(Text);
        while(line!="#")
        {
        // What the option should say
        // what line of text to jump to if the option is selected
            options[lineNumber,0] = line;
            file_text_readln(Text);
            line = file_text_read_string(Text);
            options[lineNumber,1] = real(line);
            lineNumber+=1;
            file_text_readln(Text);
            line = file_text_read_string(Text);
        }
        TextArray[3,0] = options
        ds_list_add(Textlist,TextArray);
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
    
    while(line=="")
    {
        file_text_readln(Text);
        line = file_text_read_string(Text);
    }
}
file_text_close(Text);
return true;
