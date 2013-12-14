package jarnik.ld28;

import hsl.haxe.DirectSignaler;
import nme.events.MouseEvent;
import pug.render.RenderGroupStates;
import jarnik.ld28.Story;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */
class ActionPoint {

	public var onFocused:DirectSignaler<ActionPoint>;
	public var onUnfocused:DirectSignaler<ActionPoint>;
	public var onClicked:DirectSignaler<ActionPoint>;
	
	private var marker:RenderGroupStates;
	public var info:ACTION_POINT_INFO;
	
	public function new( marker:RenderGroupStates, info:ACTION_POINT_INFO ) {
		this.marker = marker;
		this.info = info;
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
	
	public function show():Void {
		marker.visible = true;
		marker.switchState("normal", true);
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