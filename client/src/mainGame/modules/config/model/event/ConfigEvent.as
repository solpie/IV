/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午5:15
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.config.model.event {
import ex.EventFLA;

public class ConfigEvent extends EventFLA {
    public static const SAVE_PLAYERINFO:String="存档";
    public function ConfigEvent(type:String, data:Object = null) {
        super(type, data);
    }
}
}
