package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Overlay extends Entity 
	{
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
		
		
		
		private function activateTile(posx:int, posy:int)
		{
			tilemap.setTile(posx, posy, 1);
			graphic = tilemap;
		}
	}
	
}