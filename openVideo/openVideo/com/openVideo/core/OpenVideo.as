package com.openVideo.core
{
	import com.openVideo.data.BMDClip;
	import com.openVideo.display.Screen;
	import com.openVideo.media.StageMovie;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Renan Muniz
	 */
	public class OpenVideo extends Sprite
	{
		private var _stageVideo:StageMovie;
		private var _screen:Screen;
		
		/**
		 * Constructor
		 * @param	stage
		 * @param	url
		 */
		public function OpenVideo(flashStage:Stage, url:String)
		{
			this._stageVideo = new StageMovie(flashStage, url);
			this._screen = new Screen(flashStage.fullScreenWidth, flashStage.fullScreenHeight);
			
			this.addChild(this._screen);
			this.addChild(this._stageVideo);
		}
		
		public function startScreenMovie():void
		{
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function addPool(arBMDClips:Vector.<BMDClip>):void
		{
			this._screen.pool = arBMDClips;
		}
		
		public function update(e:Event):void
		{
			this._screen.update();
		}
		
	}

}