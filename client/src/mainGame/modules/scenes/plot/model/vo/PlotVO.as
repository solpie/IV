/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-5
 * Time: 下午4:41
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot.model.vo {
public class PlotVO {
    public var id:int;
    public var name:String;
    public var title:String;
    public var skip:Boolean;
    public var eventList:Array=new Array();
    public function PlotVO() {
    }
}
}
