/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.player.model {
import flash.utils.Dictionary;

import mainGame.modules.scenes.plot.view.PlotView;

import org.robotlegs.mvcs.Actor;

public class PlayerModel extends Actor {
    //人物属性
    public var name:String = "iv";
    public var id:int;
    //剧情信息
    public var currentPlot:int=10001;
    public var endPlotList:Array;
    //n 周目
    public var round:int = 1;
    public function PlayerModel() {
        super();
        init();
    }

    private function init():void {
        endPlotList=new Array();

    }
    //完成当前剧情，选择播放下一个剧情
    public function selectPlot(pId:int):void {
        endPlotList.push(currentPlot);
        currentPlot=pId;
    }
}
}
