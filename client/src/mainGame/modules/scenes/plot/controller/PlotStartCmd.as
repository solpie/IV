/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-5
 * Time: 下午5:41
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot.controller {
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.model.vo.PlotVO;

import org.osmf.events.PlayEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class PlotStartCmd extends StarlingCommand {
    [Inject]
    public var model:PlotModel;
    [Inject]
    public var modelPlayer:PlayerModel;

    [Inject]
    public var event:PlotEvent;

    public function PlotStartCmd() {
        super();
    }

    override public function execute():void {
        if (event.hasPayload)
            model.currentPlotVO = model.getPlotVO(int(event.payload));
        //开始剧情事件
        dispatch(new PlotEvent(PlotEvent.EVENT_START,model.currentPlotVO.eventList.shift()))
    }

    private function eventStart(pVO:PlotVO):void {

    }
}
}
