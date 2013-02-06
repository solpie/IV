/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import flash.net.SharedObject;

import mainGame.model.events.GameEvent;

import mainGame.modules.scenes.plot.model.PlotModel;

import mainGame.service.ShareDataService;

import org.robotlegs.mvcs.StarlingCommand;

public class GameStartCmd extends StarlingCommand {
    [Inject]
    public var service:ShareDataService;

    public function GameStartCmd() {
        super();
    }

    override public function execute():void {
        super.execute();
        //加载剧情文件
        dispatch(new GameEvent(GameEvent.LOAD_PLOT));
        var s:SharedObject = SharedObject.getLocal("PlayerInfo");
        trace(this, "player name:", s.data.name);
    }
}
}
