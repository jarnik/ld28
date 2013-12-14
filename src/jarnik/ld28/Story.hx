package jarnik.ld28;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */

 typedef ACTION_POINT_INFO = {
	id:String,
	caption:String,
	ending:String
 }
 
class Story
{
	
	public static var points:Array<ACTION_POINT_INFO>;

	public static function init() {
		points = [
		{ id:"fundraiser", caption:"OFFER COIN TO ANIMAL SHELTER FUNDRAISER", ending:"You offer the coin to a fundraiser.\nShe looks up, puzzled.\n\"Thank you. It's not much, but it counts.\"" },
		{ id:"hobo", caption:"OFFER COIN TO HOBO", ending:"You toss a coin to a hobo.\nHe picks it up and puts it in his pocket.\n\"But I got a job, you know.\"" },
		{ id:"hotdog", caption:"BUY HOTDOG", ending:"You ask the vendor for a hotdog.\n\"What? This is not enough. I'll give you a sachet of ketchup though.\"\nYou sit on a bench and suck on your ketchup." },
		{ id:"sewer", caption:"THROW COIN INTO SEWERS", ending:"You throw the coin into the sewer grate.\n.........\n<SPLISH>" },
		{ id:"busker", caption:"GIVE COIN TO BUSKER", ending:"You throw a coin into busker's hat.\nHe starts playing a slow, melancholic song.\nEveryone enjoys it." },
		{ id:"policeman", caption:"BRIBE POLICEMAN", ending:"You cautiously hand over the coin to the police officer.\n\"What am I supposed to do with that? Quit messing around, I'm on duty.\"" }
		];
	}
	
}