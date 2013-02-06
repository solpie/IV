package mainGame.model {
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.utils.AssetManager;

public class GameModel extends Actor {
    public var asset:AssetManager;
    public var rightTouchDic:Dictionary;
    public var rightTouchFunc:Dictionary;

    public function GameModel() {
        super();
        rightTouchDic = new Dictionary();
        rightTouchFunc = new Dictionary();
    }

    public function addRightClickHandle(obj:DisplayObject, func:Function):void {
        obj.addEventListener(TouchEvent.TOUCH, function (e:*) {
            rightTouchDic[obj] = obj;
        });

        obj.addEventListener(TouchEvent.TOUCH, function (e:*) {
            //mouse out
            var t:Touch = e.getTouch(e.target);
            if (!t) {
                rightTouchDic[obj] = null;
            }
        });
        rightTouchFunc[obj] = func;
    }

    private function starlingTouchHandle(e:TouchEvent):void {

    }
}
}