package mainGame.modules.scenes.dialogue.view
{
	import ex.SpriteSTL;
	
	import starling.animation.DelayedCall;
	import starling.display.DisplayObjectContainer;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class DialogueArea extends SpriteSTL
	{
		private var _dialogue:String;
		private var _dialoguePages:Array;
		private var _textTmp:String;
		/**
		 * 换行字数 
		 */		
		private var _limitLine:int=30;
		/**
		 * 单页最大字数 
		 */		
		private var _limitPage:int=60;
		private var _delayCall:DelayedCall;
		private var _textDialogue:TextField;
		private var _textDialogueStyle:String="<font color='#FFFFFF' size='16' leading='20'>%s</font>";
		private var _textName:TextField;
		private var _textIndex:int;
		
		private var _isShowAll:Boolean=false;
		public var textNext:TextField;
		
//		private var avatarMouse:Bitmap;
		public function DialogueArea(parent:DisplayObjectContainer=null,dialogue:String="",avatarName:String="")
		{
			super(parent);
			_textDialogue=new TextField();
			//			_textDialogue.textColor=0xffffff;
			_textDialogue.width = 400;
			//			_textDialogue.height = 400;
			_textDialogue.y=20;
			_textDialogue.x=55;
			_textDialogue.textField.letterSpacing=0;
			_textDialogue.textField.leading=5;
			
			addChild(_textDialogue);
			
			_textName=new CFaceTextField();
			_textName.x=10;
			_textName.y=-10;
			
			addChild(_textName);
			
			textNext=new TextField();
			textNext.y=80;
			textNext.x=530;
			//			HtmlUtil.createLeadingHtml(
			
			avatarMouse=GlobalInstance.getBitmap("Plot_Mouse");
			avatarMouse.x=textNext.x+10;
			avatarMouse.y=textNext.y-avatarMouse.height-5;
			addChild(avatarMouse);
			//			_textDialogue.
			this.mouseChildren=mouseEnabled=false;
			addChild(textNext);
		}
		
		public function start():void
		{
			if(_dialoguePages.length==0)
				return;
			
			_dialogue=_dialoguePages.shift();
			
			_textIndex=0;
			_textTmp="";
			while(_textIndex<_dialogue.length)
			{
				_textTmp+=(_dialogue.charAt(_textIndex));
				_textIndex++;
				
				if(_textIndex%(_limitLine+1)==(_limitLine))
				{
					_dialogue=_textTmp+"\n"+_dialogue.substr(_textIndex);
					trace(this,"换行",_textIndex%_limitLine)
				}
			}
			
			trace(this,"对话翻页：",_dialogue,"剩余",_dialoguePages.length);
			_isShowAll=false;
			_textDialogue.textField.htmlText="";
			_textTmp="";
			_textIndex=0;
			
			//全部显示
			showHtmlText(_dialogue);
		}
		
		private function end():void
		{
			if(_dialoguePages.length)
			{
				start();
				return;
			}
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function setName(str:String):void
		{
			_textName.textField.htmlText="<b><font color='#FFE034' size='20'>"+str+":</font></b>"
		}
		
		public function setDialogue(str:String):void
		{
			str=str.replace(/player/g,GameModels.charModel._userInfo.userName);
			var numPage:int=Math.ceil(str.length/_limitPage);
			_dialoguePages=new Array();
			for (var i:int = 0; i < numPage; i++) 
			{
				var line:String=str.substring(i*_limitPage,i*_limitPage+_limitPage);
				
				var txtIndex:int=0;
				
				_dialoguePages.push(line);
			}
			textNext.htmlText="<a href='event:3'><font color='#FFE034' size='13'><u>点击左键继续</u></font></a>";
			
			avatarMouse.visible=true;
		}
		
		public function onClick():void
		{
			end();
			return;
		}
		
		private function showHtmlText(str:String):void
		{
			_textDialogue.clear();
			_textDialogue.appendText(_textDialogueStyle.replace("%s",str));
		}
		
		public function clear():void
		{
			_isShowAll=false;
			_textDialogue.textField.htmlText="";
			_textName.textField.htmlText="";
			textNext.htmlText="";
			_dialogue="";
			avatarMouse.visible=false;
			_textIndex=0;
		}
		
		public function destory():void
		{
			removeChild(_textDialogue);
			removeChild(_textName);
			removeChild(textNext);
			removeChild(avatarMouse);
			_dialogue="";
		}
	}
}