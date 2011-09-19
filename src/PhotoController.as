package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoController extends Entity
	{
		public var photoArray:Array;
		public var soundArray:Array;
		public var currentIndex:int = 0;	
		public var finished:Boolean = false;
		public var loop:Boolean = false;
		
		public var currentPhoto:PhotoBackdrop;
		public var lastPhoto:PhotoBackdrop;		
		
		public function PhotoController() 
		{
			//photoArray = new Array(Assets.PHOTO_01, Assets.PHOTO_02, Assets.PHOTO_03, Assets.PHOTO_04, Assets.PHOTO_05, Assets.PHOTO_06, Assets.PHOTO_07, Assets.PHOTO_08, Assets.PHOTO_09, Assets.PHOTO_10, Assets.PHOTO_11, Assets.PHOTO_12, Assets.PHOTO_13, Assets.PHOTO_14, Assets.PHOTO_15, Assets.PHOTO_16);
			//soundArray = new Array(Assets.SND_DOOR_SQUEAK, Assets.SND_WALKING_01, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_02, Assets.SND_WALKING_05, Assets.SND_WALKING_04, Assets.SND_WALKING_03, Assets.SND_WALKING_06, Assets.SND_TILES_01);
			photoArray = new Array(Assets.PHOTO_09, Assets.PHOTO_10, Assets.PHOTO_11, Assets.PHOTO_12, Assets.PHOTO_13, Assets.PHOTO_14, Assets.PHOTO_15, Assets.PHOTO_16);
			soundArray = new Array(null, Assets.SND_TILES_01, Assets.SND_TILES_02, Assets.SND_TILES_03, Assets.SND_TILES_04, Assets.SND_WALKING_01, Assets.SND_WALKING_06, Assets.SND_TILES_05);
			
			currentPhoto = new PhotoBackdrop(photoArray[currentIndex], soundArray[currentIndex], Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION);
		}
		
		override public function added():void
		{
			nextPhoto();
			//FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], null, Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));
		}
		
		override public function update():void
		{
			if (currentIndex == photoArray.length && currentPhoto.fadeInComplete)
			{
				FP.world = new Game;
			}
			
			
			if (Input.mousePressed && currentPhoto.fadeInComplete)
			{
				nextPhoto();
			}
			super.update();
		}
		
		public function nextPhoto(fadeIn:Boolean = true):void
		{
			if (finished && !loop)
			{
				return;
			}
			
			if (currentIndex < photoArray.length)
			{
				lastPhoto = currentPhoto;
				lastPhoto.fadeOut();
				FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], soundArray[currentIndex], Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));
			}
			else
			{
				finished = true;
				currentIndex = 0;
				if (loop)
				{
					lastPhoto = currentPhoto;
					lastPhoto.fadeOut();
					FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], soundArray[currentIndex], Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));			
				}				
			}
			currentIndex++;
		}		
		
	}

}