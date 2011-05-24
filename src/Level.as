package 
{
	
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Level extends World 
	{

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
			
			hideout2.rotate();
			hideout3.rotate();
			hideout4.rotate();
			hideout5.rotate();
			hideout6.rotate();
			
		}
	}
	
}