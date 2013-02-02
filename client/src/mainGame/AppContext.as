package mainGame
{

import flash.events.MouseEvent;
import flash.geom.Point;

import mainGame.controller.RightClickCommand;
import mainGame.model.AppModel;
	import mainGame.model.events.AppEvent;
	import modules.scenes.dialogue.controller.DialogueCommand;
	import modules.scenes.dialogue.model.DialogueModel;
	import modules.scenes.dialogue.model.events.DialogueEvent;
	import modules.scenes.dialogue.view.DialogueViewMediator;
	import modules.scenes.dialogue.view.components.DialogueView;
	import modules.scenes.login.controller.LoginCommand;
	import modules.scenes.login.model.events.LoginEvent;
	import modules.scenes.login.view.LoginViewMediator;
	import modules.scenes.login.view.components.LoginView;
	import mainGame.service.ByteArrayService;
	
	import org.robotlegs.mvcs.StarlingContext;

import starling.core.Starling;

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
            Starling.current.nativeStage.addEventListener(MouseEvent.RIGHT_CLICK,onRightClick);
			trace("[Context]App Start up");
			super.startup();
		}
        private function onRightClick(e:MouseEvent):void
        {
            dispatchEvent(new AppEvent(AppEvent.APP_INPUT_RIGHT,new Point(e.localX,e.localY)));
            trace(this, "onRightClick");
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
			commandMap.mapEvent(AppEvent.APP_INPUT_RIGHT,RightClickCommand);

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