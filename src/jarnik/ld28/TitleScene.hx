package jarnik.ld28;

import gaxe.Scene;
import gaxe.Gaxe;
import pug.render.Render;
import pug.render.RenderGroupStates;

class TitleScene extends Scene 
{
	
	var screen:RenderGroupStates;
	
	public function new () 
	{
		super();
	}

    override private function create():Void {
		screen = Render.renderGroupStates( "title", null, "main" );
		addChild( screen );		
		
		resize( Gaxe.w, Gaxe.h );
    }
	
	override public function allowMenu():Bool { return false; }

    override private function reset():Void {				
		
    }

    override public function update( timeElapsed:Float ):Void {
		screen.update( timeElapsed );
		
    }

	public override function resize( width:Float, height:Float ):Void {
    }
	
}
