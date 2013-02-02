package mainGame.modules.scenes.login.controller
{
	import mainGame.Game;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	public class LoginCommand extends StarlingCommand
	{
		public function LoginCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			Game.login();
			trace(this,"Game.login();");
		}
		
	}
}