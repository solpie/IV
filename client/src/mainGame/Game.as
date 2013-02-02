package mainGame
{
	import assets.feathers.themes.MetalWorksMobileTheme;
	
	import ex.SpriteSTL;

import flash.events.MouseEvent;

import flash.ui.Keyboard;
	import flash.utils.getDefinitionByName;
	
	import modules.scenes.dialogue.view.components.DialogueView;
	import modules.scenes.login.view.components.LoginView;
	
	import org.robotlegs.mvcs.StarlingContext;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	
	public class Game extends SpriteSTL
	{
		// Embed the Ubuntu Font. Beware: the 'embedAsCFF'-part IS REQUIRED!!!
//		[Embed(source="../../demo/assets/fonts/Ubuntu-R.ttf", embedAsCFF="false", fontFamily="Ubuntu")]
//		private static const UbuntuRegular:Class;
		
		private var mMainMenu:MainMenu;
		private var mCurrentScene:DialogueView;
		
		private static var sAssets:AssetManager;
		
		private static var _this:SpriteSTL;
		
		private var _starlingContext:StarlingContext;
		
//		protected var theme:MetalWorksMobileTheme;
		
		//scene
		private static var scnLogin:LoginView;
		private static var scnDialogue:DialogueView;
		
		public function Game()
		{
			// nothing to do here -- Startup will call "start" immediately.
			_this=this;
		}
		
		public function start(asset:AssetManager):void
		{
			_starlingContext = new AppContext(this);
			new MetalWorksMobileTheme(this.stage);
//			this.theme.setInitializerForClass(
			sAssets = asset;
//			var bgTexture:Texture = Texture.fromBitmap(new Background());

			// The background is passed into this method for two reasons:
			// 
			// 1) we need it right away, otherwise we have an empty frame
			// 2) the Startup class can decide on the right image, depending on the device.
			
//			addChild(new Image(background));
			
			// The AssetManager contains all the raw asset data, but has not created the textures
			// yet. This takes some time (the assets might be loaded from disk or even via the
			// network), during which we display a progress indicator. 
			
//			mLoadingProgress = new ProgressBar(175, 20);
//			mLoadingProgress.x = (background.width  - mLoadingProgress.width) / 2;
//			mLoadingProgress.y = (background.height - mLoadingProgress.height) / 2;
//			mLoadingProgress.y = background.height * 0.7;
//			addChild(mLoadingProgress);
			
			asset.loadQueue(function(ratio:Number):void
			{
//				mLoadingProgress.ratio = ratio;
				
				// a progress bar should always show the 100% for a while,
				// so we show the main menu only after a short delay. 
				if (ratio == 1)
					Starling.juggler.delayCall(function():void
					{
//						mLoadingProgress.removeFromParent(true);
//						mLoadingProgress = null;
						showMainMenu();
					}, 0.15);
			});
			
			
//			new DialogueView(this);
			
			addEventListener(Event.TRIGGERED, onButtonTriggered);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);

		}
		
		private function showMainMenu():void
		{
//			if (mMainMenu == null)
//				mMainMenu = new MainMenu();
//			
//			addChild(mMainMenu);
			scnLogin=new LoginView(this);
		}
		
		private function onKey(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.SPACE)
				Starling.current.showStats = !Starling.current.showStats;
			else if (event.keyCode == Keyboard.X)
				Starling.context.dispose();
		}


		private function onButtonTriggered(event:Event):void
		{
			var button:Button = event.target as Button;
			
			if (button.name == "backButton")
				closeScene();
			else
				showScene(button.name);
		}
		
		private function closeScene():void
		{
			mCurrentScene.removeFromParent(true);
			mCurrentScene = null;
			showMainMenu();
		}
		
		private function showScene(name:String):void
		{
			if (mCurrentScene) return;
			
			var sceneClass:Class = getDefinitionByName(name) as Class;
			mCurrentScene = new sceneClass() as DialogueView;
			mMainMenu.removeFromParent();
			addChild(mCurrentScene);
		}
		
		public static function get assets():AssetManager { return sAssets;}
		public static function login():void
		{
			if(scnLogin)_this.removeChild(scnLogin);
			new DialogueView(_this);
		};
	}
}