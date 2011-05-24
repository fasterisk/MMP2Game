package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Florian & Loris
	 */
	public class MyText extends Entity 
	{
		public function MyText(text:String, posx:int, posy:int, color:uint, size:int):void
		{
			var textGraphic:Text = new Text(text, posx, posy);
			textGraphic.color = color;
			textGraphic.size = size;
			graphic = textGraphic;
		}
		
	}
	
}