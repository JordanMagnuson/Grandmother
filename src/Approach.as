package  
{
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Approach extends World
	{
		public var photoArray:Array = new Array(Assets.PHOTO_01, Assets.PHOTO_02, Assets.PHOTO_03, Assets.PHOTO_04, Assets.PHOTO_05, Assets.PHOTO_06, Assets.PHOTO_07, Assets.PHOTO_08, Assets.PHOTO_09, Assets.PHOTO_10, Assets.PHOTO_11, Assets.PHOTO_12, Assets.PHOTO_13, Assets.PHOTO_14, Assets.PHOTO_15, Assets.PHOTO_16);
		public var soundArray:Array = new Array(Assets.SND_DOOR_SQUEAK, Assets.SND_WALKING_01, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_02, Assets.SND_WALKING_05, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_06, Assets.SND_TILES_01, Assets.SND_TILES_02, Assets.SND_TILES_03, Assets.SND_TILES_04, Assets.SND_WALKING_01, Assets.SND_WALKING_06, Assets.SND_TILES_05);						
		
		public function Approach() 
		{
		}
		
		override public function begin():void
		{
			add(Global.photoController = new PhotoController(photoArray, soundArray));
			Global.SndAmbient.loop();
			add(new MouseControllerApproach);
		}
		
	}

}