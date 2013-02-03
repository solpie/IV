package mainGame.modules.scenes.dialogue.view
{
import ex.SpriteSTL;

import mainGame.Game;

import starling.animation.DelayedCall;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.display.Quad;

public class Avatar extends SpriteSTL
	{
		private var _q:Quad;
		private var lihui:Image;
		private var _delayCall:DelayedCall;
		
		public var id:String;
		
		public function Avatar(parent:DisplayObjectContainer=null)
		{
			super(parent);
			initUI();
		}
		
		private function initUI():void
		{
			_q=new Quad(400,800);
			_q.color=0x884455;
			addChild(_q);
		}
		
		public function setLihui(avatarId:String):void
		{
			this.id=avatarId;
			lihui=new Image(Game.assets.getTexture(avatarId));
			lihui.x=100;
			lihui.alpha=0;
			addChild(lihui);
			var t:Tween=new Tween(lihui,0.3);
			t.animate("x",0);
			t.fadeTo(1);
			Starling.juggler.add(t);
		}
	}
}