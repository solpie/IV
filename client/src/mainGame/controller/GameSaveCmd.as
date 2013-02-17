/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-17
 * Time: 下午3:52
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import mainGame.modules.player.model.PlayerModel;
import mainGame.service.ShareDataService;

import org.robotlegs.mvcs.StarlingCommand;

public class GameSaveCmd extends StarlingCommand {
    [Inject]
    public var playerModel:PlayerModel;
    [Inject]
    public var service:ShareDataService;
    public function GameSaveCmd() {
        super();
    }

    override public function execute():void {
        super.execute();
        service.savePlayerInfo(playerModel);
    }
}
}
