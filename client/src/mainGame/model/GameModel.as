package mainGame.model {
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.utils.AssetManager;

public class GameModel extends Actor {
    public var asset:AssetManager;

    public var clickTouchDic:Dictionary;
    public var clickTouchFunc:Dictionary;

    public var rightTouchDic:Dictionary;
    public var rightTouchFunc:Dictionary;

    public function GameModel() {
        super();
        clickTouchDic = new Dictionary();
        clickTouchFunc = new Dictionary();

        rightTouchDic = new Dictionary();
        rightTouchFunc = new Dictionary();
    }

    public function addLeftClickHandle(obj:DisplayObject, func:Function):void {
        obj.addEventListener(TouchEvent.TOUCH, function (e:*) {
            clickTouchDic[obj] = obj;
        });

        obj.addEventListener(TouchEvent.TOUCH, function (e:*) {
            //mouse out
            var t:Touch = e.getTouch(e.target);
            if (!t) {
                clickTouchDic[obj] = null;
            }
        });
        clickTouchFunc[obj] = func;
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