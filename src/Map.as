package
{
	import net.flashpunk.graphics.Image;
	import Math;
		
	public class Map
	{
		private var array1:Array;
		private var array2:Array;
		private var image:Image;
		
		[Embed(source = '../images/map1.png')]
		private const MAP1:Class;
		
		[Embed(source = '../images/map2.png')]
		private const MAP2:Class;
		
		[Embed(source = '../images/map3.png')]
		private const MAP3:Class;
		
		[Embed(source = '../images/map4.png')]
		private const MAP4:Class;
		
		[Embed(source = '../images/map5.png')]
		private const MAP5:Class;
		
		[Embed(source = '../images/map6.png')]
		private const MAP6:Class;
		
		
		public function Map(type:int):void 
		{
			switch(type)
			{
				case 1:image = new Image(MAP1); break; 
				case 2:image = new Image(MAP2); break; 
				case 3:image = new Image(MAP3); break; 
				case 4:image = new Image(MAP4); break;
				case 5:image = new Image(MAP5); break; 
				case 6:image = new Image(MAP6); break; 
			}
				
			array1 = new Array();
			array2 = new Array();
			for (var i:int = 0; i < 10; i++)
			{
				array1[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				array2[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			}
		}
		
		public function setPoint(player:int, type:int, posx:int, posy:int)
		{
			switch(player)
			{
				case 1: array1[posx][posy] = type; break;
				case 2: array2[posx][posy] = type; break;
			}
		}
		
		public function getPoint(player:int, posx:int, posy:int)
		{
			switch(player)
			{
				case 1: return array1[posx][posy];
				case 2: return array2[posx][posy];
			}
		}
		
		public function printArray1():void 
		{
			trace(array1[0][0] + " " + array1[1][0] + " " + array1[2][0] + " " + array1[3][0] + " " + array1[4][0] + " " + array1[5][0] + " " + array1[6][0] + " " + array1[7][0] + " " + array1[8][0] + " " + array1[9][0]);
			trace(array1[0][1] + " " + array1[1][1] + " " + array1[2][1] + " " + array1[3][1] + " " + array1[4][1] + " " + array1[5][1] + " " + array1[6][1] + " " + array1[7][1] + " " + array1[8][1] + " " + array1[9][1]);
			trace(array1[0][2] + " " + array1[1][2] + " " + array1[2][2] + " " + array1[3][2] + " " + array1[4][2] + " " + array1[5][2] + " " + array1[6][2] + " " + array1[7][2] + " " + array1[8][2] + " " + array1[9][2]);
			trace(array1[0][3] + " " + array1[1][3] + " " + array1[2][3] + " " + array1[3][3] + " " + array1[4][3] + " " + array1[5][3] + " " + array1[6][3] + " " + array1[7][3] + " " + array1[8][3] + " " + array1[9][3]);
			trace(array1[0][4] + " " + array1[1][4] + " " + array1[2][4] + " " + array1[3][4] + " " + array1[4][4] + " " + array1[5][4] + " " + array1[6][4] + " " + array1[7][4] + " " + array1[8][4] + " " + array1[9][4]);
			trace(array1[0][5] + " " + array1[1][5] + " " + array1[2][5] + " " + array1[3][5] + " " + array1[4][5] + " " + array1[5][5] + " " + array1[6][5] + " " + array1[7][5] + " " + array1[8][5] + " " + array1[9][5]);
			trace(array1[0][6] + " " + array1[1][6] + " " + array1[2][6] + " " + array1[3][6] + " " + array1[4][6] + " " + array1[5][6] + " " + array1[6][6] + " " + array1[7][6] + " " + array1[8][6] + " " + array1[9][6]);
			trace(array1[0][7] + " " + array1[1][7] + " " + array1[2][7] + " " + array1[3][7] + " " + array1[4][7] + " " + array1[5][7] + " " + array1[6][7] + " " + array1[7][7] + " " + array1[8][7] + " " + array1[9][7]);
			trace(array1[0][8] + " " + array1[1][8] + " " + array1[2][8] + " " + array1[3][8] + " " + array1[4][8] + " " + array1[5][8] + " " + array1[6][8] + " " + array1[7][8] + " " + array1[8][8] + " " + array1[9][8]);
			trace(array1[0][9] + " " + array1[1][9] + " " + array1[2][9] + " " + array1[3][9] + " " + array1[4][9] + " " + array1[5][9] + " " + array1[6][9] + " " + array1[7][9] + " " + array1[8][9] + " " + array1[9][9]);	
		}
		
		public function printArray2():void 
		{
			trace(array2[0][0] + " " + array2[1][0] + " " + array2[2][0] + " " + array2[3][0] + " " + array2[4][0] + " " + array2[5][0] + " " + array2[6][0] + " " + array2[7][0] + " " + array2[8][0] + " " + array2[9][0]);
			trace(array2[0][1] + " " + array2[1][1] + " " + array2[2][1] + " " + array2[3][1] + " " + array2[4][1] + " " + array2[5][1] + " " + array2[6][1] + " " + array2[7][1] + " " + array2[8][1] + " " + array2[9][1]);
			trace(array2[0][2] + " " + array2[1][2] + " " + array2[2][2] + " " + array2[3][2] + " " + array2[4][2] + " " + array2[5][2] + " " + array2[6][2] + " " + array2[7][2] + " " + array2[8][2] + " " + array2[9][2]);
			trace(array2[0][3] + " " + array2[1][3] + " " + array2[2][3] + " " + array2[3][3] + " " + array2[4][3] + " " + array2[5][3] + " " + array2[6][3] + " " + array2[7][3] + " " + array2[8][3] + " " + array2[9][3]);
			trace(array2[0][4] + " " + array2[1][4] + " " + array2[2][4] + " " + array2[3][4] + " " + array2[4][4] + " " + array2[5][4] + " " + array2[6][4] + " " + array2[7][4] + " " + array2[8][4] + " " + array2[9][4]);
			trace(array2[0][5] + " " + array2[1][5] + " " + array2[2][5] + " " + array2[3][5] + " " + array2[4][5] + " " + array2[5][5] + " " + array2[6][5] + " " + array2[7][5] + " " + array2[8][5] + " " + array2[9][5]);
			trace(array2[0][6] + " " + array2[1][6] + " " + array2[2][6] + " " + array2[3][6] + " " + array2[4][6] + " " + array2[5][6] + " " + array2[6][6] + " " + array2[7][6] + " " + array2[8][6] + " " + array2[9][6]);
			trace(array2[0][7] + " " + array2[1][7] + " " + array2[2][7] + " " + array2[3][7] + " " + array2[4][7] + " " + array2[5][7] + " " + array2[6][7] + " " + array2[7][7] + " " + array2[8][7] + " " + array2[9][7]);
			trace(array2[0][8] + " " + array2[1][8] + " " + array2[2][8] + " " + array2[3][8] + " " + array2[4][8] + " " + array2[5][8] + " " + array2[6][8] + " " + array2[7][8] + " " + array2[8][8] + " " + array2[9][8]);
			trace(array2[0][9] + " " + array2[1][9] + " " + array2[2][9] + " " + array2[3][9] + " " + array2[4][9] + " " + array2[5][9] + " " + array2[6][9] + " " + array2[7][9] + " " + array2[8][9] + " " + array2[9][9]);	
		}
		
		public function getImage():Image
		{
			return image;
		}
		
	}
}