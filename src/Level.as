package 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Level extends World 
	{
		
		private var phase:int;
		private var type:int;
		
		private var asdf:Boolean;
		
		[Embed(source = '../fonts/SPEENS.TTF', embedAsCFF = "false", fontFamily = 'speedball2')]
		private const JUMP_FONT:Class;

		private var hideouts:Array;
		private var hideout2:Hideout;
		private var hideout3:Hideout;
		private var hideout4:Hideout;
		private var hideout5:Hideout;
		private var hideout6:Hideout;
		
		private var confirm1:Boolean;
		private var shippart:ShipPart;
		
		private var confirm:MyText;
		private var actual:MyText;
		
		private var map:Map;
		private var overlayArray:Array;
		private var typeOverlay:TypeOverlay;
		var gameStatus1:Text;
		var gameStatus2:Text;
		var gameStatus3:Text;
		var gameStatus4:Text;
		
		public function Level():void
		{
			asdf = false;
			phase = 1;
			confirm1 = false;
			
			var random:int = Math.round(Math.random() * 5 + 1);
			trace(random);
			map = new Map(random);
			this.addGraphic(map.getImage());
			var overlay:Overlay = new Overlay();
			
			add(overlay);
			
			Text.font = "speedball2";
			Text.size = 28;
			
			confirm = new MyText("CONFIRM", 420, 300,0xFF400000, 28);
			
			
			
			var gameTitle:Text = new Text("BattleBunker", 420, 10);
			gameTitle.color = 0xFF400000;
			addGraphic(gameTitle);
			
			gameStatus1= new Text("gameStatus1 ____________", 410, 60);
			gameStatus1.color = 0xFF000000;
			gameStatus1.size = 14;
			addGraphic(gameStatus1);
			
			gameStatus2 = new Text("gameStatus2 ____________", 410, 80);
			gameStatus2.color = 0xFF000000;
			gameStatus2.size = 14;
			addGraphic(gameStatus2);
			
			gameStatus3 = new Text("gameStatus3 ____________", 410, 100);
			gameStatus3.color = 0xFF000000;
			gameStatus3.size = 14;
			addGraphic(gameStatus3);
			
			gameStatus4 = new Text("gameStatus4 ____________", 410, 120);
			gameStatus4.color = 0xFF000000;
			gameStatus4.size = 14;
			addGraphic(gameStatus4);
			
			
			hideout2 = new Hideout(2);
			hideout2.moveTo(0, 560);
			hideout3 = new Hideout(3);
			hideout3.moveTo(0, 480);
			hideout4 = new Hideout(4);
			hideout4.moveTo(320, 400);
			hideout5 = new Hideout(5);
			hideout5.moveTo(0, 400);
			hideout6 = new Hideout(6);
			hideout6.moveTo(200, 520);
			
			hideouts = new Array(hideout2, hideout3, hideout4, hideout5, hideout6);
			
			shippart = new ShipPart(hideouts);
			shippart.moveTo(0, 400);
			add(shippart);
			
			
			add(hideout2);
			add(hideout3);
			add(hideout4);
			add(hideout5);
			add(hideout6);
			
			hideout2.rotate();
			hideout3.rotate();
			hideout4.rotate();
			hideout5.rotate();
			hideout6.rotate();
			
		}
		
		override public function update():void
		{
			super.update();
			
			/*for (var i:int = 0; i < hideouts.length; i++)
			{
				for (var j:int = 0; j < hideouts.length; j++)
				{
					if (i != j && j > i)
					{
						var h1:Hideout = hideouts[i];
						var h2:Hideout = hideouts[j];
						
						if (h1.getEndX2() < h2.getX() || h1.getEndX() > h2.getX2()
						 || h1.getEndY2() < h2.getY() || h1.getEndY() > h2.getY2())
						{
							
						}
						else
						{
							h1.reset();
						}
					}
				}
			}*/
			switch(phase)
			{
				case 1: setGameStatus("PlayerOne,","please place your bunkers."); checkPositions(1); break;
				case 2: setGameStatus("PlayerOne, map the ground","where you placed your","bunkers with the actual","groundtype."); setTypes(1); break;
				case 3: setGameStatus("PlayerTwo,","please place your bunkers."); checkPositions(2); break;
				case 4: setGameStatus("PlayerTwo, map the ground","where you placed your","bunkers with the actual", "groundtype."); setTypes(2); break;
				case 6: if (asdf)
							return;
						setGameStatus("Let the battle begin!!!");
						asdf = true;
						map.printArray1();
						trace("----------------------");
						map.printArray2();
						break;
			}
			
		}
		
		private function checkPositions(player:int):void
		{
			var allinside:Boolean = true;
			for (var i:int = 0; i < hideouts.length; i++)
			{
				var hideout:Hideout = hideouts[i];
				allinside = allinside && hideout.insideField;
			}
			
			if (allinside)
			{
				if (!confirm1)
				{
					add(confirm);
					confirm1 = true;	
				}
				else
				{
					var mousex:int = FP.world.mouseX;
					var mousey:int = FP.world.mouseY;
					if (mousex >= 420 && mousex <= 580 && mousey >= 300 && mousey <= 328)
					{
						if (Input.mousePressed)
						{
							for (var j:int = 0; j < hideouts.length; j++)
							{
								hideouts[j].lock = true;
							}
							map.placeHideouts(hideouts, player);
							remove(confirm);
							remove(shippart);
							typeOverlay = new TypeOverlay();
							add(typeOverlay);
							actual = new MyText("Current type:", 300, 430, 0xFF000000, 28);
							add(actual);
							phase = player * 2;
							confirm1 = false;
						}
					}
				}
			}
			else
			{
				remove(confirm);
				confirm1 = false;
			}
		}
		
		public function setGameStatus(part1:String, part2:String="", part3:String ="",part4:String =""):void
		{
			gameStatus1.text = part1;
			gameStatus2.text = part2;
			gameStatus3.text = part3;
			gameStatus4.text = part4;
		}
		
		private function setTypes(player:int):void
		{
			if (!Input.mousePressed)
			{
				return;
			}
			
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			
			if (mousex < 400 && mousey < 400)
			{
				var diffx:int = mousex % 40;
				var diffy:int = mousey % 40;
			
				mousex -= diffx;
				mousey -= diffy;
			
				var posx:int = mousex / 40;
				var posy:int = mousey / 40;
			
				if (map.getPoint(player, posx, posy) != 0)
				{
					map.setPoint(player, typeOverlay.getType() , posx, posy);
					typeOverlay.setTile(mousex / 40, mousey / 40);
				}
			}
			
			if (map.checkTiles(player))
			{
				if (!confirm1)
				{
					add(confirm);
					confirm1 = true;
				}
				else {
					mousex = FP.world.mouseX;
					mousey = FP.world.mouseY;
					if (mousex >= 420 && mousex <= 580 && mousey >= 300 && mousey <= 328)
					{
						if (Input.mousePressed)
						{
							remove(confirm)
							add(shippart);
							remove(typeOverlay);
							for (var i:int = 0; i < hideouts.length; i++)
							{
								remove(hideouts[i]);
								add(hideouts[i]);
								hideouts[i].lock = false;
								hideouts[i].insideField = false;
							}
							hideout2.moveTo(0, 560);
							hideout3.moveTo(0, 480);
							hideout4.moveTo(320, 400);
							hideout5.moveTo(0, 400);
							hideout6.moveTo(200, 520);
							
							phase = player * 3;
						}
					}
				}
			}
		}
	}
	
}