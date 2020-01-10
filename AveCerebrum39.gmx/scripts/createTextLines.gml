TextLineOne  = "";
TextLineTwo  = "";
TextLineThree= "";

CharactersNow = 0;
TotalCharacters = 0; 
lineOne = "";
lineTwo = "";
lineThree = "";
var rdy, characterLength, count, word;
count = 0;
rdy = true;
characterLength = 0;
emptyWidth = string_width(" ");

while(rdy and wordIndex<array_length_1d(lineSplit))
{
   switch count
   {
        //Construct line one BITHC
        case 0:
            word = lineSplit[wordIndex];
            if((characterLength+string_width(" ")+string_width(word))<=TextMaxWidth)
            {
                if characterLength > 0
                {
                    lineOne = lineOne + " " + word;
                }
                else
                {
                    lineOne += word;
                }
                
                characterLength = characterLength+string_width(word)+string_width(" ");
                wordIndex++;
            }
            else
            {
                characterLength = string_width(word);
                lineTwo += word;
                count = 1;
                wordIndex++;
            }
            
        break;
        
        case 1:
            word = lineSplit[wordIndex];
            if((characterLength+string_width(" ")+string_width(word))<=TextMaxWidth)
            {
                if characterLength > 0
                {
                    lineTwo = lineTwo + " " + word;
                }
                else
                {
                    lineTwo += word;
                }

                characterLength = characterLength+string_width(word)+string_width(" ");
                wordIndex++;
            }
            else
            {
                characterLength = string_width(word);
                lineThree += word;
                count = 2;
                wordIndex++;
            }
        break;
        
        case 2:
            word = lineSplit[wordIndex];
            if((characterLength+string_width(" ")+string_width(word))<=TextMaxWidth)
            {
                if characterLength > 0
                {
                    lineThree = lineThree + " " + word;
                }
                else
                {
                    lineThree += word;
                }
                characterLength = characterLength+string_width(word)+string_width(" ");
                wordIndex++;
            }
            else
            {
                rdy = false;
            }
        break;
        
        default:
            rdy = false;
        break;
        
   }

}

