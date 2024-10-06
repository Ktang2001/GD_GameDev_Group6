package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import Asteriod.Asteroid;

class PlayState extends FlxState
{
    private var player:Player;
    private var projectiles:FlxGroup;
    private var asteroids:FlxGroup;
    private var background:FlxSprite;
    private var elapsedTime:Float = 0;
    private var projectileSpeed:Float = -200; 
    private var timerText:FlxText;

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

        asteroids = new FlxGroup();
        add(asteroids);

        // Spawn projectiles
        new FlxTimer().start(1, spawnProjectile, 0);

        // Spawn asteroids
        new FlxTimer().start(2, spawnAsteroid, 0);

        // Record the start time
        elapsedTime = 0;

        timerText = new FlxText(0, 10, FlxG.width, "Time: 0");
        timerText.setFormat(null, 16, 0xFFFFFF, "center");
        add(timerText);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        // Update the elapsed time
        elapsedTime += elapsed;

        timerText.text = "Time: " + Math.round(elapsedTime);

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
        FlxG.overlap(player, asteroids, onCollision);
    }

    private function spawnProjectile(timer:FlxTimer):Void
    {
        var projectile:Projectile = new Projectile(FlxG.width, FlxG.random.int(0, FlxG.height - 20), 10, 2);
        projectile.velocity.x = projectileSpeed; 
        projectiles.add(projectile);
    }

    private function spawnAsteroid(timer:FlxTimer):Void
    {
        var asteroid:Asteroid = new Asteroid(FlxG.width, FlxG.random.int(0, FlxG.height - 40), "assets/images/AstroidImage.png");
        asteroids.add(asteroid);
    }

    private function onCollision(player:Player, obstacle:FlxSprite):Void
    {
        
        FlxG.switchState(new LoseState(elapsedTime));
    }
}
