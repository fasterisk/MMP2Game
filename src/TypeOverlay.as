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
			if (player == 1)
			{
				player1Field[posx][posy] = ttype;
			}
			else
			{
				player2Field[posx][posy] = ttype;
			}
		}
		
		public function setWrong(player:int, posx:int, posy:int)
		{
			if (player == 1)
			{
				player1Field[posx][posy] = 6;
				tilemap.clearTile(posx, posy);
				tilemap.setTile(posx, posy, 6);
			}
			else
			{
				player2Field[posx][posy] = 6;
				tilemap.clearTile(posx, posy);
				tilemap.setTile(posx, posy, 6);
			}
		}
		
		public function setWrongPlace(player:int, posx:int, posy:int)
		{
			tilemap.clearTile(posx, posy);
			tilemap.setTile(posx, posy, 7);
			if (player == 1)
			{
				player1Field[posx][posy] = 7;
			}
			else
			{
				player2Field[posx][posy] = 7;
			}
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
		
		public function setPlayer1Tiles():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					tilemap.clearTile(i, j);
					tilemap.setTile(i, j, player1Field[i][j]);
				}
			}
		}
		
		public function setPlayer2Tiles():void
		{
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					tilemap.clearTile(i, j);
					tilemap.setTile(i, j, player2Field[i][j]);
				}
			}
		}
		
		public function printPlayer1Field():void 
		{
			trace(player1Field[0][0] + " " + player1Field[1][0] + " " + player1Field[2][0] + " " + player1Field[3][0] + " " + player1Field[4][0] + " " + player1Field[5][0] + " " + player1Field[6][0] + " " + player1Field[7][0] + " " + player1Field[8][0] + " " + player1Field[9][0]);
			trace(player1Field[0][1] + " " + player1Field[1][1] + " " + player1Field[2][1] + " " + player1Field[3][1] + " " + player1Field[4][1] + " " + player1Field[5][1] + " " + player1Field[6][1] + " " + player1Field[7][1] + " " + player1Field[8][1] + " " + player1Field[9][1]);
			trace(player1Field[0][2] + " " + player1Field[1][2] + " " + player1Field[2][2] + " " + player1Field[3][2] + " " + player1Field[4][2] + " " + player1Field[5][2] + " " + player1Field[6][2] + " " + player1Field[7][2] + " " + player1Field[8][2] + " " + player1Field[9][2]);
			trace(player1Field[0][3] + " " + player1Field[1][3] + " " + player1Field[2][3] + " " + player1Field[3][3] + " " + player1Field[4][3] + " " + player1Field[5][3] + " " + player1Field[6][3] + " " + player1Field[7][3] + " " + player1Field[8][3] + " " + player1Field[9][3]);
			trace(player1Field[0][4] + " " + player1Field[1][4] + " " + player1Field[2][4] + " " + player1Field[3][4] + " " + player1Field[4][4] + " " + player1Field[5][4] + " " + player1Field[6][4] + " " + player1Field[7][4] + " " + player1Field[8][4] + " " + player1Field[9][4]);
			trace(player1Field[0][5] + " " + player1Field[1][5] + " " + player1Field[2][5] + " " + player1Field[3][5] + " " + player1Field[4][5] + " " + player1Field[5][5] + " " + player1Field[6][5] + " " + player1Field[7][5] + " " + player1Field[8][5] + " " + player1Field[9][5]);
			trace(player1Field[0][6] + " " + player1Field[1][6] + " " + player1Field[2][6] + " " + player1Field[3][6] + " " + player1Field[4][6] + " " + player1Field[5][6] + " " + player1Field[6][6] + " " + player1Field[7][6] + " " + player1Field[8][6] + " " + player1Field[9][6]);
			trace(player1Field[0][7] + " " + player1Field[1][7] + " " + player1Field[2][7] + " " + player1Field[3][7] + " " + player1Field[4][7] + " " + player1Field[5][7] + " " + player1Field[6][7] + " " + player1Field[7][7] + " " + player1Field[8][7] + " " + player1Field[9][7]);
			trace(player1Field[0][8] + " " + player1Field[1][8] + " " + player1Field[2][8] + " " + player1Field[3][8] + " " + player1Field[4][8] + " " + player1Field[5][8] + " " + player1Field[6][8] + " " + player1Field[7][8] + " " + player1Field[8][8] + " " + player1Field[9][8]);
			trace(player1Field[0][9] + " " + player1Field[1][9] + " " + player1Field[2][9] + " " + player1Field[3][9] + " " + player1Field[4][9] + " " + player1Field[5][9] + " " + player1Field[6][9] + " " + player1Field[7][9] + " " + player1Field[8][9] + " " + player1Field[9][9]);	
		}
		
		public function printPlayer2Field():void 
		{
			trace(player2Field[0][0] + " " + player2Field[1][0] + " " + player2Field[2][0] + " " + player2Field[3][0] + " " + player2Field[4][0] + " " + player2Field[5][0] + " " + player2Field[6][0] + " " + player2Field[7][0] + " " + player2Field[8][0] + " " + player2Field[9][0]);
			trace(player2Field[0][1] + " " + player2Field[1][1] + " " + player2Field[2][1] + " " + player2Field[3][1] + " " + player2Field[4][1] + " " + player2Field[5][1] + " " + player2Field[6][1] + " " + player2Field[7][1] + " " + player2Field[8][1] + " " + player2Field[9][1]);
			trace(player2Field[0][2] + " " + player2Field[1][2] + " " + player2Field[2][2] + " " + player2Field[3][2] + " " + player2Field[4][2] + " " + player2Field[5][2] + " " + player2Field[6][2] + " " + player2Field[7][2] + " " + player2Field[8][2] + " " + player2Field[9][2]);
			trace(player2Field[0][3] + " " + player2Field[1][3] + " " + player2Field[2][3] + " " + player2Field[3][3] + " " + player2Field[4][3] + " " + player2Field[5][3] + " " + player2Field[6][3] + " " + player2Field[7][3] + " " + player2Field[8][3] + " " + player2Field[9][3]);
			trace(player2Field[0][4] + " " + player2Field[1][4] + " " + player2Field[2][4] + " " + player2Field[3][4] + " " + player2Field[4][4] + " " + player2Field[5][4] + " " + player2Field[6][4] + " " + player2Field[7][4] + " " + player2Field[8][4] + " " + player2Field[9][4]);
			trace(player2Field[0][5] + " " + player2Field[1][5] + " " + player2Field[2][5] + " " + player2Field[3][5] + " " + player2Field[4][5] + " " + player2Field[5][5] + " " + player2Field[6][5] + " " + player2Field[7][5] + " " + player2Field[8][5] + " " + player2Field[9][5]);
			trace(player2Field[0][6] + " " + player2Field[1][6] + " " + player2Field[2][6] + " " + player2Field[3][6] + " " + player2Field[4][6] + " " + player2Field[5][6] + " " + player2Field[6][6] + " " + player2Field[7][6] + " " + player2Field[8][6] + " " + player2Field[9][6]);
			trace(player2Field[0][7] + " " + player2Field[1][7] + " " + player2Field[2][7] + " " + player2Field[3][7] + " " + player2Field[4][7] + " " + player2Field[5][7] + " " + player2Field[6][7] + " " + player2Field[7][7] + " " + player2Field[8][7] + " " + player2Field[9][7]);
			trace(player2Field[0][8] + " " + player2Field[1][8] + " " + player2Field[2][8] + " " + player2Field[3][8] + " " + player2Field[4][8] + " " + player2Field[5][8] + " " + player2Field[6][8] + " " + player2Field[7][8] + " " + player2Field[8][8] + " " + player2Field[9][8]);
			trace(player2Field[0][9] + " " + player2Field[1][9] + " " + player2Field[2][9] + " " + player2Field[3][9] + " " + player2Field[4][9] + " " + player2Field[5][9] + " " + player2Field[6][9] + " " + player2Field[7][9] + " " + player2Field[8][9] + " " + player2Field[9][9]);	
		}
	}
	
}