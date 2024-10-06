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

       // Bondary Checks
        if (x < 0)
        {
            x = 0;
        }
        else if (x + width > FlxG.width)
        {
            x = FlxG.width - width;
        }

        if (y < 0)
        {
            y = 0;
        }
        else if (y + height > FlxG.height)
        {
            y = FlxG.height - height;
        }
    }
}
