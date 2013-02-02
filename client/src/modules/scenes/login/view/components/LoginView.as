package modules.scenes.login.view.components
{
	import ex.ButtonFEA;
	import ex.SpriteSTL;
	
	import feathers.controls.Button;
	import feathers.layout.VerticalLayout;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mainGame.Game;
	import modules.scenes.login.model.events.LoginEvent;
	
	import starling.animation.DelayedCall;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class LoginView extends SpriteSTL
	{
		private var bg:Image;
		//		private var logo:
		public var btnLogin:ButtonFEA=new ButtonFEA();
		private var btnExit:ButtonFEA;
		private var btnConfig:ButtonFEA;
		private var btnLoad:ButtonFEA;
		private var btnSave:ButtonFEA;
		
		public function get getOver():Image 
		{
			return btnExit.getChildAt(0) as Image;
		}
		public function set getOver(value:Image):void 
		{
			
		}
		public function LoginView(parent:DisplayObjectContainer=null)
		{
			super(parent);
			init();
		}
		
		private function init():void
		{
			trace(this,"init...");
			var q_BG:Quad=new Quad(1280,720);
			q_BG.color=0xc0c0c0;
			addChild(q_BG);
			//			bg=new Image(Game.assets.getTexture("exit"));
			//			addChild(bg);
			
			//			btnLogin.width=100;
			//			btnLogin.height=30;
			btnLogin.defaultSkin=new Image(Game.assets.getTexture("loginUp"));
			btnLogin.downSkin=new Image(Game.assets.getTexture("loginDown"));
			btnLogin.name=LoginEvent.LOGIN;
			addChild(btnLogin);
			
			btnExit=new ButtonFEA(this);
			btnExit.x=500;
						btnExit.defaultSkin=new Image(Game.assets.getTexture("voiceUp"));
			var i:Image;
			i=new Image(Game.assets.getTexture("voiceOver"));
			//			i.x=-i.width/2;
			//			i.y=-i.height/2;
			i.x=i.pivotX=i.width/2;
			i.y=i.pivotY=i.width/2;
			i.alpha=0;
			btnExit.addChild(i);
			
			i=new Image(Game.assets.getTexture("voiceUp"));
			i.x=i.pivotX=i.width/2;
			i.y=i.pivotY=i.width/2;
			
			btnExit.addChild(i);
			btnExit.name=LoginEvent.EXIT;
			btnExit.y=btnLogin.x+150;
			//			btnExit.getChildAt(1)
			btnExit.addEventListener(TouchEvent.TOUCH,onTouch);
//			btnExit.addEventListener(TouchPhase.ENDED,onTouch);
			t=new Tween(btnExit.getChildAt(0) as Image,3);
			t.animate("rotation",45);
			t.repeatCount=0;
		}
		private var t:Tween;
		private function onTouch(e:*):void
		{
			if(!Starling.juggler.contains(t))
			{
				(btnExit.getChildAt(1) as Image).alpha=1;
				Starling.juggler.add(t);
			}
			//mouse out
			var touch:Touch=e.getTouch(btnExit);
			if(!touch)
			{
				Starling.juggler.remove(t);
				(btnExit.getChildAt(1) as Image).alpha=0;
			}
		}
		
		private function onOut(e:TouchEvent):void
		{
			var touch:Touch=e.getTouch(btnExit);
			if(!touch)
			{
				Starling.juggler.remove(t);
				(btnExit.getChildAt(1) as Image).alpha=0;
			}
		}
		//		private function onClick(e:Event):void
		//		{
		////			e.data=(e.target as Button).label;
		//			dispatchEvent(e);
		//		}
	}
}