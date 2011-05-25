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
		
		[Embed(source = '../sounds/badhit.mp3')]
		private const BADHIT:Class;
		
		[Embed(source = '../sounds/miss.mp3')]
		private const MISS:Class;
		
		/*[Embed(source = '../sounds/start.mp3')]
		private const START:Class;
		
		[Embed(source = '../sounds/victory.mp3')]
		private const VICTORY:Class;*/
		
		public var explosion:Sfx = new Sfx(EXPLOSION);
		public var badhit:Sfx = new Sfx(BADHIT);
		public var miss:Sfx = new Sfx(MISS);
		/*public var start:Sfx = new Sfx(START);
		public var victory:Sfx = new Sfx(VICTORY);*/
		

		public function SoundEngine() 
		{}
		
		public function playExplosion():void
		{
			explosion.play();
		}
		
		public function playBadHit ():void
		{
			badhit.play();
		}
		
		public function playMiss ():void
		{
			miss.play();
		}
		
		/*public function playStart ():void
		{
			start.play();
		}
		
		public function playVictory ():void
		{
			victory.play();
		}*/
		
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