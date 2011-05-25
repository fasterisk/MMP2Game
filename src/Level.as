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
		
		private var player1:Boolean;
		private var player1Attempts:int;
		private var player2Attempts:int;
		
		private var validateCounter:int;
		
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
		private var player1Text:MyText;
		private var player2Text:MyText;
		private var attemptsText:MyText;
		private var player1AttemptsText:MyText;
		private var player2AttemptsText:MyText;
		
		private var map:Map;
		private var overlayArray:Array;
		private var typeOverlay:TypeOverlay;
		var gameStatus1:Text;
		var gameStatus2:Text;
		var gameStatus3:Text;
		var gameStatus4:Text;
		
		var sound:SoundEngine;
		
		public function Level():void
		{
			sound = new SoundEngine;
			player1 = true;
			phase = 1;
			confirm1 = false;
			player1Attempts = 100;
			player2Attempts = 100;
			
			validateCounter = 0;
			var random:int = Math.round(Math.random() * 5 + 1);
			trace(random);
			map = new Map(random);
			this.addGraphic(map.getImage());
			var overlay:Overlay = new Overlay();
			
			add(overlay);
			
			Text.font = "speedball2";
			Text.size = 28;
			
			confirm = new MyText("CONFIRM", 420, 300,0xFF400000, 28);
			player1Text = new MyText("Player 1", 420, 300, 0xFF400000, 28);
			player2Text = new MyText("Player 2", 420, 300, 0xFF400000, 28);
			attemptsText = new MyText("Attempts: ", 420, 330, 0xFF400000, 28);
			player1AttemptsText = new MyText("" + player1Attempts, 550, 330, 0xFF400000, 28);
			player2AttemptsText = new MyText("" + player2Attempts, 550, 330, 0xFF400000, 28);
						
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
			
			switch(phase)
			{
				case 1: setGameStatus("PlayerOne,","please place your bunkers."); checkPositions(1); break;
				case 2: setGameStatus("PlayerOne, map the ground","where you placed your","bunkers with the actual","groundtype."); setTypes(1); break;
				case 3: setGameStatus("PlayerTwo,","please place your bunkers."); checkPositions(2); break;
				case 4: setGameStatus("PlayerTwo, map the ground","where you placed your","bunkers with the actual", "groundtype."); setTypes(2); break;
				case 5: if (player1)
						{
							setGameStatus("PlayerOne," , "it's your turn!", "Go find some bunkers!");
							searchForHideouts(1);
						}
						else
						{
							setGameStatus("PlayerTwo," , "it's your turn!", "Go find some bunkers!");
							searchForHideouts(2);
						}
						break;
				case 6: startGame(); break;
				case 7: break;//add splash screen
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
							
							if (phase == 2)
							{
								remove(typeOverlay);
								add(shippart);
							}
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
							hideout6.moveTo(200, 480);
							
							phase = player * 3;
						}
					}
				}
			}
		}
		
		private function startGame():void
		{
			for (var i:int = 0; i < hideouts.length; i++)
			{
				remove(hideouts[i]);
			}
			typeOverlay.reset();
			add(player1Text);
			add(attemptsText);
			add(player1AttemptsText);
			phase = 5;
		}
		
		private function searchForHideouts(player:int):void
		{
			if (Input.mousePressed)
			{
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
					
					var point:int = map.getPoint(player % 2 +1, posx, posy);
					
					if (point >= 10)
						return;
				
					if (player == 1)
					{
						player1Attempts--;
						remove(player1AttemptsText);
						player1AttemptsText = new MyText("" + player1Attempts, 550, 330, 0xFF400000, 28);
						add(player1AttemptsText);
					}
					else
					{
						player2Attempts--;
						remove(player2AttemptsText);
						player2AttemptsText = new MyText("" + player2Attempts, 550, 330, 0xFF400000, 28);
						add(player2AttemptsText);
					}
					if (point != 0)
					{
						if (point == typeOverlay.getType())
						{
							validateCounter++;
							typeOverlay.setTile(posx, posy);
							typeOverlay.setField(player, posx, posy);
							map.setPoint(player % 2 + 1, typeOverlay.getType() + 10, posx, posy);
							sound.playExplosion();
						}
						else
						{
							validateCounter -= 2;
							typeOverlay.setWrong(player, posx, posy);
							typeOverlay.reset();
							player1 = !player1;
							if (player1)
							{
								typeOverlay.setPlayer1Tiles();
								remove(player2Text);
								remove(player2AttemptsText);
								add(player1Text);
								add(player1AttemptsText);
							}
							else
							{
								typeOverlay.setPlayer2Tiles();
								remove(player1Text);
								remove(player1AttemptsText);
								add(player2Text);
								add(player2AttemptsText);
							}
						}					
					}
					else
					{
						map.setPoint(player % 2 +1, 10, posx, posy);
						typeOverlay.setWrongPlace(player, posx, posy);
						typeOverlay.reset();
						player1 = !player1;
						if (player1)
						{
							typeOverlay.setPlayer1Tiles();
							remove(player2Text);
							remove(player2AttemptsText);
							add(player1Text);
							add(player1AttemptsText);
						}
						else
						{
							typeOverlay.setPlayer2Tiles();
							remove(player1Text);
							remove(player1AttemptsText);
							add(player2Text);
							add(player2AttemptsText);
						}
					}
				}
			}
			
			checkIfFinished(player);
		}
		
		public function checkIfFinished(player:int):void
		{
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					var point:int = map.getPoint(player % 2 + 1, i, j);
					if (point != 0 && point < 10)
					{
						return;
					}
				}
			}
			
			
			phase = 7;
		}
	}
	
}