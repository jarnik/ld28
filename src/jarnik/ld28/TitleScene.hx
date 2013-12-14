package jarnik.ld28;

import gaxe.Scene;
import gaxe.Gaxe;
import nme.events.MouseEvent;
import pug.render.Render;
import pug.render.RenderGroupStates;
import pug.render.RenderImage;

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

		screen.fetch("buttonStart.bgr").onClick( onStartClicked );
		screen.fetch("buttonStart.OK484").mouseEnabled = false;
    }
	
	override public function allowMenu():Bool { return false; }

    override private function reset():Void {				
		log( "RESET!!! ");
    }

    override public function update( timeElapsed:Float ):Void {
		//screen.update( timeElapsed );
		super.update( timeElapsed );
		log( "update!!! ");
    }
	
	private function onStartClicked( e:MouseEvent = null ):Void {
		Gaxe.switchGlobalScene( PlayScene );
	}
	
}
