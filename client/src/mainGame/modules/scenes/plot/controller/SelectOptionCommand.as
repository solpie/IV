/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 下午2:10
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot.controller {
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class SelectOptionCommand extends StarlingCommand {
    [Inject]
    public var model:PlayerModel;
    [Inject]
    public var modelPlot:PlotModel;

    [Inject]
    public var event:PlotEvent;

    public function SelectOptionCommand() {
        super();
    }

    override public function execute():void {
        var plotId:int = int(event.payload);
        model.selectPlot(plotId);
        //清除当前剧情数据
        modelPlot.clearCurrentPlot();
        trace(this, "select option command plot id:", plotId);
        //todo 播放下一个剧情
        dispatch(new PlotEvent(PlotEvent.PLOT_START));
    }
}
}
