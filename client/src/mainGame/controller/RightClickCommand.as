/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-1
 * Time: 下午7:59
 * To change this template use File | Settings | File Templates.
 */
package mainGame.controller {
import flash.events.MouseEvent;

import mainGame.model.AppModel;

import org.robotlegs.mvcs.StarlingCommand;

import starling.core.Starling;

import starling.display.DisplayObject;

public class RightClickCommand extends StarlingCommand {
    [Inject]
    public var modol:AppModel;
    public function RightClickCommand() {
        super();
    }
    override public function execute():void
    {
        for each(var obj:DisplayObject in modol.rightTouchList)
        {
//            obj
        }
        trace(this, "RightClickCommand");
    }
}
}
