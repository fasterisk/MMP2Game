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
		{}
		
		public function playExplosion():void
		{
			explosion.play();
		}
		
		public function muteSound():void
		{
			FP.volume = 0;
		}
		
		public function activateSound():void
		{
			FP.volume = 1;
		}
		
	}

}