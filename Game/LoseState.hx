package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class LoseState extends FlxState
{
    private var timeSurvived:Float;

    public function new(timeSurvived:Float)
    {
        super();
        this.timeSurvived = Math.round(timeSurvived);
    }

    override public function create():Void
    {
        super.create();

        // Display "Game Over" text
        var gameOverText:FlxText = new FlxText(0, FlxG.height / 2 - 40, FlxG.width, "Game Over");
        gameOverText.setFormat(null, 32, 0xFF0000, "center");
        add(gameOverText);

        // Display time survived
        var timeText:FlxText = new FlxText(0, FlxG.height / 2, FlxG.width, "Time Survived: " + Std.string(timeSurvived) + " seconds");
        timeText.setFormat(null, 16, 0xFFFFFF, "center");
        add(timeText);

        // Add a button to go back to the menu
        var menuButton:FlxButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2 + 40, "Menu", onMenu);
        add(menuButton);
    }

    private function onMenu():Void
    {
        FlxG.switchState(new MenuState());
    }
}
