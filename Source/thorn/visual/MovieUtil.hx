package thorn.visual;
import openfl.display.MovieClip;
import openfl.display.DisplayObject;
class MovieUtil {
    public static inline
    function child( parent: MovieClip, name: String ){
        var mc: MovieClip = cast( parent.getChildByName( name ), MovieClip );
        return mc;
    }
    public static inline 
    function hit( object: DisplayObject, x: Float, y: Float ): Bool {
        return object.hitTestPoint( x, y, true );
    } 
}