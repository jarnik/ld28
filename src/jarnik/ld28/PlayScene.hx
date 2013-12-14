package jarnik.ld28;
import gaxe.Scene;
import pug.render.RenderGroupStates;
import pug.render.Render;
import pug.render.RenderText;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */
class PlayScene extends Scene
{
	
	private var screen:RenderGroupStates;
	private var label:RenderText;
	private var actionPoints:Array<ActionPoint>;

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
		
		addActionPoint( "fundraiser", "OFFER COIN TO ANIMAL SHELTER FUNDRAISER", "You offer the coin to a fundraiser.\nShe looks up, puzzled.\n\"Thank you. It's not much, but it counts.\"" );
		addActionPoint( "hobo", "OFFER COIN TO HOBO", "You toss a coin to a hobo.\nHe picks it up and puts it in his pocket.\n\"But I got a job, you know.\"" );
		addActionPoint( "hotdog", "BUY HOTDOG", "You ask the vendor for a hotdog.\n\"What? This is not enough. I'll give you a sachet of ketchup though.\"\nYou sit on a bench and suck on your ketchup." );
		addActionPoint( "sewer", "THROW COIN INTO SEWERS", "You throw the coin into the sewer grate.\n.........\n<SPLISH>" );
		addActionPoint( "busker", "GIVE COIN TO BUSKER", "You throw a coin into busker's hat.\nHe starts playing a slow, melancholic song.\nEveryone enjoys it." );
		addActionPoint( "policeman", "BRIBE POLICEMAN", "You cautiously hand over the coin to the police officer.\n\"What am I supposed to do with that? Quit messing around, I'm on duty.\"" );
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
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
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
		log( "CLICKED "+p.id );
	}
}