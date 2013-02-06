package mainGame {

import mainGame.controller.GameStartCmd;
import mainGame.controller.LeftClickCmd;
import mainGame.controller.LoadPlotCmd;
import mainGame.controller.RightClickCmd;
import mainGame.model.GameModel;
import mainGame.model.events.GameEvent;
import mainGame.modules.config.ConfigMediator;
import mainGame.modules.config.view.ConfigView;
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.login.LoginViewMediator;
import mainGame.modules.scenes.login.controller.LoginCommand;
import mainGame.modules.scenes.login.model.events.LoginEvent;
import mainGame.modules.scenes.login.view.LoginView;
import mainGame.modules.scenes.plot.OptionViewMediator;
import mainGame.modules.scenes.plot.PlotViewMediator;
import mainGame.modules.scenes.plot.controller.PageNextCmd;
import mainGame.modules.scenes.plot.controller.PagePreCmd;
import mainGame.modules.scenes.plot.controller.PlotStartCmd;
import mainGame.modules.scenes.plot.controller.SelectOptionCmd;
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.view.OptionView;
import mainGame.modules.scenes.plot.view.PlotView;
import mainGame.service.ByteArrayService;
import mainGame.service.ShareDataService;

import org.robotlegs.mvcs.StarlingContext;

import starling.display.DisplayObjectContainer;

public class GameContext extends StarlingContext {
    public function GameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }

    override public function startup():void {
        mapMembership();
        mapModel();
        mapView();
        mapController();
        mapService();
        dispatchEvent(new GameEvent(GameEvent.APP_STARTUP, "context start up"));
        trace(this, "App Start up");
        super.startup();
    }


    private function mapMembership():void {
        //			injector.mapClass(PaletteService,PaletteService);
    }

    private function mapModel():void {
        injector.mapSingleton(GameModel);
        injector.mapSingleton(PlayerModel);
        injector.mapSingleton(PlotModel);
        //service
        injector.mapSingleton(ByteArrayService);
        injector.mapSingleton(ShareDataService);
    }

    private function mapView():void {
        mediatorMap.mapView(PlotView, PlotViewMediator);
        mediatorMap.mapView(OptionView, OptionViewMediator);

        mediatorMap.mapView(LoginView, LoginViewMediator);
        mediatorMap.mapView(ConfigView, ConfigMediator);
    }

    private function mapController():void {
        commandMap.mapEvent(GameEvent.APP_STARTUP, GameStartCmd);
        commandMap.mapEvent(GameEvent.APP_INPUT_RIGHT, RightClickCmd);
        commandMap.mapEvent(GameEvent.APP_INPUT_LEFT, LeftClickCmd);

        commandMap.mapEvent(GameEvent.LOAD_PLOT, LoadPlotCmd);

        commandMap.mapEvent(PlotEvent.DIALOGUE_END, PageNextCmd);
        commandMap.mapEvent(PlotEvent.DIALOGUE_PRE, PagePreCmd);
        commandMap.mapEvent(PlotEvent.SELECT_OPTION, SelectOptionCmd);
        commandMap.mapEvent(PlotEvent.PLOT_START, PlotStartCmd);

        commandMap.mapEvent(LoginEvent.LOGIN, LoginCommand);
    }

    private function mapService():void {
        //			injector.mapSingletonOf(IQuickIO,ByteArrayService);

        //			injector.mapSingleton(ScriptService);
    }
}
}