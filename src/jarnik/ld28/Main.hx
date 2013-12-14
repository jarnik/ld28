package jarnik.ld28;

import nme.Assets;
import nme.text.Font;
import pug.model.Library;
import nme.events.KeyboardEvent;
import nme.ui.Keyboard;
import gaxe.Gaxe;

class Main extends Gaxe 
{
    public static var font:Font;
	public static var lib:Library;
	//public static var format:TextFormat;

	// Entry point
	public static function main() {
		lib = new Library();
        lib.onLibLoaded.bindVoid( onLibLoaded );
        lib.importByteArrayPUG( Assets.getBytes("assets/pugs/ld28.pug") );
	}
	
	private static function onLibLoaded():Void {
		Gaxe.loadGaxe( new Main(), new Menu(), 320, 240 );
	}

    public function new() {
        super();
        //font = Assets.getFont ("assets/fonts/nokiafc22.ttf");
		//format = new TextFormat (Main.font.fontName, 16, 0xFF0000);
    }

    override private function init():Void {
        super.init();

        //GameLog.init( "passengers-03-tapdemo", "http://www.jarnik.com/amfphp/gateway.php" );
        //GameLog.start();
		
		Player.init();
		
		//Gaxe.head.addChild( Cursor.init( stage ) );

        //menu.init( { volume: 1, gamma: SaveGame.settings.gamma } );
		//SoundLib.autoInit( SaveGame.settings.volume );
        
        //switchScene( TitleScene );
        switchScene( StatScene );
        //switchScene( PlayScene );
    }
	
	override public function handleKey( e:KeyboardEvent ):Void {
		switch( e.keyCode ) {
			case Keyboard.P:
				if ( e.type == KeyboardEvent.KEY_UP ) {
					if ( getCurrentScene().allowMenu() ) {
						if ( !menu.isVisible() )
							showMenu();
						else
							menu.hide();
						return;
					}
				}
		}
		
		if ( getCurrentScene() != null )
			getCurrentScene().handleKey( e );
	}

}
