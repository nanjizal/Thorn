    /*
    var points:Array<{ x: Float, y: Float }>;
    var count = 0;
    function testSvgRouteCreation(){
            /*   Functionality not tested debugged but is doing the right type of stuff but moveTo is not covered */
        var segment = new SvgToSegment();
        var path = new SvgPath( segment );
        //var d="M10,150 A15 15 180 0 1 70 140 A15 25 180 0 0 130 130 A15 55 180 0 1 190 120";
        var d="M0,320C0,320,40.00000000000001,280.00000000000006,
60,280C80,280.00000000000006,102.25775011959048,324.71171060
192853,120,320C144.20059155278236,313.573183527412,155.7994,
206.42681647258783,180,200C197.74224988040956,195.288289398
07153,222.25775011959047,244.71171060192853,240,240C264.200
27823,233.57318352741208,22977265,196.81141546911275,540,
,600,280,600,280";
        path.parse( d );
        var equaPoints = segment.getEquaPoints( 10000 );
        points = equaPoints.points;
        trace( 'equaPoints ' + equaPoints ); 
    }
    
    
    if( count < points.length ){
        var p= points[count];
        count += 100;
        tiny.position( p.x*3 + 500, p.y * 3 + 500 );
        trace( 'points ' + count  + '  ' + points.length + ' ' + p.x + '  ' + p.y );
    } else {
        count = 0;
    }
    
    
    // way too much overhead and not working with scale?
	public static function pixelPerfectHitTest( object: DisplayObject, point: Point ):Bool {
		/* If we're already dealing with a BitmapData object then we just use the hitTest
		 * method of that BitmapData.
		 */
		if(Std.is(object,Bitmap)) {
			return cast(object,Bitmap).bitmapData.hitTest(new Point(0,0), 0, object.globalToLocal(point));
		}
		else
		{
				
			/* First we check if the hitTestPoint method returns false. If it does, that
			 * means that we definitely do not have a hit, so we return false. But if this
			 * returns true, we still don't know 100% that we have a hit because it might
			 * be a transparent part of the image. 
			 */
			if(!object.hitTestPoint(point.x, point.y, true)) {
				return false;
			}
			else {
				/* So now we make a new BitmapData object and draw the pixels of our object
				 * in there. Then we use the hitTest method of that BitmapData object to
				 * really find out of we have a hit or not.
				 */
				var bmapData:BitmapData = new BitmapData(Std.int(object.width), Std.int(object.height), true, 0x00000000);
				bmapData.draw(object, new Matrix());
				
				var returnVal:Bool = bmapData.hitTest(new Point(0,0), 0, object.globalToLocal(point));
				
				bmapData.dispose();
				
				return returnVal;
			}
		}
	}