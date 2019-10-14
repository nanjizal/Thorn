package thorn.visual;
import thorn.visual.State;
import openfl.display.Sprite;
typedef SelectionElement = {
    public function over( x: Float, y: Float ): Bool;
    public function down( x: Float, y: Float ): Bool;
    public var holder: Sprite; 
}