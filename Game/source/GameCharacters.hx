package;

import flixel.util.FlxColor;

class CircleCharacter extends Character
{
    public function new(x:Float, y:Float)
    {
        super(x, y, FlxColor.RED, "Circle", 100, 5.0);
    }
}

class SquareCharacter extends Character
{
    public function new(x:Float, y:Float)
    {
        super(x, y, FlxColor.GREEN, "Square", 120, 4.5);
    }
}

class TriangleCharacter extends Character
{
    public function new(x:Float, y:Float)
    {
        super(x, y, FlxColor.BLUE, "Triangle", 80, 6.0);
    }
}
