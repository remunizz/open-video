package
{
	import com.openVideo.core.OpenVideo;
	import com.openVideo.data.BMDClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author Renan Muniz
	 */
	public class Main extends Sprite
	{
		[Embed(source = "../assets/textures/noscale/atlas.png")]
		private var atlasClass:Class;
		
		public const VIDEO_URL:String = "http://mirror.cessen.com/blender.org/peach/trailer/trailer_iphone.m4v";
		
		/**
		 * Constructor
		 */
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			generateVideo();
		}
		
		private function generateVideo():void 
		{
			var openVideo:OpenVideo = new OpenVideo(stage, VIDEO_URL);
			this.addChild(openVideo);
			
			var bmp:Bitmap = new atlasClass() as Bitmap;
			var bmd:BitmapData = bmp.bitmapData;
			
			var i:int = 10;
			var pool:Vector.<BMDClip> = new Vector.<BMDClip>(i);
			for (i; i >= 0; i--)
			{
				pool[i] = new BMDClip(bmd, new Rectangle(126, 654, 166, 164));
			}
			openVideo.addPool(pool);
			openVideo.startScreenMovie();
		}
		
		private function deactivate(e:Event):void
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
		}
	
	}

}