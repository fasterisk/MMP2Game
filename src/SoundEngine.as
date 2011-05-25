package  
{
	/**
	 * ...
	 * @author Loris
	 */
	import net.flashpunk.Sfx;
	
	public class SoundEngine 
	{
		
		[Embed(source = '../sounds/explosion.mp3')]
		private const EXPLOSION:Class;
		
		public var explosion:Sfx = new Sfx(EXPLOSION);

		public function SoundEngine() 
		{
			
		}
		
		public function playExplosion()
		{
			explosion.play();
		}
		
	}

}