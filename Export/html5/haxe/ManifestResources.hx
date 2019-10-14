package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":"swf-library","assets":"aoy4:pathy26:lib%2Fswf-library%2F20.pngy4:sizei1825428y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y26:lib%2Fswf-library%2F23.pngR2i32995R3R4R5R7R6tgoR0y26:lib%2Fswf-library%2F24.pngR2i32995R3R4R5R8R6tgoR0y26:lib%2Fswf-library%2F26.pngR2i9794R3R4R5R9R6tgoR0y26:lib%2Fswf-library%2F27.pngR2i9794R3R4R5R10R6tgoR0y26:lib%2Fswf-library%2F28.pngR2i9794R3R4R5R11R6tgoR0y26:lib%2Fswf-library%2F30.pngR2i11022R3R4R5R12R6tgoR0y26:lib%2Fswf-library%2F31.pngR2i11022R3R4R5R13R6tgoR0y26:lib%2Fswf-library%2F32.pngR2i11022R3R4R5R14R6tgoR0y26:lib%2Fswf-library%2F34.pngR2i35155R3R4R5R15R6tgoR0y26:lib%2Fswf-library%2F35.pngR2i35155R3R4R5R16R6tgoR0y26:lib%2Fswf-library%2F36.pngR2i35155R3R4R5R17R6tgoR0y26:lib%2Fswf-library%2F48.jpgR2i6810R3R4R5R18R6tgoR0y26:lib%2Fswf-library%2F48.pngR2i18139R3R4R5R19R6tgoR0y27:lib%2Fswf-library%2F48a.pngR2i6436R3R4R5R20R6tgoR0y26:lib%2Fswf-library%2F50.pngR2i990R3R4R5R21R6tgoR0y26:lib%2Fswf-library%2F52.pngR2i5089R3R4R5R22R6tgoR0y26:lib%2Fswf-library%2F53.pngR2i5089R3R4R5R23R6tgoR0y26:lib%2Fswf-library%2F54.pngR2i990R3R4R5R24R6tgoR0y26:lib%2Fswf-library%2F55.pngR2i990R3R4R5R25R6tgoR0y35:lib%2Fswf-library%2Fswf-library.binR2i74027R3y4:TEXTR5R26R6tgh","rootPath":null,"version":2,"libraryArgs":["lib/swf-library/swf-library.bin"],"libraryType":"openfl._internal.formats.swf.SWFLiteLibrary"}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("swf-library", library);
		data = '{"name":null,"assets":"ah","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("swf-library");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("swf-library");
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_23_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_24_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_26_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_27_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_28_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_30_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_31_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_34_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_35_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_36_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_48_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_48_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_48a_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_50_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_52_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_53_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_54_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_55_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__lib_swf_library_json extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/20.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_20_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/23.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_23_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/24.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_24_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/26.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_26_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/27.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_27_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/28.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_28_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/30.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_30_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/31.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_31_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/32.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_32_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/34.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_34_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/35.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_35_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/36.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_36_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/48.jpg") @:noCompletion #if display private #end class __ASSET__lib_swf_library_48_jpg extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/48.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_48_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/48a.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_48a_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/50.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_50_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/52.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_52_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/53.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_53_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/54.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_54_png extends lime.graphics.Image {}
@:keep @:image("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/55.png") @:noCompletion #if display private #end class __ASSET__lib_swf_library_55_png extends lime.graphics.Image {}
@:keep @:file("/projects/May2019/October2019/Thorn/Export/html5/obj/libraries/swf-library/swf-library.bin") @:noCompletion #if display private #end class __ASSET__lib_swf_library_swf_library_bin extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__lib_swf_library_json extends haxe.io.Bytes {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else



#end

#if (openfl && !flash)

#if html5

#else

#end

#end
#end

#end
