/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 下午5:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.config {
import mainGame.modules.config.view.ConfigView;
import mainGame.modules.player.model.PlayerModel;
import mainGame.service.ShareDataService;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class ConfigMediator extends StarlingMediator {
    [Inject]
    public var view:ConfigView;
    [Inject]
    public var service:ShareDataService;
    [Inject]
    public var model:PlayerModel;

    public function ConfigMediator() {
        super();
    }

    override public function onRegister():void
    {
        view.btnSave.addEventListener(Event.TRIGGERED,onSaveConfig);
    }

    private function onSaveConfig(e:Event):void {
        service.savePlayerInfo(model);
    }
}
}
