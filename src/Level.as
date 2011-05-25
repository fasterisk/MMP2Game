package 
{
        import net.flashpunk.graphics.Image;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
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
		private var locked:Boolean;
		private var soundMuted:Boolean;
		
		private var phase:int;
		private var type:int;
		
		private var player1:Boolean;
		private var player1HasToFind:int;
		private var player2HasToFind:int;
		
		private var validateCounter:int;
		private var validationArray:Array;
		private var amountValidated:int;
		
		[Embed(source = '../fonts/SPEENS.TTF', embedAsCFF = "false", fontFamily = 'speedball2')]
		private const JUMP_FONT:Class;
		
		[Embed(source = '../images/p1won.png')]
		private const P1WON:Class;
		
		[Embed(source = '../images/p2won.png')]
		private const P2WON:Class;
		
		[Embed(source = '../images/clear.png')]
		private const CLEAR:Class;
		
		[Embed(source = '../images/soundmuted.png')]
		private const SOUNDMUTED:Class;
		
		[Embed(source = '../images/soundactivated.png')]
		private const SOUNDACTIVATED:Class;

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
		private var remaining:MyText;
		private var player1HasToFindText:MyText;
		private var player2HasToFindText:MyText;
		
		private var map:Map;
		private var overlayArray:Array;
		private var typeOverlay:TypeOverlay;
		var gameStatus1:Text;
		var gameStatus2:Text;
		var gameStatus3:Text;
		var gameStatus4:Text;
		var p1WonImage:Image;
		var p2WonImage:Image;
		private var clearImage:Image;
		
		var sound:SoundEngine;
		var gameOver:Boolean;
		
		var soundMutedImage:Image;
		var soundActivatedImage:Image;
		
		public function Level():void
		{
			startNewGame();
		}
		
		private function startNewGame():void
		{
			locked = false;
			gameOver = false;
			soundMuted = false;
			sound = new SoundEngine;
			player1 = true;
			phase = 1;
			confirm1 = false;
			
			validateCounter = 0;
			p1WonImage = new Image(P1WON);
			p2WonImage = new Image(P2WON);
			clearImage = new Image(CLEAR);
			
			soundActivatedImage = new Image(SOUNDACTIVATED);
			soundMutedImage = new Image(SOUNDMUTED);
			addGraphic(soundMutedImage, 0, 584, 384);
			addGraphic(soundActivatedImage, 0, 584, 384);
			soundMutedImage.visible = false;
			
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
			remaining = new MyText("Remaining:", 420, 330, 0xFF400000, 28);
						
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
			if (Input.mousePressed && mouseX<=600 && mouseX>=584 && mouseY<=400 && mouseY>=384)
			{
				if (soundMuted)
				{
					soundMuted = false;
					sound.activateSound();
					soundMutedImage.visible = false;
					soundActivatedImage.visible = true;
				}else
				{
					soundMuted = true;
					sound.muteSound();
					soundMutedImage.visible = true;
					soundActivatedImage.visible = false;
				}
			}
			
			
			super.update();
			if (locked)
			{
				return;
			}
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
				case 7: if (!gameOver)
						{
							if (player1)
							{
								addGraphic(p1WonImage);
							}else
							{
								addGraphic(p2WonImage);
							}
							gameOver = true;
							addValidation();
							countValidations();
							Text.size = 25;
							add(new MyText("You have successfully validated " + amountValidated + " Locations.", 10, 420, 0xFF000000, 25));
							add(new MyText("Click to restart the game", 100, 460, 0xFF000000, 25));
							trace("FINISHED"); 
						}
						else
						{
							if (Input.mousePressed)
							{
								addGraphic(clearImage);
								startNewGame();
							}
						}
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
								if (!hideouts[i].getRotation())
								{
									hideouts[i].rotate();
								}
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
			player1HasToFind = 0;
			player2HasToFind = 0;
			for (var j:int = 0; j < 10; j++)
			{
				for (var k:int = 0; k < 10; k++)
				{
					if (map.getPoint(1, j, k) > 0 && map.getPoint(1, j, k) < 11)
					{
						player2HasToFind++;
					}
					if (map.getPoint(2, j, k) > 0 && map.getPoint(2, j, k) < 11)
					{
						player1HasToFind++;
					}
				}
			}
			player1HasToFindText = new MyText("" + player1HasToFind, 420, 360, 0xF400000, 28);
			player2HasToFindText = new MyText("" + player2HasToFind, 420, 360, 0xF400000, 28);
			typeOverlay.reset();
			add(player1Text);
			add(player1HasToFindText);
			add(remaining);
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
				
					if (point != 0)
					{
						if (point == typeOverlay.getType())
						{
							validateCounter++;
							typeOverlay.setTile(posx, posy);
							typeOverlay.setField(player, posx, posy);
							map.setPoint(player % 2 + 1, typeOverlay.getType() + 10, posx, posy);
							sound.playExplosion();
							if (player == 1)
							{
								player1HasToFind--;
								remove(player1HasToFindText);
								player1HasToFindText = new MyText("" + player1HasToFind, 420, 360, 0xF400000, 28);
								add(player1HasToFindText)
							}
							else
							{
								player2HasToFind--;
								remove(player2HasToFindText);
								player2HasToFindText = new MyText("" + player2HasToFind, 420, 360, 0xF400000, 28);
								add(player2HasToFindText)
							}
						}
						else
						{
							validateCounter -= 2;
							typeOverlay.setWrong(player, posx, posy);
							locked = true;
							var timer:Timer = new Timer(2000, 1);
							timer.addEventListener("timer", changePlayer);
							timer.start();
						}					
					}
					else
					{
						map.setPoint(player % 2 +1, 10, posx, posy);
						typeOverlay.setWrongPlace(player, posx, posy);
						locked = true;
						var timer2:Timer = new Timer(2000, 1);
						timer2.addEventListener("timer", changePlayer);
						timer2.start();
						
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
		
		public function changePlayer(event:TimerEvent):void
		{
			typeOverlay.reset();
			player1 = !player1;
			if (player1)
			{
				typeOverlay.setPlayer1Tiles();
				remove(player2Text);
				add(player1Text);
				remove(player2HasToFindText);
				add(player1HasToFindText);
			}
			else
			{
				typeOverlay.setPlayer2Tiles();
				remove(player1Text);
				add(player2Text);
				remove(player1HasToFindText);
				add(player2HasToFindText);
			}
			
			locked = false;
		}
		
		public function addValidation():void
		{
			validationArray = new Array();
			
			for (var i:int = 0; i < 10; i++)
			{
				validationArray[i] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			}
			
			if (validateCounter < 0)
			{
				return;
			}
			
			for (var j:int = 0; j < 10; j++)
			{
				for (var k:int = 0; k < 10; k++)
				{
					var value1:int = map.getPoint(1, j, k);
					var value2:int = map.getPoint(2, j, k);
					
					if (value1 > 10)
					{
						validationArray[j][k] = value1;
					}
					else if (value2 > 10)
					{
						validationArray[j][k] = value2;
					}
				}
			}
		}
		
		private function countValidations():void 
		{
			amountValidated = 0;
			for (var i:int = 0; i < 10; i++)
			{
				for (var j:int = 0; j < 10; j++)
				{
					if (validationArray[i][j] > 10)
					{
						amountValidated++;
					}
				}
			}
		}
	}
	
}