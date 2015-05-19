package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	
	
	public class Ecard extends MovieClip {
		
		
		public function Ecard() {
			// constructor code
			replayBtn2.visible = false;
			replayBtn.visible = false;
			burnBtn.visible = false;
			saveBtn.visible = false;
			grass.visible = false;
			rain.visible = false;
			cloudBtn.visible = false;
			scene2.visible = false;
			var isPlaying:Boolean = false;
			var rainSound:Sound = new Sound();
			var rainChannel:SoundChannel = new SoundChannel();
			var breathSound:Sound = new Sound();
			var breathChannel:SoundChannel = new SoundChannel();
			breathSound.load(new URLRequest("fireBreath.mp3"));
			rainSound.load(new URLRequest("rain.mp3"));
			playBtn.addEventListener(MouseEvent.MOUSE_DOWN, startMovie);

			//this is the play button
			function startMovie (MouseEvent):void {
				rainChannel = rainSound.play(1 ,999);
				playBtn.visible = false;
				playBackground.visible = false;
				grass.visible = true;
				rain.visible = true;
				cloudBtn.visible = true;
				dragonOne.gotoAndPlay(2);
				rain.gotoAndPlay(2);
				isPlaying = true;
			}
			
			//This is the toggle button for the rain storm.
			cloudBtn.addEventListener (MouseEvent.MOUSE_DOWN, onClickStop);
				function onClickStop(e:MouseEvent):void{
					if(isPlaying != true){
						rain.visible = true;
						rain.gotoAndPlay(2);
						isPlaying = true;
						rainChannel = rainSound.play(1,999);
					}
					else{
						rainChannel.stop();
						rain.stop();
						rain.visible=false;
						isPlaying = false;
					}
				}
				
			//This is the "burn" buton
			burnBtn.addEventListener(MouseEvent.MOUSE_DOWN, startBurn);
				function startBurn (MouseEvent):void {
					burnBtn.visible = false;
					saveBtn.visible = false;
					dragonOne.visible = false;
					stickMan.gotoAndPlay(2);
					dragonFire.gotoAndPlay(2);
					//trying out a delay function on my sound clip
					function PlaySound(event:Event):void {
						breathChannel = breathSound.play();
					}
					var delay :Timer = new Timer(600, 1 );
					delay.addEventListener(TimerEvent.TIMER_COMPLETE, PlaySound);
					delay.start();
				}
				
			//This is the "save" button
			saveBtn.addEventListener(MouseEvent.MOUSE_DOWN, startSave);
				function startSave (MouseEvent):void {
				scene3.gotoAndPlay(2);
				rain.gotoAndStop(1);
				rainChannel.stop();
				flyText.gotoAndStop(1);
				//trying out another delay function, these work great unless you have 
				//computer with a slow processor.
				function PlaySound(event:Event):void {
						breathChannel = breathSound.play();
					}
					var delay :Timer = new Timer(1000, 1 );
					delay.addEventListener(TimerEvent.TIMER_COMPLETE, PlaySound);
					delay.start();
				}
				
			//This is the replay button for "scene2"
			replayBtn.addEventListener(MouseEvent.MOUSE_DOWN, restart);
			function restart (MouseEvent):void {
				rainChannel = rainSound.play(1 ,999);
				dragonOne.gotoAndPlay(2);
				flyText.gotoAndPlay(1);
				smoke.gotoAndPlay(1);
				rain.gotoAndPlay(2);
				MovieClip(root).stickMan.gotoAndPlay(1);
				scene2.gotoAndStop(1);
				dragonFire.gotoAndPlay(1);
				rotFlame.gotoAndStop(1);
				rotFlame.visible = true;
				replayBtn.visible = false;
				cloudBtn.visible = true;
				dragonOne.visible = true;
				rain.visible = true;
			}
			
			//This is the replay button for "scene3"
			replayBtn2.addEventListener(MouseEvent.MOUSE_DOWN, restart2);
			function restart2(MouseEvent):void{
				rainChannel = rainSound.play(1,999);
				dragonOne.gotoAndPlay(2);
				rain.gotoAndPlay(2);
				scene3.gotoAndPlay(1);
				replayBtn2.visible = false;
				burnBtn.visible = false;
				saveBtn.visible = false;
			}
		}
	}
	
}
