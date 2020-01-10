Textlist = ds_list_create();

var Text, Dialogue;
Text[0,0] = TextTypes.dialogue;
Text[0,1] = fDefault;
Text[0,2] = DEFAULTTEXTSPEED;
Text[1,0] = false;


Dialogue[0,0] = "Do you wish to save the game?";
Dialogue[0,1] = 1;
Dialogue[1,0] = "Game Saved";
Dialogue[1,1] = 0;
Dialogue[2,0] = "Goodbye";
Dialogue[2,1] = 0;

Options[0,0] = "Yes";
Options[0,1] = 1;
Options[1,0] = "No";
Options[1,1] = 2;

for(i=0;i<array_height_2d(Options);i++)
{
    DialogueChoices[i,0] = noone;
    DialogueChoices[i,1] = noone;
}
Text[2,0] = Dialogue;
Text[3,0] = Options;

ds_list_add(Textlist,Text);

var Text1;
Text1[0,0] = TextTypes.text;
Text1[0,1] = fDefault;
Text1[0,2] = DEFAULTTEXTSPEED;
Text1[1,0] = false;
Text1[2,0] = "For";
Text1[2,1] = "Boi";
Text1[2,2] = 0;

ds_list_add(Textlist,Text1);
