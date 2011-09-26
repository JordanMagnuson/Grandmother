package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import flash.ui.Mouse;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Jordan Magnuson
	 */
	public class MouseControllerApproach extends Entity
	{
		public var feetIcon:Image = new Image(Assets.FEET_ICON);
		public var magnifyingIcon:Image = new Image(Assets.MAGNIFYING_GLASS_ICON);
		
		public function MouseControllerApproach() 
		{
			feetIcon.centerOO();
			type = 'mouse_controller';
			layer = -1000;	
		}
		
		override public function added():void
		{
			Mouse.hide();
		}		
		
		override public function update():void
		{
			x = FP.world.mouseX;
			y = FP.world.mouseY;

			if (Global.photoController.currentPhoto.fadeInComplete)
			{
				if (Global.photoController.currentIndex == 15)
					graphic = magnifyingIcon;
				else 
					graphic = feetIcon;
				visible = true;					
			}
			else
			{
				visible = false;
			}	
			
			super.update();
		}		
	}

}