package thorn.visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.Assets;
import thorn.visual.MovieUtil;
import motion.easing.Quad;
import motion.easing.Linear;
import motion.Actuate;
import thorn.visual.Dragon;
import thorn.visual.State;
using thorn.visual.MovieUtil;
class BaseMonster {
    var glowShape: MovieClip;
    var state = OUT;
    @:isVar public var glow(get, set):Float;
    function get_glow() {
      return glow;
    }
    function set_glow( alpha: Float ) {
      glowShape.alpha = 1.-alpha;
      return this.glow = alpha;
    }
    public var holder: Sprite;
    var clip: MovieClip;
    var currentScope: Sprite;
    public function new( scope: Sprite, name: String ){
        holder = new Sprite();
        currentScope = scope;
        scope.addChild( holder );
        clip = Assets.getMovieClip( "swf-library:" + name );
        clip.x = 0.;
        clip.y = 0.;
        holder.addChild( clip );
    }
    public
    function down( x: Float, y: Float ): Bool {
        var isDown = MovieUtil.hit( holder, x, y );
        return isDown;
    }
    public
    function over( x: Float, y: Float ): Bool {
        var isOver = MovieUtil.hit( holder, x, y );
        if( !isOver && state != OVER ){
            // tweens don't work for this well?
            //Actuate.tween(this, 1., { glow: 1. }).ease( Quad.easeInOut );//.delay(1);
            glow = 1;
            state = OVER;
        } else if( !isOver && state != OUT ){
            state = OUT;
            glow = 0;
            //Actuate.tween(this, 1., { glow: 0. }).ease( Quad.easeInOut );//.delay(1);
        }
        return isOver;
    }
    public function move( x: Float, y: Float ){
        holder.x += x;
        holder.y += y;
        ( x > 0 )? holder.scaleX = -1: holder.scaleX = 1;
    }
    public function position( x: Float, y: Float ){
        ( x > holder.x )? holder.scaleX = -1: holder.scaleX = 1;
        holder.x = x;
        holder.y = y;
    }
    public function changeScope( scope: Sprite ){
        currentScope.removeChild( holder );
        currentScope = scope;
        scope.addChild( holder );
        //(sprite.getBounds()., sprite.x, sprite.scrollRect.x, sprite.localToGlobal(…))
    }
}