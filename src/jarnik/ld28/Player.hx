package jarnik.ld28;
import nme.net.URLLoader;
import nme.events.Event;
import nme.net.URLRequest;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */

 typedef STAT = {
	id:String,
	votes:Int,
	percent:Float
 }
 
class Player
{
	
	public static var playerChoice:String;
	private static var handler:Void->Void;
	private static var loader:URLLoader;
	private static var stats:Array<STAT>;

	public static function init():Void {
		playerChoice = "OFFER COIN TO HOBO";
		loader = new URLLoader();
		loader.addEventListener( Event.COMPLETE, onLoaded );
		stats = [];
	}
	
	public function new() {
		
	}
	
	public static function getStats( vote:String, handler:Void->Void ):Void {
		Player.handler = handler;
		var urlRequest:URLRequest = new URLRequest("http://jarnik.com/pub/ld28/vote.php");
		urlRequest.method = 'POST';
		if ( vote != null && vote != "" )
			urlRequest.data.id = vote;
		loader.load( urlRequest );
	}
	
	private static function onLoaded( e:Event ):Void {
		trace( "LOADED "+loader.data );
		handler();
	}
	
	
}