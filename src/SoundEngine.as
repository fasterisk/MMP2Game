package  
{
	/**
	 * ...
	 * @author Loris
	 */
	import net.flashpunk.Sfx;
	import net.flashpunk.FP;
	
	public class SoundEngine 
	{
		
		[Embed(source = '../sounds/explosion.mp3')]
		private const EXPLOSION:Class;
		
		public var explosion:Sfx = new Sfx(EXPLOSION);

		public function SoundEngine() 
		{
			FP.volume = 0.5;
			
		}
		
		public function playExplosion()
		{
			explosion.play();
		}
		
	}

}