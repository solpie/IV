package mainGame
{

import flash.events.MouseEvent;
import flash.geom.Point;

import mainGame.controller.RightClickCommand;
import mainGame.model.GameModel;
	import mainGame.model.events.GameEvent;

import mainGame.modules.config.ConfigMediator;
import mainGame.modules.config.view.ConfigView;
import mainGame.modules.scenes.dialogue.controller.DialogueCommand;
	import mainGame.modules.scenes.dialogue.model.DialogueModel;
	import mainGame.modules.scenes.dialogue.model.events.DialogueEvent;
	import mainGame.modules.scenes.dialogue.DialogueViewMediator;
	import mainGame.modules.scenes.dialogue.view.DialogueView;
	import mainGame.modules.scenes.login.controller.LoginCommand;
	import mainGame.modules.scenes.login.model.events.LoginEvent;
	import mainGame.modules.scenes.login.LoginViewMediator;
	import mainGame.modules.scenes.login.view.LoginView;
	import mainGame.service.ByteArrayService;
	
	import org.robotlegs.mvcs.StarlingContext;

import starling.core.Starling;

import starling.display.DisplayObjectContainer;
	
	public class GameContext extends StarlingContext
	{
		public function GameContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
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
			dispatchEvent(new GameEvent(GameEvent.APP_STARTUP,"start up"));
            Starling.current.nativeStage.addEventListener(MouseEvent.RIGHT_CLICK,onRightClick);
			trace("[Context]App Start up");
			super.startup();
		}
        private function onRightClick(e:MouseEvent):void
        {
            dispatchEvent(new GameEvent(GameEvent.APP_INPUT_RIGHT,new Point(e.localX,e.localY)));
            trace(this, "onRightClick");
        }
		
		private function mapMembership():void
		{
			//			injector.mapClass(PaletteService,PaletteService);
		}
		private function mapModel():void
		{
			injector.mapSingleton(GameModel);
			injector.mapSingleton(DialogueModel);
			//service
			injector.mapSingleton(ByteArrayService);
		}
		
		private function mapView():void
		{
			mediatorMap.mapView(DialogueView,DialogueViewMediator);
			mediatorMap.mapView(LoginView,LoginViewMediator);
			mediatorMap.mapView(ConfigView,ConfigMediator);
		}
		
		private function mapController():void
		{
			commandMap.mapEvent(GameEvent.APP_INPUT_RIGHT,RightClickCommand);

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