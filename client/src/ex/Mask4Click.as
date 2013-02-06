/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-6
 * Time: 上午11:38
 * To change this template use File | Settings | File Templates.
 */
package ex {
import starling.display.DisplayObjectContainer;
import starling.display.Quad;

public class Mask4Click extends Quad {
    public function Mask4Click(parent:DisplayObjectContainer = null) {
        super(1, 1);
        if (parent)parent.addChild(this);
    }
}
}
