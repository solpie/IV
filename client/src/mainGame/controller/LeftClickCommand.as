/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-6
 * Time: 下午12:09
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import mainGame.model.GameModel;

import org.robotlegs.mvcs.StarlingCommand;

import starling.display.DisplayObject;

public class LeftClickCommand extends StarlingCommand {
    [Inject]
    public var model:GameModel;
    public function LeftClickCommand() {
        super();
    }

    override public function execute():void {
        for each(var obj:DisplayObject in model.clickTouchDic)
        {
            trace(this, "left  click on ",obj);
            var func:Object=  model.clickTouchFunc[obj];
            if(func)(func as Function)();
        }
    }
}
}
