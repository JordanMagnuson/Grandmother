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
			photoArray = new Array(Assets.PHOTO_15, Assets.PHOTO_16);
			currentPhoto = new PhotoBackdrop(photoArray[currentIndex], null, Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION);
		}
		
		override public function added():void
		{
			nextPhoto();
			//FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], null, Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));
		}
		
		override public function update():void
		{
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
				FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], null, Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));
			}
			else
			{
				finished = true;
				currentIndex = 0;
				if (loop)
				{
					lastPhoto = currentPhoto;
					lastPhoto.fadeOut();
					FP.world.add(currentPhoto = new PhotoBackdrop(photoArray[currentIndex], null, Global.PHOTO_FADE_IN_DURATION, Global.PHOTO_FADE_OUT_DURATION));			
				}				
				FP.world = new Game;
			}
			currentIndex++;
		}		
		
	}

}