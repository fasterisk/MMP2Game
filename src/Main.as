package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Main extends Engine
	{
		const BACKGRNDCOLOR = 0xFFFBB917;
		
		public function Main():void 
		{
			
			super(600, 600, 60, false);
			FP.world = new Level;
			FP.screen.color = BACKGRNDCOLOR;
			
		}
		
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
		
	}
	
}