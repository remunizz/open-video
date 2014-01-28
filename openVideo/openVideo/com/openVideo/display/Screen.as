package com.openVideo.display
{
	import com.openVideo.data.BMDClip;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Renan Muniz
	 */
	public class Screen extends Sprite
	{
		private var _rect:Rectangle;
		private var _BMD:BitmapData;
		private var _BMP:Bitmap;
		
		private var _arBMDClips:Vector.<BMDClip>;
		
		/**
		 * Constructor
		 * @param	width
		 * @param	height
		 */
		public function Screen(width:Number, height:Number)
		{
			this._rect = new Rectangle(0, 0, width, height);
			setScreen();
			
			this.addEventListener(Event.REMOVED_FROM_STAGE, removedStage, false, 0, true);
		}
		
		private function removedStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedStage);
			destroy();
		}
		
		/**
		 * Destroy all objects
		 */
		private function destroy():void 
		{
			this._rect = null;
			this._BMD = null;
			this._BMP = null;
			
			this._arBMDClips = null;
		}
		
		/**
		 * Create a screen
		 */
		private function setScreen():void
		{
			this._BMD = new BitmapData(this._rect.width, this._rect.height, true, 0xFFFFFF);
			this._BMD.lock();
			this._BMP = new Bitmap(this._BMD);
			this.addChild(this._BMP);
		}
		
		/**
		 * Update screen
		 */
		public function update():void
		{
			this._BMD.fillRect(_rect, 0xFFFFFF);
			if (this._arBMDClips != null)
			{
				this._BMD.lock();
				
				var point:Point = new Point();
				var item:BMDClip;
				var i:int = this._arBMDClips.length - 1;
				for (i; i >= 0 ; i--)
				{
					item = this._arBMDClips[i];
					point.x = item.x;
					point.y = item.y;
					this._BMD.copyPixels(item.bitmapData, item.rectangle, point, null, null, true);
				}
				
				this._BMD.unlock();
			}
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GETS / SETS
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		public function get pool():Vector.<BMDClip>
		{
			return _arBMDClips;
		}
		
		public function set pool(value:Vector.<BMDClip>):void
		{
			_arBMDClips = value;
		}
	
	}
}