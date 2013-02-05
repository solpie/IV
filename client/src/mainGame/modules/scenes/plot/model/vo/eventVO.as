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

    public var id:int;
    public var type:int;
    public var params:Array = new Array();

    public function EventVO() {
    }
}
}
