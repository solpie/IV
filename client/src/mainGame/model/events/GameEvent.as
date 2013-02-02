package mainGame.model.events
{
import ex.EventFLA;

import flash.events.Event;
	
	public class GameEvent extends EventFLA
	{
		/**
		 *程序启动 
		 */		
		public static const APP_STARTUP:String="start up";
		/**
		 *全局键盘输入事件 payload keyboradEvent 
		 */		
		public static const APP_INPUT_KEY:String="App key";
		public static const APP_INPUT_RIGHT:String="App right click";
		public static const APP_INPUT_OVER_BUTTON:String="mouse over bottun";
		public function GameEvent(type:String,payload:Object=null)
		{
			super(type, payload);
		}
	}
}