package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class PhotoBackdrop extends Entity
	{
		public var backdrop:Backdrop;
		public var fadeInDuration:Number;
		public var fadeOutDuration:Number;
		public var fadeInComplete:Boolean = false;
		public var fadeTween:ColorTween;		
		
		public function PhotoBackdrop(backdropSource:* = null, soundSource:* = null, fadeInDuration:Number = 3, fadeOutDuration:Number = 3) 
		{
			backdrop = new Backdrop(backdropSource);
			super(0, 0, backdrop);
			this.fadeInDuration = fadeInDuration;
			this.fadeOutDuration = fadeOutDuration;
			layer = 100;	
		}
		
		override public function added():void
		{
			backdrop.alpha = 0;
			fadeIn();
		}		
		
		override public function update():void
		{
			if (backdrop) backdrop.alpha = fadeTween.alpha;
			super.update();
		}		
		
		public function fadeIn():void
		{
			fadeTween = new ColorTween(fadeInCallback);
			addTween(fadeTween);		
			fadeTween.tween(fadeInDuration, Colors.WHITE, Colors.WHITE, 0, 1);			
		}
		
		public function fadeInCallback():void
		{
			fadeInComplete = true;
		}
		
		public function fadeOut():void
		{
			fadeTween = new ColorTween(destroy);
			addTween(fadeTween);		
			fadeTween.tween(fadeOutDuration, Colors.WHITE, Colors.WHITE, backdrop.alpha, 0);				
		}		
		
		public function destroy():void
		{
			FP.world.remove(this);
		}		
		
	}

}