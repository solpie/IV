/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 下午5:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.config {
import mainGame.model.events.GameEvent;
import mainGame.modules.config.view.ConfigView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class ConfigMediator extends StarlingMediator {
    [Inject]
    public var view:ConfigView;

    public function ConfigMediator() {
        super();
    }

    override public function onRegister():void {
        view.btnSave.addEventListener(Event.TRIGGERED, onSaveConfig);
    }

    private function onSaveConfig(e:Event):void {
        dispatch(new GameEvent(GameEvent.SAVE_INFO));
    }
}
}
