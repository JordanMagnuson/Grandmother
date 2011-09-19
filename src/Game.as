package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Game extends World
	{
		
		public function Game() 
		{
		}
		
		override public function begin():void
		{
			trace('game begin');
			add(new MouseController);
			add(new Entity(0, 0, new Backdrop(Assets.HEADSTONE)));
			add(Global.dust = new Dust(208, 45));
			add(Global.vase = new Vase(482, 339));
			add(Global.bucket = new Bucket);
			add(Global.sponge = new Sponge);
		}
	}

}