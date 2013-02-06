/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-5
 * Time: 下午6:49
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {

import flash.events.Event;

import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.vo.IncidentVO;
import mainGame.modules.scenes.plot.model.vo.PlotVO;
import mainGame.service.ByteArrayService;

import org.robotlegs.mvcs.StarlingCommand;

public class LoadPlotCommand extends StarlingCommand {
    [Inject]
    public var plotModel:PlotModel;
    [Inject]
    public var service:ByteArrayService;

    public function LoadPlotCommand() {
        super();
    }

    override public function execute():void {
        super.execute();
        service.loadURL("config/plot.xml",loadPlot);
        service.loadURL("config/event.xml",loadEvent);
//        loadPlot();
//        loadEvent();
        trace(this, "加载剧情配置文件");
    }

    private function loadPlot(e:Event):void {
//        var plotXML:XML = new XML(embedPlot.plotXML);
        var plotXML:XML = new XML(e.target.data);
        var plotVO:PlotVO;
        for each(var item:Object in plotXML.children()) {
            plotVO = new PlotVO();
            plotVO.id = item.@id;
            plotVO.name = item.@name;
            plotVO.title = item.@title;
            plotVO.skip = Boolean(item.@skip);
            plotModel.setPlot(plotVO.id, plotVO);
        }
    }

    private function loadEvent(e:Event):void {
        var eventXML:XML = new XML(e.target.data);
//        var eventXML:XML = new XML(embedPlot.eventXML);
        var eventVO:IncidentVO;
        for each(var item:Object in eventXML.children()) {
            eventVO = new IncidentVO();
            eventVO.id = item.@id;
            eventVO.type = item.@type;
            eventVO.params = item.@params.split("-");
            plotModel.setIncident(eventVO.id, eventVO);
        }
    }
}
}
