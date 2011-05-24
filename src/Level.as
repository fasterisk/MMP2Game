package 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Level extends World 
	{
		
		[Embed(source = '../fonts/SPEENS.TTF', embedAsCFF = "false", fontFamily = 'speedball2')]
		private const JUMP_FONT:Class;

		private var map:Map;
		private var overlayArray:Array;
		
		public function Level():void
		{
			var random:int = Math.round(Math.random() * 5 + 1);
			trace(random);
			map = new Map(random);
			this.addGraphic(map.getImage());
			var overlay:Overlay = new Overlay();
			
			add(overlay);
			
			Text.font = "speedball2";
			Text.size = 28;
			
			var gameTitle:Text = new Text("BattleBunker", 420, 10);
			gameTitle.color = 0xFF400000;
			addGraphic(gameTitle);
			
			var gameStatus1:Text = new Text("gameStatus1", 410, 60);
			gameStatus1.color = 0xFF000000;
			gameStatus1.size = 14;
			addGraphic(gameStatus1);
			
			var gameStatus2:Text = new Text("gameStatus2", 410, 80);
			gameStatus2.color = 0xFF000000;
			gameStatus2.size = 14;
			addGraphic(gameStatus2);
			
			var shippart:ShipPart = new ShipPart();
			shippart.moveTo(0, 400);
			add(shippart);
			
			var hideout2:Hideout = new Hideout(2);
			hideout2.moveTo(0, 400);
			var hideout3:Hideout = new Hideout(3);
			hideout3.moveTo(80, 400);
			var hideout4:Hideout = new Hideout(4);
			hideout4.moveTo(0, 520);
			var hideout5:Hideout = new Hideout(5);
			hideout5.moveTo(160, 400);
			var hideout6:Hideout = new Hideout(6);
			hideout6.moveTo(240, 440);
			
			add(hideout2);
			add(hideout3);
			add(hideout4);
			add(hideout5);
			add(hideout6);
		}
	}
	
}