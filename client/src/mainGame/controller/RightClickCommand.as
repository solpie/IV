/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-1
 * Time: 下午7:59
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import flash.events.MouseEvent;

import mainGame.model.GameModel;
import mainGame.model.events.GameEvent;

import org.robotlegs.mvcs.StarlingCommand;

import starling.core.Starling;

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
        for each(var obj:DisplayObject in modol.rightTouchList)
        {
            if(obj.bounds.contains(event.payload.x,event.payload.y))
            {
                trace(this, "right click on ",obj);
                (modol.rightTouchFunc[obj] as Function)();
            }
        }
    }
}
}
