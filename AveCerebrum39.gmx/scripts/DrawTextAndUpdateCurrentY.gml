///DrawTextAndUpdateCurrentY(Sprite,Active)


TextToDraw = argument0;
Active = argument1;
draw_sprite_ext(TextToDraw,Active,x,CurrentY,1,1,0,c_white,1);

CurrentY = CurrentY + sprite_get_height(TextToDraw) + Margin
