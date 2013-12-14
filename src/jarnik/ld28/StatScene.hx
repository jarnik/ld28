package jarnik.ld28;
import gaxe.Scene;
import nme.events.MouseEvent;
import pug.render.RenderGroupStates;
import pug.render.Render;
import pug.render.RenderText;
import gaxe.Gaxe;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */

enum PlaySceneState {
    STATS_LOADING;
    STATS_SHOW;
}
 
class StatScene extends Scene
{
	
	private var screen:RenderGroupStates;
	private var stats:Array<RenderGroupStates>;

	override private function create():Void 
	{
		super.create();
		
		screen = Render.renderGroupStates("stats");
		addChild( screen );
		
		stats = [];
		for ( i in 0...6 )
			stats.push( cast( screen.fetch("stat" + (i + 1) ), RenderGroupStates ) );
		
		/*popup.fetch("title").setLabel( Player.playerChoice );
		hide
		
		setStats();*/
		switchState( STATS_LOADING );
	}
	
	override private function reset():Void 
	{
		super.reset();
	}
	
	override private function handleSwitchState(id:Dynamic):Bool 
	{
		switch ( cast( id, PlaySceneState ) ) {
			case STATS_LOADING:
				for ( s in stats )
					s.visible = false;
				screen.fetch("loading").visible = true;
				Player.getStats( null, onLoadedStats );
			case STATS_SHOW:
				screen.fetch("loading").visible = false;
				//for ( s in stats )
				//	s.visible = false;
		}
		return true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		switch ( cast( state, PlaySceneState ) ) {
			case STATS_LOADING:
			case STATS_SHOW:
		}
	}
	
	private function onLoadedStats():Void {
		switchState( STATS_SHOW );
	}
	
}