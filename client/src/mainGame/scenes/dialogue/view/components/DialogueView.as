package mainGame.scenes.dialogue.view.components
{
	
	import ex.SpriteSTL;
	
	import feathers.controls.Button;
	import feathers.controls.Label;
	
	import flash.events.MouseEvent;
	
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class DialogueView extends SpriteSTL
	{
		//      	private var _dialogueArea:DialogueArea;
		private var _avatar:Avatar;
		private var _background:Quad;
		private var _dialogue:Label;
		private var _delayCall:DelayedCall;
		private var _name:Quad;//Image
		public var btnNext:Button;
		//		private var _dialogue:
		public function DialogueView(parent:DisplayObjectContainer=null)
		{
			super(parent);
			init();   
		}
		
		private function init():void
		{
//			this.y=400;
	
			_avatar=new Avatar();
			_avatar.y=-200;
			_avatar.x=300;
			addChild(_avatar);
			
			_background=new Quad(800,300);
			_background.y=400;
			_background.color=0x00ddc6;
			addChild(_background);
			
			_name=new Quad(100,30);
			_name.y=_background.y-_name.height;
			addChild(_name);
			
			_dialogue=new Label();
			_dialogue.width=120;
			_dialogue.y=_background.y;
			_dialogue.text="<b><font color='#FFeecc'>1234567890\nThe quick brown fox jumps over the lazy dog</font></b>\n中文中文";
			addChild(_dialogue);
			
			btnNext=new Button();
			btnNext.label="click";
			btnNext.x=700;
			btnNext.y=700;
			btnNext.width=100;
			btnNext.height=30;
			addChild(btnNext);
			btnNext.addEventListener(Event.TRIGGERED,onClick);
			Starling.current.nativeStage.addEventListener(MouseEvent.RIGHT_CLICK,onRightClick);
//		btnNext.addEventListener(MouseEvent.r
			//
			_delayCall=new DelayedCall(onTick,0.4);
//			btnNext.addEventListener(
//			Starling.current.nativeStage.addEventListener(MouseEvent.CLICK,onClick);
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
	}
}