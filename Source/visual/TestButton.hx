package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.utils.ByteArray;
import openfl.Assets;
import openfl.Lib;
class TestButton {
    public var buttonDown: Void->Void;
    public function new( scope: Sprite, x: Float, y: Float, c: Int ){
        draw( scope, x, y, c );
    }
    public function draw( scope: Sprite, x: Float, y: Float, c: Int ){
        var but = new Sprite();
        var g = but.graphics;
        g.beginFill( c, 1 );
        g.lineStyle( 0, c, 1 );
        g.drawRect( 0, 0, 70, 50 );
        g.endFill();
        scope.addChild( but );
        but.x = x;
        but.y = y;
        but.addEventListener( MouseEvent.MOUSE_DOWN, mouseDown );
    }
    function mouseDown( event: MouseEvent ){
        buttonDown();
    }
}