package;

import flixel.FlxSprite;

class Projectile extends FlxSprite
{
    public var speed:Float = -200;

    public function new(x:Float, y:Float, width:Int, height:Int) 
    {
        super(x, y);
        makeGraphic(width, height, 0xFF0000FF); 
        velocity.x = speed;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        
        if (x + width < 0)
        {
            kill();
        }
    }
}
