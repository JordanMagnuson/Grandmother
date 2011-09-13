package src 
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	
	/**
	 * Destructible level class
	 * See it working at http://megaswf.com/simple_serve/102175/
	 * @author liss
	 */
	public class Example extends Entity
	{
		
		[Embed(source='../lib/tiles_bricks.png')]	//tilemap asset
		private var blocks:Class;
		
		private var tiles:Tilemap;	//tilemap
		private var blowRadius:Number = 20; //radius of our circle blow
		
		public function Example() 
		{
			//let's draw very simple map just a big rectangle made of bricks
			tiles = new Tilemap(blocks,640,480,32,32);
			graphic = tiles;
			tiles.setRect(0, 7, 20, 8, 0);
			
			type = 'level';
			
			updateMask()	//draw pixelMask of level
		}
		
		override public function update():void 
		{
			//when user click on walls
			if(Input.mouseReleased){
				if (collidePoint(x, y,world.mouseX,world.mouseY))
				{
					//we make holes ! ))
					drill(world.mouseX,world.mouseY,blowRadius);
				};
			}
			super.update();
		}
		
		/**
		 * @method updateMask() 
		 * draws pixelMask based on tileMap BitmapData
		 */
		private function updateMask():void
		{
			var bmd:BitmapData = new BitmapData(640, 480, true, 0); //create new BitmapData object
				tiles.render(bmd, new Point(0, 0), new Point(FP.camera.x, FP.camera.y)); //get BitmapData from tileSet
				mask = new Pixelmask(bmd);	//redraw level pixelMask
		}
		
		/**
		 * @method drill
		 * let's make holes in our tilemMap
		 * 
		 * @param bx,by - coordinates
		 * @param bRad - blow radius
		 */
		private function drill(bx:Number,by:Number,bRad:Number):void
		{
			//
			// i choosed circle holes. You may prefer other form.
			//
			var blow:Image = Image.createCircle(bRad); //create circle image
				blow.blend = BlendMode.ERASE; //we will cut holes :)
				
				tiles.drawGraphic(bx - blow.width / 2, by - blow.height / 2, blow);  //add hole to tileMap
				updateMask(); //redraw pixelMask of level
		}
	}

}