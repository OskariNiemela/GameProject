///FadingTransitionFromRoomToRoom(RoomToGoTo,XCoordinate,YCoordinate,CutOffSound,ContinueMusic);

//The room we're going in
RoomToGoTo = argument0;
//The x position we will spawn the player in
XCoordinate = argument1;
//The y position we will spawn the player in
YCoordinate = argument2;

CutOffSound = argument3;
ContinueMusic = argument4;

oGame.State = "FadingOut";
oGame.RoomToFadeTo = RoomToGoTo;
oGame.OverworldPosX = XCoordinate;
oGame.OverworldPosY = YCoordinate;
oGame.SoundCutOff = CutOffSound;
oGame.ContinueMusic = ContinueMusic;
if instance_exists(oPlayerWorld){
    var Sprite;
    Sprite = oPlayerWorld.sprite_index;
    switch Sprite{
        case sPlayer64Right:
        case sPlayer64RightIdle:
            oGame.PlayerSprite = sPlayer64RightIdle;
        break;
    
        case sPlayer64Left:
        case sPlayer64LeftIdle:
            oGame.PlayerSprite = sPlayer64LeftIdle;
        break;
        
        case sPlayer64Up:
        case sPlayer64UpIdle:
            oGame.PlayerSprite = sPlayer64UpIdle;
        break;
        
        case sPlayer64Down:
        case sPlayer64DownIdle:
            oGame.PlayerSprite = sPlayer64DownIdle;
        break;
        
        default:
            oGame.PlayerSprite = sPlayer64RightIdle;
        break;
    }

}
