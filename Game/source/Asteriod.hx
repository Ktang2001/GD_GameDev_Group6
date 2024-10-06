package;

import flixel.FlxSprite;

class Asteroid extends FlxSprite
{
    public var speed:Float = -150; // Constant speed of asteroids

    public function new(x:Float, y:Float, imagePath:String)
    {
        super(x, y);
        loadGraphic(imagePath);
        velocity.x = speed;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Destroy the asteroid if it goes off-screen
        if (x + width < 0)
        {
            kill();
        }
    }
}
