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
class StatScene extends Scene
{
	
	private var screen:RenderGroupStates;

	override private function create():Void 
	{
		super.create();
		
		screen = Render.renderGroupStates("street");
		addChild( screen );
		
		var popup:RenderGroupStates = cast( screen.fetch("popup"), RenderGroupStates );
		popup.switchState("stats", true );
		popup.visible = true;
		
		popup.fetch("title").setLabel( Player.playerChoice );
		
		setStats();
	}
	
	override private function reset():Void 
	{
		super.reset();
		
			
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
	
}