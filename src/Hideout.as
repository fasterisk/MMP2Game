package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Hideout extends Entity 
	{
		private var dragging:Boolean;
		
		[Embed(source = '../images/hideouttiles.png')]
		private const tiles:Class;
		
		private var tilemap:Tilemap;
		
		private var twidth:int;
		private var theight:int;
		
		var offsetX:int;
		var offsetY:int;
		
		public function Hideout(size:int):void
		{
			dragging = false;
			switch(size)
			{
				case 2: 
					twidth = 40;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 3);
					break;
				case 3:
					twidth = 40;
					theight = 120;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 18);
					tilemap.setTile(0, 2, 3);
					break;
				case 4:
					twidth = 80;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 4);
					tilemap.setTile(1, 0, 5);
					tilemap.setTile(0, 1, 6);
					tilemap.setTile(1, 1, 7);
					break;
				case 5:
					twidth = 40;
					theight = 200;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
					tilemap.setTile(0, 0, 0);
					tilemap.setTile(0, 1, 8);
					tilemap.setTile(0, 2, 18);
					tilemap.setTile(0, 3, 8);
					tilemap.setTile(0, 4, 3);
					break;
				case 6:
					twidth = 120;
					theight = 80;
					tilemap = new Tilemap(tiles, twidth, theight, 40, 40);
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
	
	
		override public function update():void
		{
			var x2:int = x + twidth;
			var y2:int = y + theight;
			
			var inside:Boolean = false;
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			
			/*trace("x " + x);
			trace("y " + y);
			trace("mousex " + mousex);
			trace("mousey " + mousey);
			*/
			if (mousex >= x && mousex <= x2 && mousey >= y && mousey <= y2)
			{
				inside = true;
			}	
		
			if(Input.mousePressed && !dragging && inside)
			{
				dragging = true;
			}

			if(dragging && Input.mouseDown)
			{
				x = mousex - offsetX;
				y = mousey - offsetY;
			}

			if(Input.mouseReleased && dragging)
			{
				dragging = false;
			}
			
			offsetX = mousex - x;
			offsetY = mousey - y;
		}
	}
}