/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午4:46
 * To change this template use File | Settings | File Templates.
 */
package mainGame.service.interfaces {
import mainGame.modules.player.model.PlayerModel;

public interface IServer {
    /**保存玩家信息
     */
     function savePlayerInfo(pInfo:PlayerModel):void;
}
}
