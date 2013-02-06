package mainGame.modules.scenes.plot.controller {
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class PageNextCmd extends StarlingCommand {
    [Inject]
    public var model:PlotModel;

    public function PageNextCmd() {
        super();
    }

    override public function execute():void {
        var strPage:String = model.getNextPage();
        dispatch(new PlotEvent(PlotEvent.DIALOGUE_SHOW_PAGE, strPage));
//			model.getNext();
        trace(this, "PageNextCmd", strPage);
    }

}
}