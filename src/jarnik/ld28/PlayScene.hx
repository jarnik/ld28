package jarnik.ld28;
import gaxe.Scene;
import jarnik.ld28.Story.ACTION_POINT_INFO;
import nme.events.MouseEvent;
import pug.render.RenderGroupStates;
import pug.render.Render;
import pug.render.RenderText;
import gaxe.Gaxe;
import gaxe.SoundLib;

enum PlaySceneState {
    PLAY_INTRO;
    PLAY_SELECT;
    PLAY_ENDTEXT;
}

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */
class PlayScene extends Scene
{
	
	private var screen:RenderGroupStates;
	private var label:RenderText;
	private var actionPoints:Array<ActionPoint>;
	private var selectedPoint:ActionPoint;
	private var onContinueHandler:Void->Void;

	override private function create():Void 
	{
		super.create();
		
		actionPoints = [];
		
		screen = Render.renderGroupStates("street");
		addChild( screen );
		
		label = cast( screen.fetch("label"), RenderText );
	}
	
	override private function reset():Void 
	{
		super.reset();
		
		label.setLabel("");
		
		for ( p in Story.points )
			addActionPoint( p );
		
		var popup:RenderGroupStates = cast( screen.fetch("popup"), RenderGroupStates );
		popup.switchState("text", true );
		popup.fetch("buttonOK").onClick( onContinueClicked );
		popup.visible = false;
		
		screen.fetch("stage").play( true );
		
		switchState( PLAY_INTRO );		
	}
	
	private function addActionPoint( info:ACTION_POINT_INFO ):ActionPoint {
		var marker:RenderGroupStates = cast( screen.fetch(info.id), RenderGroupStates );
		var p:ActionPoint = new ActionPoint( marker, info );
		actionPoints.push( p );
		p.onFocused.bind( onPointFocused );
		p.onUnfocused.bind( onPointUnfocused );
		p.onClicked.bind( onPointClicked );
		return p;
	}
	
	override private function handleSwitchState(id:Dynamic):Bool 
	{
		switch ( cast( id, PlaySceneState ) ) {
			case PLAY_INTRO:
				showPopup( "You got only one coin.", "What are you going to do with it?", onStartClicked );
			case PLAY_SELECT:
				for ( p in actionPoints )
					p.show();	
				screen.fetch("popup").visible = false;
			case PLAY_ENDTEXT:
				SoundLib.play("assets/sfx/"+selectedPoint.info.sfx);
				showPopup( selectedPoint.info.caption, selectedPoint.info.ending, onStats );
		}
		return true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		screen.fetch("stage").update( elapsed );
		switch ( cast( state, PlaySceneState ) ) {
			case PLAY_INTRO:
			case PLAY_SELECT:
			case PLAY_ENDTEXT:
		}
	}
	
	private function showPopup( title:String, text:String, handler:Void->Void ) {
		var popup:RenderGroupStates = cast( screen.fetch("popup"), RenderGroupStates );
		popup.visible = true;
		popup.switchState("text", true );
		popup.fetch("title").setLabel( title );
		popup.fetch("caption").setLabel( text );
		onContinueHandler = handler;
	}
	
	private function onStartClicked():Void {
		SoundLib.play("assets/sfx/cink");
		switchState( PLAY_SELECT );
	}
	
	private function onContinueClicked( e:MouseEvent = null ):Void {
		SoundLib.play("assets/sfx/cink");
		onContinueHandler();
	}
	
	private function onStats():Void {
		if ( !selectedPoint.info.end ) {
			switchState( PLAY_SELECT );
			return;
		}
		StatScene.pendingPlayerChoice = selectedPoint.info.id;
		Gaxe.switchGlobalScene( StatScene );
	}
	
	private function onPointFocused( p:ActionPoint ):Void {
		log( "focused " + p.info.id );
		label.setLabel( p.info.caption );
	}
	
	private function onPointUnfocused( p:ActionPoint ):Void {
		log( "unfocused " + p.info.id );
		label.setLabel( "" );
	}
	
	private function onPointClicked( p:ActionPoint ):Void {
		log( "CLICKED " + p.info.id );
		selectedPoint = p;
		for ( p in actionPoints )
			p.hide();
		switchState( PLAY_ENDTEXT );
	}
}