package mainGame.modules.scenes.dialogue.view
{

import ex.SpriteSTL;

import feathers.controls.Button;
import feathers.controls.Label;

import mainGame.Game;

import starling.animation.DelayedCall;
import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.display.Quad;
import starling.events.Event;
import starling.events.TouchEvent;

public class DialogueView extends SpriteSTL
	{
		//      	private var _dialogueArea:DialogueArea;
		private var _avatar:Avatar;
        public var dialogueMask:Quad=new Quad(1,1);
        private var dialogueUI:Image;
		private var _dialogue:Label;
		private var _delayCall:DelayedCall;
		private var _name:Label;//Image
		public var btnNext:Button;
//        public var menu:
		//		private var _dialogue:
		public function DialogueView(parent:DisplayObjectContainer=null)
		{
			super(parent);
			init();
            addListener();
		}

    private function addListener():void {
        this.addEventListener(Event.TRIGGERED,onClick);
//        background.addEventListener(Event.TRIGGERED,onClick);
    }
		
		private function init():void
		{
			_avatar=new Avatar();
			_avatar.y=-200;
			_avatar.x=300;
			addChild(_avatar);

            dialogueUI=new Image(Game.assets.getTexture("dialogue"));
            dialogueUI.y = 400;
            addChild(dialogueUI);

			dialogueMask.y=dialogueUI.y;
            dialogueMask.x = dialogueUI.x;
            dialogueMask.width=dialogueUI.width;
            dialogueMask.height=dialogueUI.height;
            dialogueMask.alpha=0;
			addChild(dialogueMask);

			_name=new Label();
            _name.text="Name";
			_name.y=dialogueMask.y+22;
			_name.x=dialogueMask.x+52;
			addChild(_name);
			
			_dialogue=new Label();
			_dialogue.width=120;
			_dialogue.y=dialogueMask.y+80;
			_dialogue.x=dialogueMask.x+22;
			_dialogue.text="<b><font color='#FFeecc'>1234567890\nThe quick brown fox jumps over the lazy dog</font></b>\n中文中文";

            addChild(_dialogue);
			
//			btnNext=new Button();
//			btnNext.label="click";
//			btnNext.x=700;
//			btnNext.y=700;
//			btnNext.width=100;
//			btnNext.height=30;
//			addChild(btnNext);
			_delayCall=new DelayedCall(onTick,0.4);
		}

		public function showDialogue(text:String,avatarId:String):void
		{
			_dialogue.text=text;
			//todo get avatar
			if(_avatar.id!=avatarId)
				_avatar.setLihui(avatarId);
			else
				_avatar.setLihui("logo");
		}
		
		private function onTick():void
		{
			_dialogue.text+=_dialogue.text.length.toString();
		}
		
		private function onRightClick(e:*):void
		{
			trace(this,"onRightClick");
		}
		private function onClick(e:*):void
		{
//			_delayCall.reset(onTick,0.4);
//			_delayCall.repeatCount=10;
//			Starling.juggler.add(_delayCall);
			dispatchEvent(new Event(Event.COMPLETE));
		}
        private function onOut(e:TouchEvent):void
        {

        }
	}
}