package thorn;
import openfl.Lib;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Sprite;
import openfl.display.DisplayObject;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.geom.Matrix;
import openfl.geom.Point;

import thorn.video.SimpleVideoPlayer;
import thorn.sound.SoundController;
import thorn.visual.Dragon;
import thorn.visual.Bat;
import thorn.visual.Tiny;
import thorn.visual.TestButton;
import thorn.interaction.KeyboardInteraction;
import thorn.visual.Background;
import thorn.visual.Foreground;
import thorn.visual.BottomButtons;
import thorn.pathway.SvgToSegment;
import trilateral.justPath.SvgPath;
import thorn.visual.State;
import thorn.visual.SelectionElement;

class Main extends Sprite {
    var dMove = 4;
    var dragon: Dragon;
    var bat: Bat;
    var tiny: Tiny;
    var isUp: Bool;
    var background: Background;
    var foreground: Foreground;
    var soundController: SoundController;
    var keyboardInteraction: KeyboardInteraction;
    public function new () {
        super ();
        createScene();
        keyboardInteraction        = new KeyboardInteraction();
        keyboardInteraction.update = update;
        addEventListener( Event.ENTER_FRAME, this_onEnterFrame );
        addEventListener( MouseEvent.MOUSE_DOWN, down );
        addEventListener( MouseEvent.MOUSE_UP, up );
        addEventListener( MouseEvent.MOUSE_MOVE, move );
        new BottomButtons( this );
    }
    function down( e: MouseEvent ){
        var mouseX = stage.mouseX;
        var mouseY = stage.mouseY;
        dragon.down( mouseX, mouseY );
        if( bat.down( mouseX, mouseY ) ) bat.position( mouseX, mouseY );
        bat.down(    mouseX, mouseY );
        tiny.down(   mouseX, mouseY );
        isUp = false;
    }
    function move( e: MouseEvent ){
        var mouseX = stage.mouseX;
        var mouseY = stage.mouseY;
        if( !isUp ) bat.position( mouseX, mouseY );
    }
    function up( e: MouseEvent ){
        isUp = true;
    }
    function createScene(){
        background = new Background( this );
        dragon     = new Dragon( cast this );
        bat        = new Bat( this );
        tiny       = new Tiny( this );
        foreground = new Foreground( this );
    }
    function this_onEnterFrame( event: Event ): Void {
        var currentTime = Lib.getTimer();
        var current     = Lib.current;
        var stage = current.stage;
        //tiny.position( stage.mouseX - tiny.holder.width/2, stage.mouseY - tiny.holder.height/2 );
        dragon.update();
        var mouseX = stage.mouseX;
        var mouseY = stage.mouseY;
        dragon.over( mouseX, mouseY );
        bat.over(    mouseX, mouseY );
        tiny.over(   mouseX, mouseY );
    }
    inline
    function update(): Void {
        if( keyboardInteraction.upDown ){
            bat.move( 0, -dMove );
            //tiny.move( 0, -2 );
        } else if( keyboardInteraction.downDown ){
            bat.move( 0, dMove );
            //tiny.move( 0, 2 );
        }
        if( keyboardInteraction.leftDown ) {
            bat.move( -dMove, 0 );
            background.move( dMove, 0 );
            foreground.move( dMove, 0 );

            //tiny.move( -2, 0 );
        } else if( keyboardInteraction.rightDown ) {
            bat.move( dMove, 0 );
            background.move( -dMove, 0 );
            foreground.move( -dMove, 0 );
            //tiny.move( 2, 0 );
        }
        //hitDragon( bat.holder.x, bat.holder.y );
        keyboardInteraction.resetArrows();
    }
}