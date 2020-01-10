window_set_fullscreen(false);

//How big is the screen
global.ScreenWidth = display_get_width();
global.ScreenHeight = display_get_height();

//How much of the screen do we want on screen
view_wview[0] = 1280;
view_hview[0] = 720;

//How much of our screen do we want that to take up
view_hport[0] = 1360;
view_wport[0] = 768;

//Gamemaker Stuff
surface_resize(application_surface,view_wview[0],view_hview[0]);
