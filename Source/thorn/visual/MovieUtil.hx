package thorn.visual;
import openfl.display.MovieClip;
class MovieUtil {
    public static inline
    function child( parent: MovieClip, name: String ){
        var mc: MovieClip = cast( parent.getChildByName( name ), MovieClip );
        return mc;
    }
}