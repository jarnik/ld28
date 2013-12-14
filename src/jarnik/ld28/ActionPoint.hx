package jarnik.ld28;

import hsl.haxe.DirectSignaler;
import nme.events.MouseEvent;
import pug.render.RenderGroupStates;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */
class ActionPoint {

	public var onFocused:DirectSignaler<ActionPoint>;
	public var onUnfocused:DirectSignaler<ActionPoint>;
	public var onClicked:DirectSignaler<ActionPoint>;
	
	private var marker:RenderGroupStates;
	public var id:String;
	public var caption:String;
	public var ending:String;
	
	public function new( marker:RenderGroupStates, id:String, caption:String, ending:String ) {
		this.marker = marker;
		this.id = id;
		this.caption = caption;
		this.ending = ending;
		onFocused = new DirectSignaler(this);
		onUnfocused = new DirectSignaler(this);
		onClicked = new DirectSignaler(this);
		
		marker.onEvents( [ MouseEvent.MOUSE_OVER ], onMouseOver );
		marker.onEvents( [ MouseEvent.MOUSE_OUT ], onMouseOut );
		marker.onEvents( [ MouseEvent.CLICK ], onMouseClick );
		
		marker.switchState("normal", true);
	}
	
	public function hide():Void {
		marker.visible = false;
	}
	
	private function onMouseOver( e:MouseEvent = null ):Void {
		marker.switchState("focused", true);
		onFocused.dispatch( this );
	}
	
	private function onMouseOut( e:MouseEvent = null ):Void {
		marker.switchState("normal", true);
		onUnfocused.dispatch( this );
	}
	
	private function onMouseClick( e:MouseEvent = null ):Void {
		onClicked.dispatch( this );
	}
	
}