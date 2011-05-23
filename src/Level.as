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
			var random:int = Math.round(Math.random()*6);
			map = new Map(random);
			this.addGraphic(map.getImage());
			overlayArray = new Array();
			
			
			for (var i:int = 0; i < 10; i++)
			{
				var overlay1:Overlay = new Overlay(i*40, 0);
				var overlay2:Overlay = new Overlay(i*40, 40);
				var overlay3:Overlay = new Overlay(i*40, 80);
				var overlay4:Overlay = new Overlay(i*40, 120);
				var overlay5:Overlay = new Overlay(i*40, 160);
				var overlay6:Overlay = new Overlay(i*40, 200);
				var overlay7:Overlay = new Overlay(i*40, 240);
				var overlay8:Overlay = new Overlay(i*40, 280);
				var overlay9:Overlay = new Overlay(i*40, 320);
				var overlay10:Overlay = new Overlay(i*40, 360);
				overlayArray[i] = [overlay1, overlay2, overlay3, overlay4, overlay5, overlay6, overlay7, overlay8, overlay9, overlay10];
				
				add(overlay1);
				add(overlay2);
				add(overlay3);
				add(overlay4);
				add(overlay5);
				add(overlay6);
				add(overlay7);
				add(overlay8);
				add(overlay9);
				add(overlay10);
			}
			
		}
	}
	
}