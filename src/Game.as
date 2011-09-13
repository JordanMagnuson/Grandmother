package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	
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
			add (new Entity(0, 0, new Backdrop(Assets.HEADSTONE)));
			add(new Dust);
			add(new Vase(482, 339))
		}
	}

}