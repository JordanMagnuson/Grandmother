package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Dust extends Entity
	{
		public var canvas:Canvas;
		public var image:Image = new Image(Assets.DUST);
		public var cleanRadius:Number = 20; //radius of our circle clean
		
		public function Dust(x:Number = 0, y:Number = 0) 
		{
			canvas = new Canvas(image.width, image.height);
			super(x, y, canvas);
			type = 'dust';
			canvas.drawGraphic(0, 0, image);
			width = image.width;
			height = image.height;
		}
		
		override public function update():void 
		{
			super.update();
		}		
		
		/**
		 * @method clean
		 * let's make holes in our image
		 * 
		 * @param bx,by - coordinates
		 */
		public function clean(bx:Number = 0, by:Number = 0):void
		{
			//trace('clean');
			//var blow:Image = Image.createCircle(bRad, 0xFFFFFF, 0.1); //create circle image
			var blow:Image = new Image(Assets.SPONGE_MASK);
			blow.alpha = Global.sponge.saturation;
			blow.blend = BlendMode.ERASE; //we will cut holes :)
				
			canvas.drawGraphic(bx - blow.width / 2 - x, by - blow.height / 2 - y, blow);  //add hole to image
		}			
		
	}

}