package jarnik.ld28;

/**
 * ...
 * @author Jaroslav Meloun - jarnik - www.jarnik.com
 */

 typedef ACTION_POINT_INFO = {
	id:String,
	caption:String,
	ending:String,
	end:Bool
 }
 
class Story
{
	
	public static var points:Array<ACTION_POINT_INFO>;

	public static function init() {
		points = [
		{ id:"fundraiser", caption:"GIVE COIN TO ANIMAL SHELTER FUNDRAISER", ending:"You offer the coin to a fundraiser.\nShe looks up, puzzled.\n\"Thank you. It's not much, but it counts.\"", end:true },
		{ id:"hobo", caption:"GIVE COIN TO HOBO", ending:"You toss a coin to a hobo.\nHe picks it up and puts it in his pocket.\n\"But I got a job, you know.\"", end:true },
		{ id:"hotdog", caption:"BUY HOTDOG", ending:"You ask the vendor for a hotdog.\n\"What? This is not enough. I'll give you a sachet of ketchup though.\"\nYou sit on a bench and suck on your ketchup.", end:true },
		{ id:"sewer", caption:"THROW COIN INTO SEWERS", ending:"You throw the coin into the sewer grate.\n.........\n<SPLISH>", end:true },
		{ id:"busker", caption:"GIVE COIN TO BUSKER", ending:"You throw a coin into busker's hat.\nHe starts playing a slow, melancholic song.\nEveryone enjoys it.", end:true },
		{ id:"scratchcar", caption:"SCRATCH CAR", ending:"You look around, but everyone seems busy.\nYou walk around a car, scratching its shiny coating.\nThe coin is damaged, you throw it away.", end:true }
		];
	}
	
}