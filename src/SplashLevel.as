package 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class SplashLevel extends World 
	{
		var title:MyText;
		var slogan1:MyText;
		var slogan2:MyText;
		var slogan3:MyText;
		
		[Embed(source = '../images/achmed.png')]
		private const ACHMED:Class;
		
		public function SplashLevel():void
		{
			Text.size = 36;
			title = new MyText("BattleBunker", 200, 20, 0xFF330000, 36);
			add(title);
			slogan1 = new MyText("Find your opponent's terrorist bunkers", 150, 60, 0xFF000000, 20);
			slogan2 = new MyText("before he finds yours!", 200, 82, 0xFF000000, 20);
			add(slogan1);
			add(slogan2);
			slogan3 = new MyText("The Battleship-Game on land with landcover validation.", 120, 570, 0xFF000000, 16);
			add(slogan3);
			addGraphic(new Image(ACHMED), 1, 120, 100);
		}
		
	}
	
}