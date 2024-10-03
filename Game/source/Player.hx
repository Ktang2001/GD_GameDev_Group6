package;

import flixel.FlxSprite;

/*The only thing i have done on this class is make it to where the player can take in a image that is selected 
  we can add more logic as needed for the player class in the game.
*/ 

class Player extends FlxSprite
{
    public function new(x:Float, y:Float, imagePath:String)
    {
        super(x, y, imagePath);
    }

    public function setImage(imagePath:String):Void
    {
        loadGraphic(imagePath);
    }
}
