package mainGame.model
{
import flash.system.Capabilities;
import flash.utils.Dictionary;

import org.robotlegs.mvcs.Actor;

import starling.display.DisplayObject;

import starling.utils.AssetManager;

public class AppModel extends Actor
{
    public var asset:AssetManager;
    public var rightTouchList:Array;
    public var rightTouchFunc:Dictionary;
    public function AppModel()
    {
        super();
        rightTouchList=new Array();
        rightTouchFunc=new Dictionary();
        //			asset = new AssetManager();
        //			asset.verbose = Capabilities.isDebugger;
        //			asset.enqueue(EmbeddedAssets);
    }

    public function addRightClickHandle(obj:DisplayObject,func:Function):void
    {
        rightTouchList.push(obj);
        rightTouchFunc[obj]=func;
    }
}
}