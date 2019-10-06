package thorn.interaction;
import openfl.Lib;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

class KeyboardInteraction{
    public var leftDown:           Bool = false;
    public var rightDown:          Bool = false;
    public var downDown:           Bool = false;
    public var upDown:             Bool = false;
    public var update: Void -> Void;
    public function new(){
        var current = Lib.current;
        var stage = current.stage;
        stage.addEventListener( KeyboardEvent.KEY_DOWN, keyDown );
        stage.addEventListener( KeyboardEvent.KEY_DOWN, keyUp );
    }
    inline
    function keyDown( event: KeyboardEvent ): Void {
        var keyCode = event.keyCode;
        if (keyCode == 27) { // ESC
            #if flash
                flash.system.System.exit(1);
            #elseif sys
                Sys.exit(1);
            #end
        }
        switch( keyCode ){
            case Keyboard.LEFT:
                leftDown    = true;
            case Keyboard.RIGHT:
                rightDown   = true;
            case Keyboard.UP:
                upDown      = true;
            case Keyboard.DOWN:
                downDown    = true;
            
            default: 
        }
        update(); // not sure if this ideal?
    }
    inline
    function keyUp( event: KeyboardEvent ): Void {
        var keyCode = event.keyCode;
        switch(keyCode){
            case Keyboard.LEFT:
                leftDown    = false;
            case Keyboard.RIGHT:
                rightDown   = false;
            case Keyboard.UP:
                upDown      = false;
            case Keyboard.DOWN:
                downDown    = false;
            default: 
        }
    }
    public inline 
    function resetArrows(){
        leftDown    = false;
        rightDown   = false;
        downDown    = false;
        upDown      = false;
    }
}