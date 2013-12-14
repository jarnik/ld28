package jarnik.ld28;

import gaxe.Gaxe;
import gaxe.Debug;
import gaxe.IMenu;
import nme.display.Sprite;

import pug.render.Render;
import pug.render.RenderGroupStates;
import nme.display.DisplayObject;

enum MenuState {
    MENU_TITLE;
    MENU_TITLE_IN_PROGRESS;
    MENU_INGAME;
    MENU_INGAME_FAIL;
}

class Menu extends Sprite implements IMenu 
{   

    private var menuState:MenuState;
	private var screen:RenderGroupStates;

	public function new () 
	{
		super();
        createMenu();
    }

    private function createMenu():Void {
		screen = Render.renderGroupStates( "title", null, "pause" );
		addChild( screen );
		visible = false;
    }

    public function init( params:Dynamic ):Void {
    }

    public function getDisplayObject():DisplayObject { return this; }
    public function isVisible():Bool { return visible; }

    public function show( s:EnumValue, params:Dynamic = null ):Void {
        menuState = (s == null ? MENU_INGAME : Type.createEnum( MenuState, Type.enumConstructor( s ) ));

        visible = true;
    }

    public function update( elapsed:Float ):Void {
        if ( !visible )
            return;
			
    }
	
	public function resize( width:Float, height:Float ):Void {
		
	} 

    public function hide():Void {
		
    }

}
