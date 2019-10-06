package thorn;
import openfl.Lib;
import openfl.events.Event;
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

import thorn.pathway.SvgToSegment;
import trilateral.justPath.SvgPath;

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
        createButtons();
    }
    function createButtons(){
        var colors = [ 
                0xFF99d8c9
                , 0xFF66c2a4
                , 0xFF41ae76
                
                , 0xFFbfd3e6
                , 0xFF9ebcda
                , 0xFF8c96c6
                , 0xFF8c6bb1
                , 0xFF88419d
                
                , 0xFFf7fcf0
                , 0xFFe0f3db
                , 0xFFccebc5
                , 0xFFa8ddb5
                , 0xFF7bccc4
                
                , 0xFF4eb3d3
                , 0xFF2b8cbe
                
                , 0xFFfff7ec
                , 0xFFfee8c8
                , 0xFFfdd49e
                , 0xFFfdbb84
                , 0xFFfc8d59
                , 0xFFef6548
                , 0xFFd7301f
                , 0xFFb30000
                , 0xFF7f0000
                , 0xFFfff7fb
                , 0xFFece7f2
                , 0xFFd0d1e6
                , 0xFFa6bddb
                , 0xFF74a9cf
                , 0xFF3690c0
                , 0xFF0570b0
                , 0xFF045a8d
                , 0xFF023858
                , 0xFFfff7fb
                , 0xFFece2f0
                , 0xFFd0d1e6
                , 0xFFa6bddb
                , 0xFF67a9cf
                , 0xFF3690c0
                , 0xFF02818a
                , 0xFF016c59
                , 0xFF014636
                , 0xFFf7f4f9
                , 0xFFe7e1ef
                , 0xFFd4b9da
                , 0xFFc994c7
                , 0xFFdf65b0
                , 0xFFe7298a
                , 0xFFce1256
                , 0xFF980043
                , 0xFF67001f
                , 0xFFfff7f3
                , 0xFFfde0dd
                , 0xFFfcc5c0
                , 0xFFfa9fb5
                , 0xFFf768a1
                , 0xFFdd3497
                , 0xFFae017e
                , 0xFF7a0177
                , 0xFF49006a
                , 0xFFffffe5
                , 0xFFf7fcb9
                , 0xFFd9f0a3
                , 0xFFaddd8e
                , 0xFF78c679
                , 0xFF41ab5d
                , 0xFF238443
                , 0xFF006837
                , 0xFF004529
                , 0xFFffffd9
                , 0xFFedf8b1
                , 0xFFc7e9b4
                , 0xFF7fcdbb
                , 0xFF41b6c4
                , 0xFF1d91c0
                , 0xFF225ea8
                , 0xFF253494
                , 0xFF081d58
                , 0xFFffffe5
                , 0xFFfff7bc
                , 0xFFfee391
                , 0xFFfec44f
                , 0xFFfe9929
                , 0xFFec7014
                , 0xFFcc4c02
                , 0xFF993404
                , 0xFF662506
                , 0xFFffffcc
                , 0xFFffeda0
                , 0xFFfed976
                , 0xFFfeb24c
                , 0xFFfd8d3c
                , 0xFFfc4e2a
                , 0xFFe31a1c
                , 0xFFbd0026
                , 0xFF800026
                 ];
       var snd = [   glider1
                   , glider2
                   , glider3
                   , tinyGrunt1
                   , tinyGrunt2
                   , tinyGrunt3
                   , tinyGrunt4 
                   , tinyGrunt5
                   , tinyHappy1
                   , tinyHappy2
                   , tinyHappy3
                   , tinyHappy4
                   , tinyHappy5
                   , dragonGrunt1
                   , dragonGrunt2
                   , dragonFoot1
                   , dragonFoot2
                   , dragonFoot3
                   , dragonFoot4
                   , dragonFont5
                   , ambient
                   ];
        var space = 0;
        var jump = 22;
        for( j in 0...colors.length ){
            if( j == 3 ) space+= jump;
            if( j == 3 + 5 ) space += jump;
            if( j == 3 + 5 + 5 ) space += jump;
            if( j == 3 + 5 + 5 + 2 ) space += jump;
            if( j == 3 + 5 + 5 + 2 + 5  ) space += jump;
            if( j == 3 + 5 + 5 + 2 + 5 + 1 ) space += jump + jump;
            var b = drawButton(10 + 25*j + space, 10, 16, 16, colors[j] );
            b.buttonDown = playMusic.bind( snd[j] );
        }
    }
    function createBackground() background = new Background( this );
    function createForeground() foreground = new Foreground( this );
    function createMonsters(){
        dragon = new Dragon( cast this );
        bat    = new Bat( this );
        tiny   = new Tiny( this );
    }
    function hitDragon( x: Float, y: Float ): Bool {
        var over = simpleHit( dragon.holder, x, y );
        ( over )? dragon.updateState( OVER ): dragon.updateState( OUT );
        return over;
    }
    function hitBat( x: Float, y: Float ): Bool {
        var over = simpleHit( bat.holder, x, y );
        ( over )? bat.updateState( OVER ): bat.updateState( OUT );
        return over;
    }
    function hitMonkey( x: Float, y: Float ): Bool {
        var over = simpleHit( tiny.holder, x, y );
        ( over )? tiny.updateState( OVER ): tiny.updateState( OUT );
        return over;
    }
    function drawButton( x: Float, y: Float, w: Float, h: Float, c: Int ): TestButton {
        return new TestButton( this, x, y, w, h, c );
    }
    function playMusic( sound: JakeSound ){
        if( soundController == null ) soundController = new SoundController();
        soundController.playTiny( sound );
    }
    function this_onEnterFrame( event: Event ): Void {
        var currentTime = Lib.getTimer();
        var current = Lib.current;
        var stage = current.stage;
        //tiny.position( stage.mouseX - tiny.holder.width/2, stage.mouseY - tiny.holder.height/2 );
        dragon.update();
        trace( 'hitDragon '+ hitDragon( stage.mouseX, stage.mouseY ) );
        trace( 'hitBat ' + hitBat( stage.mouseX, stage.mouseY ) );
        trace( 'hitMonkey ' + hitMonkey( stage.mouseX, stage.mouseY ) );
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
    public static function simpleHit( object: DisplayObject, x: Float, y: Float ): Bool {
        return object.hitTestPoint( x, y, true);
    }   
}