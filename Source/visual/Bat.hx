package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.Assets;
class Bat extends BaseMonster {
    public function new( scope: Sprite ){
        super( scope, 'bat' );
        holder.x = 300;
        holder.y = 600 - holder.height;
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