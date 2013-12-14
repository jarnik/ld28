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

enum StatSceneState {
    STATS_LOADING;
    STATS_SHOW;
}
 
class StatScene extends Scene
{
	
	private var screen:RenderGroupStates;
	private var stats:Array<RenderGroupStates>;
	public static var pendingPlayerChoice:String;

	override private function create():Void 
	{
		super.create();
		
		screen = Render.renderGroupStates("stats");
		addChild( screen );
		
		stats = [];
		for ( i in 0...6 )
			stats.push( cast( screen.fetch("stat" + (i + 1) ), RenderGroupStates ) );
		
		screen.fetch("buttonBack.bgr").onClick( onBackClicked );
		screen.fetch("buttonBack.caption").mouseEnabled = false;
			
		switchState( STATS_LOADING );
	}
	
	override private function reset():Void 
	{
		super.reset();
		for ( p in Story.points )
			if ( Player.playerChoice == p.id )
				screen.fetch("title").setLabel( p.caption );
	}
	
	override private function handleSwitchState(id:Dynamic):Bool 
	{
		switch ( cast( id, StatSceneState ) ) {
			case STATS_LOADING:
				for ( s in stats )
					s.visible = false;
				screen.fetch("loading").visible = true;
				screen.fetch("buttonBack").visible = false;
				Player.getStats( pendingPlayerChoice, onLoadedStats );
			case STATS_SHOW:
				screen.fetch("loading").visible = false;
				screen.fetch("buttonBack").visible = true;
				var index:Int = 0;
				var percent:Float;
				for ( s in stats ) {
					percent = 0;
					for ( ss in Player.stats ) {
						//trace("test "+ss.id+" "+Story.points[ index ].id+" p "+ss.percent);
						if ( ss.id == Story.points[ index ].id )
							percent = ss.percent;
					}
					s.visible = true;
					s.fetch("caption").setLabel( Story.points[ index ].caption );
					s.fetch("bar").scaleX = percent / 100 * 7.7;
					s.fetch("percent").setLabel( percent+"%" );
					index++;
				}
		}
		return true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		switch ( cast( state, StatSceneState ) ) {
			case STATS_LOADING:
			case STATS_SHOW:
		}
	}
	
	private function onBackClicked( e:MouseEvent = null ):Void {
		Gaxe.switchGlobalScene( TitleScene );
	}
	
	private function onLoadedStats():Void {
		switchState( STATS_SHOW );
	}
	
}