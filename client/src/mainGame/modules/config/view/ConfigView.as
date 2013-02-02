/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-2
 * Time: 下午5:14
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.config.view {
import ex.SpriteSTL;

import feathers.controls.Button;

import mainGame.Game;

import starling.animation.Tween;

import starling.core.Starling;

import starling.display.DisplayObjectContainer;
import starling.display.Quad;
import starling.events.Event;

public class ConfigView extends SpriteSTL {
    private var _bg:Quad;
    public var btnClose:Button;
    private var _tween:Tween;
    public function ConfigView(parent:DisplayObjectContainer = null) {
        super(parent);
        init();

    }

    private function init():void {
        _bg=new Quad(1024,768);
        _bg.color=0x225566;
        _bg.alpha=0.6;
        addChild(_bg);

        btnClose=new Button();
        btnClose.label="Close";
        btnClose.width=100;
        btnClose.height=30;
        btnClose.x = this.width-150;
        btnClose.y = this.height-90;

        btnClose.addEventListener(Event.TRIGGERED,function():void{Game.hideConfig();})
        addChild(btnClose);
        //animation

        _tween=new Tween(this, 3);
    }
    public function show(parent:*):void
    {
        this.alpha=0;
        _tween.fadeTo(1);
        _tween.onComplete=function():void{
            parent.addChild(this);
            trace(this,"show config")
        };
        Starling.juggler.add(_tween);
    }

    public function hide(parent:*):void
    {
        this.alpha=1;
        _tween.animate("alpha",0)
//        _tween.fadeTo(0);
        _tween.onComplete=function():void{parent.removeChild(this);};
        Starling.juggler.add(_tween);
    }
}
}
