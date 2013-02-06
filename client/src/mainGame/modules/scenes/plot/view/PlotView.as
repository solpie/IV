package mainGame.modules.scenes.plot.view {

import ex.SpriteSTL;

import feathers.controls.Label;

import mainGame.Constants;
import mainGame.Game;

import starling.animation.DelayedCall;
import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.events.Event;

public class PlotView extends SpriteSTL {
    //      	private var _dialogueArea:DialogueArea;
    private var _avatar:Avatar;
    public var dialogueUI:Image=new Image(Game.assets.getTexture(Constants.UI_DIALOGUE));
    private var _dialogue:Label;
    private var _delayCall:DelayedCall;
    private var _name:Label;//Image

    public var optionView:OptionView;
//        public var menu:
    public function PlotView(parent:DisplayObjectContainer = null) {
        super(parent);
        init();
        addListener();
//        test();
    }

    private function test():void {
        optionView = new OptionView(this);
    }
    private function init():void {
        _avatar = new Avatar();
        _avatar.y = -200;
        _avatar.x = 300;
//        addChild(_avatar);

//        var o:Object=new Image(Game.assets.getTexture(Constants.UI_DIALOGUE));
//        dialogueUI = new Image(Game.assets.getTexture(Constants.UI_DIALOGUE));
        dialogueUI.y = 400;
        addChild(dialogueUI);

        _name = new Label();
        _name.text = "Name";
        _name.y = dialogueUI.y + 22;
        _name.x = dialogueUI.x + 52;
        addChild(_name);

        _dialogue = new Label();
        _dialogue.width = this.width;
        _dialogue.touchable=false;
        _dialogue.y = dialogueUI.y + 80;
        _dialogue.x = dialogueUI.x + 22;
//        _dialogue.text="<b><font color='#FFeecc'>1234567890\nThe quick brown fox jumps over the lazy dog</font></b>\n中文中文";

        addChild(_dialogue);

        _delayCall = new DelayedCall(onTick, 0.4);
    }

    private function addListener():void {
//        this.addEventListener(Event.TRIGGERED, onClick);
//        dialogueMask.addEventListener(TouchEvent.TOUCH, onClick);
    }

    public function updateDialogue(text:String, avatarId:String):void {
        _dialogue.text = text;
    }

    private function onTick():void {
        _dialogue.text += _dialogue.text.length.toString();
    }

    private function onRightClick(e:*):void {
        trace(this, "onRightClick");
    }

    private function onClick(e:*):void {
//			_delayCall.reset(onTick,0.4);
//			_delayCall.repeatCount=10;
//			Starling.juggler.add(_delayCall);
        dispatchEvent(new Event(Event.COMPLETE));
    }

    public function updateAvatar(avatarId:String):void {
        //todo get avatar
        return;
        if (_avatar.id != avatarId)
            _avatar.setLihui(avatarId);
        else
            _avatar.setLihui("logo");
    }

    public function clearOptionView():void {

    }
}
}