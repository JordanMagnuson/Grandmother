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
		public var canvas:Canvas = new Canvas(FP.width, FP.height);
		public var image:Image = new Image(Assets.DUST);
		public var cleanRadius:Number = 20; //radius of our circle clean
		
		public function Dust() 
		{
			canvas.drawGraphic(0, 0, image);
			width = FP.width;
			height = FP.height;
			graphic = canvas;
		}
		
		override public function update():void 
		{
			//when user click on dust
			if (Input.mouseDown) {
				if (collidePoint(x, y, world.mouseX, world.mouseY))
				{			
					//we make holes ! ))
					clean(FP.world.mouseX, FP.world.mouseY, cleanRadius);
				}
			}
			
			super.update();
		}		
		
		/**
		 * @method clean
		 * let's make holes in our image
		 * 
		 * @param bx,by - coordinates
		 * @param bRad - blow radius
		 */
		private function clean(bx:Number,by:Number,bRad:Number):void
		{
			trace('clean');
			//
			// i choosed circle holes. You may prefer other form.
			//
			var blow:Image = Image.createCircle(bRad, 0xFFFFFF, 0.1); //create circle image
				blow.blend = BlendMode.ERASE; //we will cut holes :)
				
				canvas.drawGraphic(bx - blow.width / 2, by - blow.height / 2, blow);  //add hole to image
				//canvas.update();
				//render();
				//updateMask(); //redraw pixelMask of level
		}			
		
	}

}