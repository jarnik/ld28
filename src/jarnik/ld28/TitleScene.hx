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
		
		if ( Player.playerChoice == null ) {
			screen.fetch("buttonStart.OK484").setLabel( "START" );
			screen.fetch("title_gui").visible = true;
			screen.fetch("title_gui_nocoin").visible = false;
		} else {
			screen.fetch("buttonStart.OK484").setLabel( "STATS" );
			screen.fetch("title_gui").visible = false;
			screen.fetch("title_gui_nocoin").visible = true;
		}
		screen.fetch("stage").play( true );
    }

    override public function update( timeElapsed:Float ):Void {
		//screen.update( timeElapsed );
		super.update( timeElapsed );
		screen.fetch("stage").update( timeElapsed );
		log( "update!!! ");
    }
	
	private function onStartClicked( e:MouseEvent = null ):Void {
		if ( Player.playerChoice == null )
			Gaxe.switchGlobalScene( PlayScene );
		else
			Gaxe.switchGlobalScene( StatScene );
	}
	
}
