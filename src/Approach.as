package  
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class Approach extends World
	{
		
		public function Approach() 
		{
			
		}
		
		override public function begin():void
		{
			add(new PhotoController);
		}
		
	}

}