package;
import openfl.Lib;
import openfl.events.Event;
import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Matrix;
import openfl.geom.Point;
import video.SimpleVideoPlayer;
import sound.SoundController;
import visual.Dragon;
import visual.Bat;
import visual.Tiny;
import visual.TestButton;
import interaction.KeyboardInteraction;
import visual.Background;
import visual.Foreground;
class Main extends Sprite {
    var dragon: Dragon;
    var bat: Bat;
    var tiny: Tiny;
    var background: Background;
    var foreground: Foreground;
    var soundController: SoundController;
    var keyboardInteraction: KeyboardInteraction;
    public function new () {
        super ();
        createBackground();
        createMonsters();
        createForeground();
        keyboardInteraction = new KeyboardInteraction();
        keyboardInteraction.update = update;
        addEventListener( Event.ENTER_FRAME, this_onEnterFrame );
        //drawButton( 50, 50, 0x00FF00 );
    }
    function createBackground(){
        background = new Background( this );
    }
    function createForeground(){
        foreground = new Foreground( this );
    }
    function createMonsters(){
        dragon = new Dragon( cast this );
        bat    = new Bat( this );
        tiny   = new Tiny( bat.holder );
    }
    function hitDragon( x: Float, y: Float ): Bool {
        var over = simpleHit( dragon.holder, new Point( x, y ) );//pixelPerfectHitTest( dragon.holder, new Point( x, y ) );
        if( over ){
            dragon.holder.alpha = 0.5;
            //dragon.updateState( OVER );
        } else {
            dragon.holder.alpha = 1;
            //dragon.updateState( OUT );
        }
        return over;
    }
    function drawButton( x: Float, y: Float, c: Int ){
        var testButton: TestButton = new TestButton( this, x, y, c );
        testButton.buttonDown = playMusic;
    }
    function playMusic(){
        soundController = new SoundController();
        soundController.playTiny();
    }
    function this_onEnterFrame( event: Event ): Void {
        var currentTime = Lib.getTimer();
        var current = Lib.current;
        var stage = current.stage;
        tiny.position( stage.mouseX - tiny.holder.width/2, stage.mouseY - tiny.holder.height/2 );
        trace( hitDragon( stage.mouseX, stage.mouseY ) );
        dragon.update();
    }
    inline
    function update(): Void {
        if( keyboardInteraction.upDown ){
            bat.move( 0, -4 );
            
            //tiny.move( 0, -2 );
        } else if( keyboardInteraction.downDown ){
            bat.move( 0, 4 );
            
            //tiny.move( 0, 2 );
        }
        if( keyboardInteraction.leftDown ) {
            bat.move( -4, 0 );
            background.move( 4, 0 );
            foreground.move( 4, 0 );

            //tiny.move( -2, 0 );
        } else if( keyboardInteraction.rightDown ) {
            bat.move( 4, 0 );
            background.move( -4, 0 );
            foreground.move( -4, 0 );
            //tiny.move( 2, 0 );
        }
        //hitDragon( bat.holder.x, bat.holder.y );
        keyboardInteraction.resetArrows();
    }
    public static function simpleHit( object: DisplayObject, point: Point ): Bool {
        return object.hitTestPoint(point.x, point.y, true);
    }
    
    // way too much overhead and not working with scale?
	public static function pixelPerfectHitTest( object: DisplayObject, point: Point ):Bool {
		/* If we're already dealing with a BitmapData object then we just use the hitTest
		 * method of that BitmapData.
		 */
		if(Std.is(object,Bitmap)) {
			return cast(object,Bitmap).bitmapData.hitTest(new Point(0,0), 0, object.globalToLocal(point));
		}
		else
		{
				
			/* First we check if the hitTestPoint method returns false. If it does, that
			 * means that we definitely do not have a hit, so we return false. But if this
			 * returns true, we still don't know 100% that we have a hit because it might
			 * be a transparent part of the image. 
			 */
			if(!object.hitTestPoint(point.x, point.y, true)) {
				return false;
			}
			else {
				/* So now we make a new BitmapData object and draw the pixels of our object
				 * in there. Then we use the hitTest method of that BitmapData object to
				 * really find out of we have a hit or not.
				 */
				var bmapData:BitmapData = new BitmapData(Std.int(object.width), Std.int(object.height), true, 0x00000000);
				bmapData.draw(object, new Matrix());
				
				var returnVal:Bool = bmapData.hitTest(new Point(0,0), 0, object.globalToLocal(point));
				
				bmapData.dispose();
				
				return returnVal;
			}
		}
	}

    
    
}