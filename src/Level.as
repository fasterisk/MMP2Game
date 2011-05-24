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
			
			
		}
	}
	
}