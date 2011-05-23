package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.TiledSpritemap;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class Overlay extends Entity 
	{
		[Embed(source = '../images/overlaytiles.png')]
		private const overlaytiles:Class;
		
		private var spritemap:Spritemap;
	
		public function Overlay(posx:int, posy:int):void
		{
			spritemap = new Spritemap(overlaytiles, 40, 40);
			spritemap.add("normal", [0], 20, true);
			spritemap.play("normal");
			graphic = spritemap;
			moveTo(posx, posy);
		}
	}
	
}