/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午4:37
 * To change this template use File | Settings | File Templates.
 */
package mainGame.service {
import flash.net.SharedObject;

import mainGame.modules.player.model.PlayerModel;
import mainGame.service.interfaces.IServer;

import org.robotlegs.mvcs.Actor;

public class ShareDataService extends Actor implements IServer{
    public function ShareDataService() {
        super();
    }

    public function savePlayerInfo(pInfo:PlayerModel):void {
        //todo  保存哪些数据
        var s:SharedObject=SharedObject.getLocal(pInfo.name);
//        var s:SharedObject=SharedObject.getRemote("PlayerInfo");
        s.data.name = pInfo.name;
        s.flush();
        trace(this,"savePlayerInfo");
    }

    public function saveShareObject(shareObj:SharedObject):void {

    }
}
}
