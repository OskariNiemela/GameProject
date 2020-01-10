lineMess = argument0;

lineSplit = noone;


var pos,at, getto;
getto = lineMess;
at = 0;
pos = string_pos(" ", getto)
while(string_pos(" ", getto)!=0)
{
    lineSplit[at] = string_copy(getto,0,pos-1);
    getto = string_copy(getto,pos+1,string_length(getto));
    at++;
    pos = string_pos(" ", getto)
}
lineSplit[at] = getto;

