/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午5:34
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import flash.net.SharedObject;

import mainGame.service.ShareDataService;

import org.robotlegs.mvcs.StarlingCommand;

public class GameStartCommand extends StarlingCommand {
    [Inject]
    public var service:ShareDataService;
    public function GameStartCommand() {
        super();
    }

    override public function execute():void {
        super.execute();
        var s:SharedObject=SharedObject.getLocal("PlayerInfo");
        trace(this,"player name:", s.data.name);
    }
}
}
