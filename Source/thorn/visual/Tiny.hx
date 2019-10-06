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
class Tiny extends BaseMonster {
    public function new( scope: Sprite ){
        super( scope, 'MonkeyHolder' );
        var child = MovieUtil.child; // so that it finds using.
        //var innerMonkey = clip.child( 'innerMonkey' );
        glowShape = clip.child( 'glow' );
        glow = 1.;
        
        position( 300, 505 );
        holder.alpha = 0.8;
        //holder.x = 300;
        //holder.y = 600 - holder.height - 20;
    }
}