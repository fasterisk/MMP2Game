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
	public class TypeOverlay extends Entity 
	{
		
		[Embed(source = '../images/groundtiles.png')]
		private const typetiles:Class;
		
		private var tilemap:Tilemap;
		
		private var ttype:int;
		
		private var player1Field:Array;
		private var player2Field:Array;
		
		public function TypeOverlay():void
		{
			ttype = 1;
			tilemap = new Tilemap(typetiles, 400, 600, 40, 40);
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 15; j++)
				{
					tilemap.setTile(i, j, 0);
				}
			}
			
			tilemap.setTile(1, 11, 1);
			tilemap.setTile(3, 11, 2);
			tilemap.setTile(5, 11, 3);
			tilemap.setTile(2, 13, 4);
			tilemap.setTile(4, 13, 5);
			tilemap.setTile(9, 12, 1);
			
			graphic = tilemap;
			player1Field = new Array();
			player2Field = new Array();
			
			for (var i:int = 0; i < 10; i++)
			{
				player1Field[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				player2Field[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			}
		}
		
		public function setTile(posx:int, posy:int):void
		{
			tilemap.clearTile(posx, posy);
			tilemap.setTile(posx, posy, ttype);
		}
		
		public function setField(player:int, posx:int, posy:int):void
		{
			
		}
		
		
		override public function update():void
		{
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			
			if (!Input.mousePressed)
			{
				return;
			}
			
			if (mousex >= 40 && mousex <= 80 && mousey >= 440 && mousey <= 480)
			{
				ttype = 1;
			}
			else if (mousex >= 120 && mousex <= 160 && mousey >= 440 && mousey <= 480)
			{
				ttype = 2;
			}
			else if (mousex >= 200 && mousex <= 240 && mousey >= 440 && mousey <= 480)
			{
				ttype = 3;
			}
			else if (mousex >= 80 && mousex <= 120 && mousey >= 520 && mousey <= 560)
			{
				ttype = 4
			}
			else if (mousex >= 160 && mousex <= 240 && mousey >= 520 && mousey <= 560)
			{
				ttype = 5
			}
			setTile(9, 12);
		}
		
		public function getType():int
		{
			return ttype;
		}
		
		public function reset():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					tilemap.clearTile(i, j);
					tilemap.setTile(i, j, 0);
				}
			}
		}
	}
	
}