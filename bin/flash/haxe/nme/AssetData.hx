package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("assets/fonts/nokiafc22.ttf", nme.NME_assets_fonts_nokiafc22_ttf);
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/pugs/ld28.pug", nme.NME_assets_pugs_ld28_pug);
			type.set ("assets/pugs/ld28.pug", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/sfx/cink.mp3", nme.NME_assets_sfx_cink_mp3);
			type.set ("assets/sfx/cink.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/hobo.mp3", nme.NME_assets_sfx_hobo_mp3);
			type.set ("assets/sfx/hobo.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/hotdoger.mp3", nme.NME_assets_sfx_hotdoger_mp3);
			type.set ("assets/sfx/hotdoger.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/lusi_guitar_random_song.mp3", nme.NME_assets_sfx_lusi_guitar_random_song_mp3);
			type.set ("assets/sfx/lusi_guitar_random_song.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/noise.mp3", nme.NME_assets_sfx_noise_mp3);
			type.set ("assets/sfx/noise.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/scratch.mp3", nme.NME_assets_sfx_scratch_mp3);
			type.set ("assets/sfx/scratch.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/splish.mp3", nme.NME_assets_sfx_splish_mp3);
			type.set ("assets/sfx/splish.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			className.set ("assets/sfx/women_hm.mp3", nme.NME_assets_sfx_women_hm_mp3);
			type.set ("assets/sfx/women_hm.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_assets_fonts_nokiafc22_ttf extends flash.text.Font { }
class NME_assets_pugs_ld28_pug extends flash.utils.ByteArray { }
class NME_assets_sfx_cink_mp3 extends flash.media.Sound { }
class NME_assets_sfx_hobo_mp3 extends flash.media.Sound { }
class NME_assets_sfx_hotdoger_mp3 extends flash.media.Sound { }
class NME_assets_sfx_lusi_guitar_random_song_mp3 extends flash.media.Sound { }
class NME_assets_sfx_noise_mp3 extends flash.media.Sound { }
class NME_assets_sfx_scratch_mp3 extends flash.media.Sound { }
class NME_assets_sfx_splish_mp3 extends flash.media.Sound { }
class NME_assets_sfx_women_hm_mp3 extends flash.media.Sound { }
