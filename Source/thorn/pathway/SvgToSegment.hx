package thorn.pathway;
import openfl.geom.Point;
import trilateral.justPath.IPathContext;
import trilateral.geom.Algebra;
import thorn.pathway.Equa;

class SvgToSegment implements IPathContext{
    // see trilateral.path.Base for approach
    public var points = new Array<{x: Float, y: Float }>();
    var x:                          Float = 0.;
    var y:                          Float = 0.;
    var tempArr: Array<Float>;
    public function new(){
    
    }
    public function moveTo( x: Float, y: Float ): Void{
        trace( 'moveTo( $x, $y );' );
        line( x, y );
    }
    public function lineTo( x: Float, y: Float ): Void{
        trace( 'lineTo( $x, $y );' );
        line( x, y );
    }
    public function quadTo( x1: Float, y1: Float, x2: Float, y2: Float ): Void{
        // add code for bezier see Trilateral
        trace( 'quadTo( $x1, $y1, $x2, $y2 );');
        tempArr = [];
        Algebra.quadCurve( tempArr, x, y, x1, y1, x2, y2 );
        plotCoord( tempArr, false );
        x = x2;
        y = y2;
    }
    public function curveTo( x1: Float, y1: Float, x2: Float, y2: Float, x3: Float, y3: Float ): Void{
        // add code for bezier see Trilateral
        trace( 'curveTo( $x1, $y1, $x2, $y2, $x3, $y3 );');
        tempArr = [];
        Algebra.cubicCurve( tempArr, x, y, x1, y1, x2, y2, x3, y3 );
        plotCoord( tempArr, false );
        x = x3;
        y = y3;
    }
    public inline
    function plotCoord( arr: Array<Float>, ?withMove: Bool = true ): Void {
        var l = arr.length;
        var i = 2;
        if( withMove ){ // normally when just plotting points you will do it withMove but from a curve not.
            moveTo( arr[ 0 ], arr[ 1 ] );
        } else {
            lineTo( arr[ 0 ], arr[ 1 ] );
        }
        while( i < l ){
            lineTo( arr[ i ], arr[ i + 1 ] );
            i += 2;
        }
    }
    
    function line( x: Float, y: Float ){
        var p = { x: x, y: y };
        points[ points.length ] = p;
    }
    // must make noPoints larger than points!!
    public function getEquaPoints( noPoints ): EquaPoints{
        return Equa.getEquaPoints( points, noPoints );
    }
    // use
    /**
    var segment = new SvgToSegment();
    var path = new SvgPath( svgEqSegment );
    var d="M10,150 A15 15 180 0 1 70 140 A15 25 180 0 0 130 130 A15 55 180 0 1 190 120"
    path.parse( d, 0, 0, 1, 1 );
    var equaPoints = segment.getEquaPoints( 10000 );
    **/
    
}