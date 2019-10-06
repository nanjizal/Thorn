package thorn.visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.Assets;
class Background {
    public var holder: Sprite;
    var clip: MovieClip;
    var currentScope: Sprite;
    public function new( scope: Sprite ){
        holder = new Sprite();
        currentScope = scope;
        scope.addChild( holder );
        clip = Assets.getMovieClip( "swf-library:" + 'background' );
        clip.x = 0.;
        clip.y = 0.;
        holder.addChild( clip );
    }
    public function move( x: Float, y: Float ){
        holder.x += x;
        holder.y += y;
    }
    public function position( x: Float, y: Float ){
        holder.x = x;
        holder.y = y;
    }
}