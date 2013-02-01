package mainGame.scenes.login.view
{
	import mainGame.scenes.login.model.events.LoginEvent;
	import mainGame.scenes.login.view.components.LoginView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	import starling.events.Event;
	
	public class LoginViewMediator extends StarlingMediator
	{
		[Inject] 
		public var view:LoginView;
		public function LoginViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			view.btnLogin.addEventListener(Event.TRIGGERED,onClick);
		}
		
		private function onClick(e:Event):void
		{
			dispatch(new LoginEvent((e.target as Object).name));
		}
		
	}
}