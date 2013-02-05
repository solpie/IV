/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-5
 * Time: 下午5:59
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.plot.model.vo {
public class EventVO {
    public static const TYPE_DELAY:int = 0;
    public static const TYPE_DIALOGUE:int = 1;
    public static const TYPE_OPTION:int = 2;
    public static const TYPE_MOTION:int = 3;
    public static const TYPE_CG:int = 4;

    private var _id:int;
    public function set id(value:int):void
    {
        _id = value;
        _pId=_id/100;
    }
    public function get id():int
    {
        return _id;
    }
    public var type:int;
    public var params:Array = new Array();

    private var _pId:int;
    public function get plotId():int
    {
        return _pId;
    }
    public function EventVO() {
    }
}
}
