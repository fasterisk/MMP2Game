package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Hideout extends Entity 
	{
		
		[Embed(source = '../images/hideouttiles.png')]
		private const tiles:Class;
		
		private var tilemap:Tilemap;
		
		public function Hideout(size:int):void
		{
			switch(size)
			{
				case 2: 
					tilemap = new Tilemap(tiles, 40, 80, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 3);
					break;
				case 3:
					tilemap = new Tilemap(tiles, 40, 120, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 18);
					tilemap.setTile(0, 2, 3);
					break;
				case 4:
					tilemap = new Tilemap(tiles, 80, 80, 40, 40);
					tilemap.setTile(0, 0, 4);
					tilemap.setTile(1, 0, 5);
					tilemap.setTile(0, 1, 6);
					tilemap.setTile(1, 1, 7);
					break;
				case 5:
					tilemap = new Tilemap(tiles, 40, 200, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 8);
					tilemap.setTile(0, 2, 18);
					tilemap.setTile(0, 3, 8);
					tilemap.setTile(0, 4, 3);
					break;
				case 6:
					tilemap = new Tilemap(tiles, 120, 80, 40, 40);
					tilemap.setTile(0, 0, 4);
					tilemap.setTile(1, 0, 8);
					tilemap.setTile(2, 0, 5);
					tilemap.setTile(0, 1, 6);
					tilemap.setTile(1, 1, 9);
					tilemap.setTile(2, 1, 7);
					break;
			}
			
			graphic = tilemap;
		}
	}
	
}