/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-6
 * Time: 下午2:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import flash.events.MouseEvent;

import mainGame.model.GameModel;
import mainGame.model.events.GameEvent;

import org.robotlegs.mvcs.StarlingCommand;

import starling.display.DisplayObject;

public class WheelCmd extends StarlingCommand {
    [Inject]
    public var model:GameModel;
    [Inject]
    public var event:GameEvent;
    public function WheelCmd() {
        super();
    }

    override public function execute():void {
        for each(var obj:DisplayObject in model.wheelTouchDic)
        {
            trace(this, "wheel on ",obj);
            var func:Object=  model.wheelTouchFunc[obj];
            if(func)(func as Function)(event);
        }
    }
}
}
