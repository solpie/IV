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
    public var btnSave:Button=new Button();
    public var btnClose:Button;
    private var _tween:Tween;
    private const _delay:Number=0.4;
    private var this_:SpriteSTL;
    public function ConfigView(parent:DisplayObjectContainer = null) {
        super(parent);
        this_=this;
        init();

    }

    private function init():void {
        _bg=new Quad(1024,768);
        _bg.color=0x225566;
        _bg.alpha=0.6;
        addChild(_bg);

        btnSave.label="Save";
        btnSave.setSize(100,30);
        addChild(btnSave);

        btnClose=new Button();
        btnClose.label="Close";
        btnClose.width=100;
        btnClose.height=30;
        btnClose.x = this.width-150;
        btnClose.y = this.height-90;

        btnClose.addEventListener(Event.TRIGGERED,function():void{Game.hideConfig();})
        addChild(btnClose);
        //animation
        _tween=new Tween(this,_delay);
        this.alpha=0;
    }
    public function show(parent:*):void
    {
        if(this.alpha!=0) return;
//
        parent.addChild(this_);
        _tween.fadeTo(1);
        _tween.onComplete=function():void{
            _tween.reset(this_, _delay);
            trace(this,"show config...")
        };

        Starling.juggler.add(_tween);

    }

    public function hide(parent:*):void
    {
        if(this.alpha!=1)return;
        _tween.fadeTo(0);
        _tween.onComplete=function():void{
            parent.removeChild(this_);
            _tween.reset(this_,_delay);
            trace(this,"hide config");
        };
        Starling.juggler.add(_tween);
    }
}
}
