package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Overlay extends Entity 
	{
		var tilex:int;
		var tiley:int;
		
		[Embed(source = '../images/overlaytiles.png')]
		private const overlaytiles:Class;
		
		private var tilemap:Tilemap;
	
		public function Overlay():void
		{
			tilemap = new Tilemap(overlaytiles, 400, 400, 40, 40);
			
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					tilemap.setTile(i, j, 0);
				}
			}
			
			graphic = tilemap;
		}
		
		override public function update():void
		{
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			if (mousex < 400 && mousey < 400)
			{
				
				activateTile(Math.floor(mousex / 40), Math.floor(mousey / 40));
			}
		}
		
		private function activateTile(posx:int, posy:int)
		{
			if (tilex != posx || tiley != posy)
			{
				tilemap.clearTile(tilex,tiley);
				tilemap.setTile(tilex, tiley, 0);
			}
			tilex = posx;
			tiley = posy;
			tilemap.clearTile(posx,posy);
			tilemap.setTile(posx, posy, 1);
			graphic = tilemap;
		}
	}
	
}