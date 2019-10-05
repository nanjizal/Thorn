package visual;
import openfl.display.MovieClip;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.Graphics;
import openfl.events.MouseEvent;
import openfl.utils.ByteArray;
import openfl.Assets;
import openfl.Lib;
import video.SimpleVideoPlayer;
import sound.SoundController;
@:enum
abstract State( Int ){
    var OUT = 0;
    var OVER = 1;
}
class Dragon {
    public var holder: Sprite;
    var maxX = 700.;
    var minX = 0;
    var forward = true;
    var speed = 2.;
    var clip: MovieClip;
    var state = OUT;
    public function new( scope: Sprite ){
        holder = new Sprite();
        scope.addChild( holder );
        clip = Assets.getMovieClip ("swf-library:dragon2Hold");
        clip.scaleX = -1;
        clip.x = 0.;
        clip.y = 310.;
        holder.addChild( clip );
    }
    /*
    public function updateState( state: State ){
        if( state != OVER ){
            state = OVER;
            holder.removeChild( clip );
            clip = Assets.getMovieClip("swf-library:dragonGreen");
            holder.addChild( clip );
        } else if( state != OUT ){
            state = OUT;
            holder.removeChild( clip );
            clip = Assets.getMovieClip("swf-library:dragonBlue");
            holder.addChild( clip );
        }
    }
    */
    public function update(){
        backforward();
    }
    function backforward(){
        
        if( forward ){
            holder.x+= speed;
        } else {
            holder.x-= speed;
        }
        
        holder.y += 3*(Math.random() - 0.5);
        if( holder.x > maxX && forward ){
            holder.scaleX = -1.;
            forward = false;
        }
        if( holder.x < minX && !forward ){
            holder.scaleX = 1.;
            forward = true;
        }
    }
}