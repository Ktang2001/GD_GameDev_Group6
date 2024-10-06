package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;
import flixel.FlxSprite;

class MenuState extends FlxState
{
    private var startButton:FlxButton;
    private var characterImages:Array<FlxSprite>;
    private var selectedCharacter:Int = 0;
    private var background:FlxSprite;
    private var player:Player;

    override public function create():Void
    {
        super.create();

        // Add scrolling background using a custom image from photoshop
        background = new FlxSprite(0, 0, "assets/images/Background.png");
        background.scrollFactor.set(0.5, 0.5);
        add(background);

        var titleLabel:FlxText = new FlxText(400, 0, FlxG.width, "Title"); // Sets the positon and string of the title so it at the center and top.
        titleLabel.setFormat(null, 20, 0x0000FF); // sets the title to the size of 20 and the color Blue
        add(titleLabel);


        // Add character images
        characterImages = [
            // the Paramerters that are modifable for these lines of code are  here are the x and y pos 
            new FlxSprite(100, 200, "assets/images/ball_2.png"), 
            new FlxSprite(300, 200, "assets/images/ball_4.png"),
            new FlxSprite(500, 200, "assets/images/ball_16.png")
        ];
        for (character in characterImages)
        {
            add(character); // Displays the character images for the user to choose between
        }

        // Highlight the selected character
        highlightSelectedCharacter();

        //Start button incase they settle on default character
        startButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height - 100, "Start", onStart);
        add(startButton);

        // Add instruction labels for the users 
        var instructions:FlxText = new FlxText(0, FlxG.height - 50, FlxG.width, "Use arrow keys or mouse to select a character and press Start");
        instructions.setFormat(null, 16, 0xFFFFFF, "center");
        add(instructions);

        // Sets the selected image as the character image
        player = new Player(0, 0, characterImages[selectedCharacter].graphic.key);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Scrolling the background
        background.x -= 1;
        if (background.x <= -background.width)
        {
            background.x = 0;
        }

        // Handle arrow key inputs to select character
        if (FlxG.keys.justPressed.LEFT)
        {
            // Leeft arrow logic 
            selectedCharacter = (selectedCharacter - 1 + characterImages.length) % characterImages.length;
            highlightSelectedCharacter();
        }
        else if (FlxG.keys.justPressed.RIGHT)
        {
            // Right arrow logic 
            selectedCharacter = (selectedCharacter + 1) % characterImages.length;
            highlightSelectedCharacter();
        }
        else if (FlxG.keys.justPressed.ENTER || FlxG.mouse.justPressed)
        {
            // defult lofic
            onStart();
        }
    }


    // This fucntion is ment to indicate that a image is selected 
    private function highlightSelectedCharacter():Void
    {
        for (i in 0...characterImages.length)
        {
            characterImages[i].alpha = (i == selectedCharacter) ? 1.0 : 0.5;
        }
    }

    private function onStart():Void
    {
       
        player.setImage(characterImages[selectedCharacter].graphic.key);

        // Start Game after selection of the Character Image and makes sure to include the player with the image path chossen
        FlxG.switchState(new PlayState(player));
    }
}
