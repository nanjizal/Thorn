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
using thorn.visual.MovieUtil;
class Bat extends BaseMonster {

    public function new( scope: Sprite ){
        super( scope, 'glider' );
        var child = MovieUtil.child; // so that it finds using.
        var innerGlider = clip.child( 'innerGlider' );
        glowShape = innerGlider.child( 'glow' );
        glow = 1.;
        position( 300, 120 );
        move( 1, 1 );
        holder.alpha = 0.9;
    }

    override public function move( x: Float, y: Float ){
        super.move( x, y );
        if( y < 0 ){
            holder.rotation = -90;
        } else {
            holder.rotation = 0;
        }
    }
}