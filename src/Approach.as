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
		public function Approach() 
		{
			
		}
		
		override public function begin():void
		{
			add(Global.photoController = new PhotoController);
			Global.SndAmbient.loop();
			add(new MouseControllerApproach);
		}
		
	}

}