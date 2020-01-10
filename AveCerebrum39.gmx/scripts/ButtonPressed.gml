///ButtonCreation(Text)
ButtonText = argument0

Result = false

BoxTop = CurrentY
TextTop = BoxTop + Margin
BoxBottom = TextTop + string_height(ButtonText) + Margin
HalfTextWidth = string_width(ButtonText)/2

BoxLeft = x - HalfTextWidth - Margin
BoxRight = x + HalfTextWidth + Margin

draw_set_colour(make_colour_hsv(0,200,128))

if device_mouse_x_to_gui(0) > BoxLeft and device_mouse_x_to_gui(0) < BoxRight and device_mouse_y_to_gui(0) > BoxTop and device_mouse_y_to_gui(0) < BoxBottom{
    draw_set_alpha(1)
    if mouse_check_button_pressed(mb_left){
        Result = true}
}else{ draw_set_alpha(0.5)}
draw_rectangle(BoxLeft,BoxTop,BoxRight,BoxBottom,false)
draw_set_alpha(1)

draw_set_colour(c_white)

CurrentY = TextTop

draw_text(BoxLeft+Margin,CurrentY,ButtonText)

CurrentY = CurrentY + string_height(TextToDraw) + Margin

CurrentY = CurrentY + Margin


return Result
