package mainGame.modules.scenes.dialogue.model
{
	import flashx.textLayout.formats.WhiteSpaceCollapse;
	
	import org.robotlegs.mvcs.Actor;
	
	public class DialogueModel extends Actor
	{
		/**
		 * 
		 */		
		private static const pageLimit:int=400;
		/**
		 *每行最大字数 
		 */		
		private static const lineLimit:int=10;
		private static const numLine:int=3;
		private static const newLineChar:String="|";
		private var _dialogue:String="1234567890The quic|k brown fox jumps over the lazy dog 中文中文是电风扇的发达的法师法上师大神鼎飞丹砂";
		
		
		private var _pagesToShow:Array;
		private var _pagesToReview:Array;
		
		public function DialogueModel()
		{
			super();
			
			//test
			layoutDialogue();
		}
		
		public function layoutDialogue():void
		{
			var line:String="";
			var lines:Array=new Array();
			var strIdx:String="";
			_pagesToShow=new Array();
			_pagesToReview=new Array();
			for (var i:int = 0; i < _dialogue.length; i++) 
			{
				strIdx=_dialogue.charAt(i)
				if(strIdx!=newLineChar)
					line+=strIdx;
				if(line.length==lineLimit||strIdx==newLineChar)
				{
					line+="\n";
					lines.push(line);
					line="";
					if(lines.length==numLine)
					{
						_pagesToShow.push(lines.toString());
						lines=new Array();
					}
				}
			}
			if(line!="")
			{
				lines.push(line);
				line="";
				_pagesToShow.push(lines);
				lines.length=0;
			}
		}
		
		public function getNext():String
		{
			if(_pagesToShow.length){
				_pagesToReview.push(_pagesToShow.shift());
				return _pagesToReview[_pagesToReview.length-1];
			}
			else
				return null;
		}
		
		public function getPre():String
		{
			if(_pagesToReview.length){
				_pagesToShow.push(_pagesToReview.pop());
				return _pagesToShow[_pagesToShow.length-1];
			}
			else 
				return null;
		}
	}
}