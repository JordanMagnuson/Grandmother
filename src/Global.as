package  
{
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Global 
	{
		// Constants
		public static const PHOTO_FADE_IN_DURATION:Number = 3;
		public static const PHOTO_FADE_OUT_DURATION:Number = 3; 
		public static const MIN_SPONGE_SATURATION:Number = 0.4;
		
		// Variables
		public static var hasSponge:Boolean = false;
		
		// Entities
		public static var SndAmbient:Sfx = new Sfx(Assets.SND_AMBIENT_01);
		public static var photoController:PhotoController;
		public static var dust:Dust;
		public static var sponge:Sponge;
		public static var bucket:Bucket;
		public static var vase:Vase;
		public static var flowers:Flowers;
	}

}