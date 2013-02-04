package mainGame
{

import flash.events.MouseEvent;
import flash.geom.Point;

import mainGame.controller.GameStartCommand;
import mainGame.controller.RightClickCommand;
import mainGame.model.GameModel;
import mainGame.model.events.GameEvent;
import mainGame.modules.config.ConfigMediator;
import mainGame.modules.config.view.ConfigView;
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.dialogue.PlotViewMediator;
import mainGame.modules.scenes.dialogue.OptionViewMediator;
import mainGame.modules.scenes.dialogue.controller.DialogueCommand;
import mainGame.modules.scenes.dialogue.controller.SelectOptionCommand;
import mainGame.modules.scenes.dialogue.model.DialogueModel;
import mainGame.modules.scenes.dialogue.model.events.DialogueEvent;
import mainGame.modules.scenes.dialogue.view.PlotView;
import mainGame.modules.scenes.dialogue.view.OptionView;
import mainGame.modules.scenes.login.LoginViewMediator;
import mainGame.modules.scenes.login.controller.LoginCommand;
import mainGame.modules.scenes.login.model.events.LoginEvent;
import mainGame.modules.scenes.login.view.LoginView;
import mainGame.service.ByteArrayService;
import mainGame.service.ShareDataService;

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
			injector.mapSingleton(PlayerModel);
			injector.mapSingleton(DialogueModel);
			//service
			injector.mapSingleton(ByteArrayService);
			injector.mapSingleton(ShareDataService);
		}
		
		private function mapView():void
		{
			mediatorMap.mapView(PlotView,PlotViewMediator);
			mediatorMap.mapView(OptionView,OptionViewMediator);

			mediatorMap.mapView(LoginView,LoginViewMediator);
			mediatorMap.mapView(ConfigView,ConfigMediator);
		}
		
		private function mapController():void
		{
            commandMap.mapEvent(GameEvent.APP_STARTUP,GameStartCommand);
            commandMap.mapEvent(GameEvent.APP_INPUT_RIGHT,RightClickCommand);

			commandMap.mapEvent(DialogueEvent.DIALOGUE_END,DialogueCommand);
			commandMap.mapEvent(DialogueEvent.SELECT_OPTION,SelectOptionCommand);
			commandMap.mapEvent(LoginEvent.LOGIN,LoginCommand);
		}
		
		private function mapService():void
		{
			//			injector.mapSingletonOf(IQuickIO,ByteArrayService);
			
			//			injector.mapSingleton(ScriptService);
		}
	}
}