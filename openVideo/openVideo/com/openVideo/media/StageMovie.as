package com.openVideo.media
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.StageVideoAvailabilityEvent;
	import flash.events.StageVideoEvent;
	import flash.events.StatusEvent;
	import flash.geom.Rectangle;
	import flash.media.StageVideo;
	import flash.media.StageVideoAvailability;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	/**
	 * ...
	 * @author Renan Muniz
	 */
	public class StageMovie extends Sprite
	{
		private var _stage:Stage;
		private var _sURL:String;
		private var _video:flash.media.StageVideo;
		private var _stream:NetStream;
		
		/**
		 * Constructor
		 * @param	stage
		 * @param	url
		 */
		public function StageMovie(stage:Stage, url:String)
		{
			//appDir.resolvePath("videos/rato_som_intro_ani.m4v").url
			this._sURL = url;
			this._stage = stage;
			
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		/**
		 * Initialize Class
		 * @param	e
		 */
		private function init(e:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this._stage.addEventListener(StageVideoAvailabilityEvent.STAGE_VIDEO_AVAILABILITY, availabilityChanged);
		}
		
		/**
		 * StageVideo Avaibility reponse and creation
		 * @param	e
		 */
		protected function availabilityChanged(e:StageVideoAvailabilityEvent):void
		{
			if (e.availability == StageVideoAvailability.AVAILABLE && _video == null)
			{
				var nc:NetConnection = new NetConnection();
				nc.addEventListener(NetStatusEvent.NET_STATUS, monitorStatus, false, 0, true);
				nc.connect(null);
				
				_stream = new NetStream(nc);
				_stream.client = this;
				_stream.addEventListener(IOErrorEvent.IO_ERROR, ioErrorEvent, false, 0, true);
				_stream.addEventListener(StatusEvent.STATUS, statusHandler, false, 0, true);
				
				_video = this._stage.stageVideos[0];
				_video.viewPort = new Rectangle(0, 0, this._stage.fullScreenWidth, this._stage.fullScreenHeight);
				_video.attachNetStream(_stream);
				
				_stream.play(this._sURL);
			}
		}
		
		/**
		 * Find Status
		 * @param	e
		 */
		private function monitorStatus(e:NetStatusEvent):void
		{
			if (Object(e.currentTarget).hasOwnProperty('bytesLoaded'))
				trace(Object(e.currentTarget).bytesLoaded, "x", Object(e.currentTarget).bytesTotal);
		}
		
		public function onBWDone():void
		{
			trace('onBWDone');
		}
		
		public function onMetaData(e:*):void
		{
			trace('onMetaData');
		}
		
		public function onXMPData(e:*):void
		{
			trace('onXMPData')
		}
		
		public function onPlayStatus(e:*):void
		{
			trace('onPlayStatus')
		}
		
		public function ioErrorEvent(e:IOErrorEvent):void
		{
			trace(e);
		}
		
		public function statusHandler(e:StatusEvent):void
		{
			trace(e);
		}
		
		public function stageVideoStateChange(e:StageVideoEvent):void
		{
			trace("CHANGE");
		}
	
	}
}