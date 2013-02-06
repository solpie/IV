/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-6
 * Time: 下午1:58
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot.controller {
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class PagePreCmd extends StarlingCommand {
    [Inject]
    public var model:PlotModel;

    public function PagePreCmd() {
        super();
    }

    override public function execute():void {
        var strPage:String = model.getPrePage();
        dispatch(new PlotEvent(PlotEvent.DIALOGUE_SHOW_PAGE, strPage));
        trace(this, "PagePreCmd", strPage);
    }
}
}
