package;

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
    private var elapsedTime:Float = 0;
    private var projectileSpeed:Float = -200; // Projectile Speed


    // This fucntion is ment to allow the player class initated in the menustate to transfer the play state.
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

        // Add player to the screen
        player.x = 50;
        player.y = FlxG.height / 2;
        add(player);

        projectiles = new FlxGroup();
        add(projectiles);

        // Spawn projectiles
        new FlxTimer().start(1, spawnProjectile, 0);

        // Record the start time
        elapsedTime = 0;
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Update the elapsed time
        elapsedTime += elapsed;

        // Increase projectile speed over time
        projectileSpeed -= elapsed * 10; 

        // Scroll the background
        background.x -= 1;
        if (background.x <= -background.width)
        {
            background.x = 0;
        }

        // Collision checks
        FlxG.overlap(player, projectiles, onCollision);
    }


    // The fucntion below randomly spwans projectiles for the player to avoid
    private function spawnProjectile(timer:FlxTimer):Void
    {
        var projectile:Projectile = new Projectile(FlxG.width, FlxG.random.int(0, FlxG.height - 20), 10, 2);
        projectile.velocity.x = projectileSpeed; 
        projectiles.add(projectile);
    }

    private function onCollision(player:Player, obstacle:FlxSprite):Void
    {
        // Switch to the lose state and pass the time survived to be displayed
        FlxG.switchState(new LoseState(elapsedTime));
    }
}
