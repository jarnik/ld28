package jarnik.ld28;
import gaxe.Scene;
import nme.events.MouseEvent;
import pug.render.RenderGroupStates;
import pug.render.Render;
import pug.render.RenderText;
import gaxe.Gaxe;

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
			addActionPoint( p.id, p.caption, p.ending );
		
		var popup:RenderGroupStates = cast( screen.fetch("popup"), RenderGroupStates );
		popup.switchState("text", true );
		popup.fetch("buttonOK").onClick( onContinueClicked );
		popup.visible = false;
		
		switchState( PLAY_INTRO );		
	}
	
	private function addActionPoint( id:String, caption:String, ending:String ):ActionPoint {
		var marker:RenderGroupStates = cast( screen.fetch(id), RenderGroupStates );
		var p:ActionPoint = new ActionPoint( marker, id, caption, ending );
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
				screen.fetch("popup").visible = false;
			case PLAY_ENDTEXT:
				showPopup( selectedPoint.caption, selectedPoint.ending, onStats );
		}
		return true;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
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
		switchState( PLAY_SELECT );
	}
	
	private function onContinueClicked( e:MouseEvent = null ):Void {
		onContinueHandler();
	}
	
	private function onStats():Void {
		StatScene.pendingPlayerChoice = selectedPoint.id;
		Gaxe.switchGlobalScene( StatScene );
	}
	
	private function onPointFocused( p:ActionPoint ):Void {
		log( "focused " + p.id );
		label.setLabel( p.caption );
	}
	
	private function onPointUnfocused( p:ActionPoint ):Void {
		log( "unfocused " + p.id );
		label.setLabel( "" );
	}
	
	private function onPointClicked( p:ActionPoint ):Void {
		log( "CLICKED " + p.id );
		selectedPoint = p;
		for ( p in actionPoints )
			p.hide();
		switchState( PLAY_ENDTEXT );
	}
}