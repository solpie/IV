package mainGame
{
	
	import mainGame.model.AppModel;
	import mainGame.model.events.AppEvent;
	import mainGame.scenes.dialogue.controller.DialogueCommand;
	import mainGame.scenes.dialogue.model.DialogueModel;
	import mainGame.scenes.dialogue.model.events.DialogueEvent;
	import mainGame.scenes.dialogue.view.DialogueViewMediator;
	import mainGame.scenes.dialogue.view.components.DialogueView;
	import mainGame.scenes.login.controller.LoginCommand;
	import mainGame.scenes.login.model.events.LoginEvent;
	import mainGame.scenes.login.view.LoginViewMediator;
	import mainGame.scenes.login.view.components.LoginView;
	import mainGame.service.ByteArrayService;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.display.DisplayObjectContainer;
	
	public class AppContext extends StarlingContext
	{
		public function AppContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			mapMembership();
			mapModel();
			mapView();
			mapController();
			mapService();
			dispatchEvent(new AppEvent(AppEvent.APP_STARTUP,"start up"));
			trace("[Context]App Start up");
			super.startup();
		}
		
		private function mapMembership():void
		{
			//			injector.mapClass(PaletteService,PaletteService);
		}
		private function mapModel():void
		{
			injector.mapSingleton(AppModel);
			injector.mapSingleton(DialogueModel);
			//service
			injector.mapSingleton(ByteArrayService);
		}
		
		private function mapView():void
		{
			mediatorMap.mapView(DialogueView,DialogueViewMediator);
			mediatorMap.mapView(LoginView,LoginViewMediator);
		}
		
		private function mapController():void
		{
			commandMap.mapEvent(DialogueEvent.DIALOGUE_END,DialogueCommand);	
			commandMap.mapEvent(LoginEvent.LOGIN,LoginCommand);	
		}
		
		private function mapService():void
		{
			//			injector.mapSingletonOf(IQuickIO,ByteArrayService);
			
			//			injector.mapSingleton(ScriptService);
		}
	}
}