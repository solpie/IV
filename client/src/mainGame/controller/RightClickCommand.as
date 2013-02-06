/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-1
 * Time: 下午7:59
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import mainGame.model.GameModel;
import mainGame.model.events.GameEvent;

import org.robotlegs.mvcs.StarlingCommand;

import starling.display.DisplayObject;

public class RightClickCommand extends StarlingCommand {
    [Inject]
    public var modol:GameModel;
    [Inject]
    public var event:GameEvent;
    public function RightClickCommand() {
        super();
    }
    override public function execute():void
    {
        for each(var obj:DisplayObject in modol.rightTouchDic)
        {
            trace(this, "right click on ",obj);
            var func:Object=  modol.rightTouchFunc[obj];
            if(func)(func as Function)();
        }
    }
}
}
