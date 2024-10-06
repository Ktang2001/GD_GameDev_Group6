package;

import flixel.FlxSprite;
import flixel.FlxG; 

class Player extends FlxSprite
{
    public var gravity:Float = 400;
    public var flapPower:Float = -200;

    public function new(x:Float, y:Float, imagePath:String)
    {
        super(x, y, imagePath);
        acceleration.y = gravity;
    }

    public function setImage(imagePath:String):Void
    {
        loadGraphic(imagePath);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Space key will cause the player to increase in altitude
        if (FlxG.keys.justPressed.SPACE)
        {
            velocity.y = flapPower;
        }
    }
}
