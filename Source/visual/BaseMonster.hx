package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.Assets;
class BaseMonster {
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
    public function move( x: Float, y: Float ){
        if( x < 0 ) {
            holder.scaleX = 1;
        } else if( x > 0 ){
            holder.scaleX = -1;
        } else {
            
        }
        holder.x += x;
        holder.y += y;
    }
    public function position( x: Float, y: Float ){
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