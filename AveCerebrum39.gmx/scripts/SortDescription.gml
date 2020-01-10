///SortDescription(desc);

desc = argument0;

for(a = 0;a<3;a++)
{
    textLine[| a] = "";
}


var stringWidth,lineNumber, at, word, line;
at = 0;
lineNumber = 0;
stringWidth = string_width(desc);
line = "";

// Find the first space " " in the string , this will be the length of our word, if the length is 0 then theres two spaces
// so well just start searching for a new one immediately

while(stringWidth>0)
{
    at = string_pos(" ",desc);
    if at = 0
    {
        word = desc;
        desc = "";
    }
    else
    {
        word = string_copy(desc,0,at);
        desc = string_copy(desc,at+1,string_length(desc)-at);
    }
    
    stringWidth = string_width(desc);
    
    
    if((string_width(line)+string_width(word))<= textMaxWidth)
    {
        line += word;
    }
    else
    {
        var boi;
        boi = line;
        textLine[| lineNumber] = boi;
        lineNumber++;
        line = word;
    }
}

textLine[| lineNumber] = line;
