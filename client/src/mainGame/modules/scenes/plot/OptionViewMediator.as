/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 下午3:53
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot {
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.view.OptionView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class OptionViewMediator extends StarlingMediator {
    [Inject]
    public var view:OptionView;
    public function OptionViewMediator() {
        super();
    }


    override public function onRegister():void {
        super.onRegister();
        view.addEventListener(PlotEvent.SELECT_OPTION,onSelectOption);
    }
    private function onSelectOption(e:Event):void {
        dispatch(new PlotEvent(e.type, e.data));
        trace(this, "on select option");
    }
}
}
