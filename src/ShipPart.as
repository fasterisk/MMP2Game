package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class ShipPart extends Entity 
	{
		[Embed(source = '../images/bottomtiles.png')]
		private const bottomtiles:Class;
		
		private var tilemap:Tilemap;
		
		public function ShipPart():void 
		{
			tilemap = new Tilemap(bottomtiles, 600, 200, 40, 40);
			
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 5; j++)
				{
					tilemap.setTile(i, j, 0);
				}
			}
			tilemap.setTile(9, 4, 10);
			tilemap.setTile(10, 0, 1);tilemap.setTile(11, 0, 2);tilemap.setTile(12, 0, 2);tilemap.setTile(13, 0, 2);tilemap.setTile(14, 0, 3);
			tilemap.setTile(10, 1, 4); tilemap.setTile(11, 1, 9); tilemap.setTile(12, 1, 9); tilemap.setTile(13, 1, 9); tilemap.setTile(14, 1, 8);
			tilemap.setTile(10, 2, 4); tilemap.setTile(11, 2, 9); tilemap.setTile(12, 2, 9); tilemap.setTile(13, 2, 9); tilemap.setTile(14, 2, 8);
			tilemap.setTile(10, 3, 4); tilemap.setTile(11, 3, 9); tilemap.setTile(12, 3, 9); tilemap.setTile(13, 3, 9); tilemap.setTile(14, 3, 8);
			tilemap.setTile(10, 4, 5); tilemap.setTile(11, 4, 6); tilemap.setTile(12, 4, 6); tilemap.setTile(13, 4, 6); tilemap.setTile(14, 4, 7);
			
			graphic = tilemap;
		}
	}
	
}