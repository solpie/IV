package mainGame.scenes.login.view
{
import mainGame.model.AppModel;
import mainGame.scenes.login.model.events.LoginEvent;
	import mainGame.scenes.login.view.components.LoginView;

import org.osmf.layout.ScaleModeUtils;

import org.robotlegs.mvcs.StarlingMediator;
	
	import starling.events.Event;
	
	public class LoginViewMediator extends StarlingMediator
	{
		[Inject] 
		public var view:LoginView;
        [Inject]
        public var model:AppModel;
		public function LoginViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			view.btnLogin.addEventListener(Event.TRIGGERED,onClick);
            model.rightTouchList.push(view.btnLogin);
		}
		
		private function onClick(e:Event):void
		{
			dispatch(new LoginEvent((e.target as Object).name));
		}
		
	}
}