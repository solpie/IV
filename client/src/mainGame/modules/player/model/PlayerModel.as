/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-3
 * Time: 下午3:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.player.model {
import org.robotlegs.mvcs.Actor;

public class PlayerModel extends Actor {
    public var name:String = "iv";
    public var id:int;
    public var currentPlotId:int;
    public var endPlotList:Array;
    public function PlayerModel() {
        super();
        init();
    }

    private function init():void {
        endPlotList=new Array();
    }
    //完成当前剧情，选择下一个剧情
    public function selectPlot(pId:int):void {
        endPlotList.push(currentPlotId);
        currentPlotId=pId;
    }
}
}
