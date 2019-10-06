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
import motion.easing.Quad;
import motion.easing.Linear;
import motion.Actuate;
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
    var glowDragon: MovieClip;
    var glowLeg0: MovieClip;
    var glowLeg1: MovieClip;
    var glowLeg2: MovieClip;
    var glowLeg3: MovieClip;
    // getter and setter of glow.
    // this should be tweenable eg: 
    // Actuate.tween(this, 1., { glow: 1. }).ease( Quad.easeInOut );//.delay(1);
    // although Actuate maybe expecting a MovieClip ?
    // since getter and setter change in Haxe you need to get Actuate from github not install eg:
    // haxelib git actuate <clone path>
    @:isVar public var glow(get, set):Float;
    function get_glow() {
      return glow;
    }
    function set_glow( alpha: Float ) {
      glowDragon.alpha = 1.-alpha;
      glowLeg0.alpha = 1.-alpha;
      glowLeg1.alpha = 1.-alpha;
      glowLeg2.alpha = 1.-alpha;
      glowLeg3.alpha = 1.-alpha;
      return this.glow = alpha;
    }
    public function new( scope: Sprite ){
        holder = new Sprite();
        scope.addChild( holder );
        clip = Assets.getMovieClip ("swf-library:dragon2Hold");
        createGlowDragon();
        clip.scaleX = -1;
        clip.x = 0.;
        clip.y = 310.;
        holder.addChild( clip );
    }
    function createGlowDragon(){
        var innerDragon: MovieClip = cast( clip.getChildByName('innerDragon'), MovieClip );
        var bodyDragon: MovieClip = cast( innerDragon.getChildByName('bodyDragon'),MovieClip );
        var leg0: MovieClip = cast( innerDragon.getChildByName('leg0'),MovieClip );
        var leg1: MovieClip = cast( innerDragon.getChildByName('leg1'),MovieClip );
        var leg2: MovieClip = cast( innerDragon.getChildByName('leg2'),MovieClip );
        var leg3: MovieClip = cast( innerDragon.getChildByName('leg3'),MovieClip );
        glowLeg0 = cast( leg0.getChildByName('glow'),MovieClip );
        glowLeg1 = cast( leg1.getChildByName('glow'),MovieClip );
        glowLeg2 = cast( leg2.getChildByName('glow'),MovieClip );
        glowLeg3 = cast( leg3.getChildByName('glow'),MovieClip );
        glowDragon = cast( bodyDragon.getChildByName('glowDragon'),MovieClip );
        glow = 0.;
    }
    public
    function updateState( state: State ){
        if( state != OVER ){
            // tweens don't work for this well?
            //Actuate.tween(this, 1., { glow: 1. }).ease( Quad.easeInOut );//.delay(1);
            glow = 1;
            state = OVER;
        } else if( state != OUT ){
            state = OUT;
            glow = 0;
            //Actuate.tween(this, 1., { glow: 0. }).ease( Quad.easeInOut );//.delay(1);
        }
    }
    public
    function update(){
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