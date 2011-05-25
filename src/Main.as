package 
{
	import flash.utils.Timer;
	import flash.events.TimerEvent; 
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Main extends Engine
	{
		const SPLASHBGCOLOR:uint = 0xFFa9a3a3;
		const BACKGRNDCOLOR:uint = 0xFFFBB917;
		const SPLASHDURATION:Number = 7000;
				
		[Embed(source = '../fonts/SPEENS.TTF', embedAsCFF = "false", fontFamily = 'speedball2')]
		private const SPEEDBALL2_FONT:Class;
		
		var splashOver:Boolean;
		var myTimer:Timer
		
		public function Main():void 
		{
			
			super(600, 600, 60, false);
			Text.font = "speedball2";
			
			splashOver = false;
			trace("startSplash");
			FP.world = new SplashLevel();
			FP.screen.color = SPLASHBGCOLOR;
			myTimer = new Timer(SPLASHDURATION, 1);
			myTimer.addEventListener("timer", startGame); 
			myTimer.start();
		}
		
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}	
		
		private function startGame(event:TimerEvent):void 
		{
			trace("startGame");
			FP.world = new Level;
			FP.screen.color = BACKGRNDCOLOR;
		}

	}
	
}