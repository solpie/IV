package mainGame.modules.scenes.login
{
import mainGame.model.GameModel;
import mainGame.modules.scenes.login.model.events.LoginEvent;
import mainGame.modules.scenes.login.view.LoginView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class LoginViewMediator extends StarlingMediator
	{
		[Inject] 
		public var view:LoginView;
        [Inject]
        public var model:GameModel;
		public function LoginViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			view.btnLogin.addEventListener(Event.TRIGGERED,onClick);
//            model.rightTouchList.push(view.btnLogin);
		}
		
		private function onClick(e:Event):void
		{
			dispatch(new LoginEvent((e.target as Object).name));
		}
		
	}
}