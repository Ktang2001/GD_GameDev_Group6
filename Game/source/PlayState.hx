package;

// Imports for the game logic to work 

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxTimer; 

class PlayState extends FlxState
{
    private var player:Player;
    private var projectiles:FlxGroup;
    private var background:FlxSprite;

    // Allows us to use the player initalized in the menustate 
    public function new(player:Player)
    {
        super();
        this.player = player;
    }

    override public function create():Void
    {
        super.create();

        // Add scrolling background image
        background = new FlxSprite(0, 0, "assets/images/Background.png");
        background.scrollFactor.set(0.5, 0.5);
        add(background);

        // Add player
        player.x = 50;
        player.y = FlxG.height / 2;
        add(player);

        
        projectiles = new FlxGroup();
        add(projectiles);

        // Spawn projectiles periodically using FlxTimer
        new FlxTimer().start(1, spawnProjectile, 0); 
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Scroll the background
        background.x -= 1;
        if (background.x <= -background.width)
        {
            background.x = 0;
        }

        // Collision checks 
        FlxG.overlap(player, projectiles, onCollision);
    }

    // This fucniton will ransomly spaan projectiltes 
    private function spawnProjectile(timer:FlxTimer):Void
    {
        var projectile:Projectile = new Projectile(FlxG.width, FlxG.random.int(0, FlxG.height - 20), 10, 2); 
        projectiles.add(projectile);
    }

    private function onCollision(player:Player, projectile:Projectile):Void
    {
        // Handles loose state
        FlxG.switchState(new MenuState());
    }
}
