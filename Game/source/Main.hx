package;


/* Group 6 Project 1
Group Members: Kaleb Tangen, 
Name of the Game: 

*/
import flixel.FlxGame;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, PlayState));
	}
}


/* Sources


 */
