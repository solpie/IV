package mainGame.model.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		
		/**
		 *程序启动 
		 */		
		public static const APP_STARTUP:String="start up";
		/**
		 *全局键盘输入事件 payload keyboradEvent 
		 */		
		public static const APP_INPUT_KEY:String="App key";
		
	
		public function AppEvent(type:String,payload:Object=null)
		{
			super(type, false, false);
		}
	}
}