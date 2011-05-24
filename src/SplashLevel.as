package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class SplashLevel extends World 
	{
		var title:MyText;
		
		public function Level():void
		{
			title = new MyText("BattleBunker", 200, 40, 0xFF330000, 30);
			add(title);

			
			
		}
	}
	
}