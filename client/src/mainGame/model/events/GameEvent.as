package mainGame.model.events
{
import ex.EventFLA;

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
		public static const LOAD_PLOT:String="加载剧情配置文件";
        //todo 弹出选项时自动存档    quicksave
		public static const SAVE_INFO:String="存档";
		public function GameEvent(type:String,payload:Object=null)
		{
			super(type, payload);
		}
	}
}