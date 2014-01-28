package com.openVideo.data
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Renan Muniz
	 */
	public class BMDClip
	{
		private var _rect:Rectangle;
		private var _bmd:BitmapData;
		
		private var _x:Number;
		private var _y:Number;
		
		/**
		 * Constructor
		 * @param	bitmapData
		 * @param	rect
		 */
		public function BMDClip(bitmapData:BitmapData, rect:Rectangle)
		{
			this._rect = rect;
			this._bmd = bitmapData;
			
			this._x = 0;
			this._y = 0;
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// GETS / SETS
		//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		public function get bitmapData():BitmapData
		{
			return _bmd;
		}
		
		public function get rectangle():Rectangle 
		{
			return _rect;
		}
		
		public function get x():Number 
		{
			return _x;
		}
		
		public function set x(value:Number):void 
		{
			_x = value;
		}
		
		public function get y():Number 
		{
			return _y;
		}
		
		public function set y(value:Number):void 
		{
			_y = value;
		}
	
	}

}