package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.Assets;
class Tiny extends BaseMonster {
    public function new( scope: Sprite ){
        super( scope, 'tiny' );
        holder.x = 300;
        holder.y = 600 - holder.height - 20;
    }
}