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
		
		[Embed(source = '../fonts/SPEENS.TTF', embedAsCFF = "false", fontFamily = 'speedball2')]
		private const JUMP_FONT:Class;

		private var hideouts:Array;
		
		private var confirm1:Boolean;
		private var shippart:ShipPart;
		
		private var confirm:MyText;
		private var actual:MyText;
		
		private var map:Map;
		private var overlayArray:Array;
		private var typeOverlay:TypeOverlay;
		
		public function Level():void
		{
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
			
			var gameStatus1:Text = new Text("gameStatus1", 410, 60);
			gameStatus1.color = 0xFF000000;
			gameStatus1.size = 14;
			addGraphic(gameStatus1);
			
			var gameStatus2:Text = new Text("gameStatus2", 410, 80);
			gameStatus2.color = 0xFF000000;
			gameStatus2.size = 14;
			addGraphic(gameStatus2);
			
			var hideout2:Hideout = new Hideout(2);
			hideout2.moveTo(0, 400);
			var hideout3:Hideout = new Hideout(3);
			hideout3.moveTo(80, 400);
			var hideout4:Hideout = new Hideout(4);
			hideout4.moveTo(0, 520);
			var hideout5:Hideout = new Hideout(5);
			hideout5.moveTo(160, 400);
			var hideout6:Hideout = new Hideout(6);
			hideout6.moveTo(240, 440);
			
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
			if (phase == 1)
			{
				checkPositions(); 
			}
			if (phase == 2)
			{
				setTypes();
			}
			
		}
		
		private function checkPositions():void
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
							map.placeHideouts(hideouts, 1);
							map.printArray1();
							remove(confirm);
							remove(shippart);
							typeOverlay = new TypeOverlay();
							add(typeOverlay);
							actual = new MyText("Actual type:", 300, 430, 0xFF000000, 28);
							add(actual);
							phase = 2;
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
		
		private function setTypes():void
		{
			if (!Input.mousePressed)
			{
				return;
			}
			
			var mousex:int = FP.world.mouseX;
			var mousey:int = FP.world.mouseY;
			
			if (mousex > 400 || mousey > 400)
			{
				return;
			}
			var diffx:int = mousex % 40;
			var diffy:int = mousey % 40;
			
			mousex -= diffx;
			mousey -= diffy;
			
			var posx:int = mousex / 40;
			var posy:int = mousey / 40;
			
			if (map.getPoint(1, posx, posy) != 0)
			{
				map.setPoint(1, typeOverlay.getType() , posx, posy);
				typeOverlay.setTile(mousex / 40, mousey / 40);
			}
			map.printArray1();
		}
	}
	
}