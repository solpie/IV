package mainGame.scenes.login.model.events
{
	import ex.EventFLA;
	
	public class LoginEvent extends EventFLA
	{
		public static const LOGIN:String="登陆游戏";
		public static const EXIT:String="退出游戏";
		public function LoginEvent(type:String,data:Object=null)
		{
			super(type,data);
		}
	}
}