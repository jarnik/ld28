package jarnik.ld28;
import nme.net.SharedObject;
import nme.net.URLLoader;
import nme.events.Event;
import nme.net.URLRequest;
import nme.net.URLRequestMethod;
import nme.net.URLVariables;

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
	public static var stats:Array<STAT>;
	private static var so:SharedObject;

	public static function init():Void {
		loader = new URLLoader();
		loader.addEventListener( Event.COMPLETE, onLoaded );
		stats = [];
		so = SharedObject.getLocal("jarnik-ld28");
		if ( so.data != null && so.data.playerChoice != null )
			playerChoice = so.data.playerChoice;
	}
	
	public function new() {
		
	}
	
	public static function getStats( vote:String, handler:Void->Void ):Void {
		Player.handler = handler;
		var urlRequest:URLRequest = new URLRequest("http://jarnik.com/pub/ld28/vote.php");
		urlRequest.method = URLRequestMethod.POST;
		if ( vote != null && vote != "" ) {
			var urlVariables:URLVariables = new URLVariables();
			urlVariables.id = vote;
			urlRequest.data = urlVariables;
			playerChoice = vote;
			so.data.playerChoice = playerChoice;
			so.flush();
		}
		loader.load( urlRequest );
	}
	
	private static function onLoaded( e:Event ):Void {
		var lines:Array<String> = Std.string( loader.data ).split(",");
		var values:Array<String>;
		stats = [];
		var totalvotes:Int = 0;
		for ( l in lines ) {
			values = l.split(":");
			stats.push( {
				id: values[0],
				votes: Std.parseInt( values[1] ),
				percent: 0
			} );
			totalvotes += Std.parseInt( values[1] );
		}
		for ( s in stats ) {
			s.percent = Math.round( s.votes / totalvotes * 100 );
		}
		handler();
	}
	
	
}