package
{

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.system.Capabilities;

import mainGame.Game;

import starling.core.Starling;
import starling.events.Event;
import starling.utils.AssetManager;

//	[SWF(width="1280", height="720", frameRate="60", backgroundColor="#222222")]
	[SWF(width="1024", height="768", frameRate="60", backgroundColor="#222222")]
	public class Web extends Sprite
	{
		private var mStarling:Starling;

		public function Web()
		{
			if (stage) start();
            else addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function start():void
		{
			Starling.multitouchEnabled = true; // for Multitouch Scene
			Starling.handleLostContext = true; // required on Windows, needs more memory
			
			mStarling = new Starling(Game, stage);
			mStarling.simulateMultitouch = true;
			mStarling.enableErrorChecking = Capabilities.isDebugger;
			mStarling.start();
			
			// this event is dispatched when stage3D is set up
			mStarling.addEventListener(Event.ROOT_CREATED, onRootCreated);
		}

		private function onAddedToStage(event:Object):void
		{
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = StageAlign.TOP_LEFT;
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			start();
		}
		
		private function onRootCreated(event:Event, game:Game):void
		{
			// set framerate to 30 in software mode
			if (mStarling.context.driverInfo.toLowerCase().indexOf("software") != -1)
				mStarling.nativeStage.frameRate = 30;
			
			// define which resources to load
			var asset:AssetManager = new AssetManager();
			asset.verbose = Capabilities.isDebugger;
			asset.enqueue(EmbeddedAssets);
			// background texture is embedded, because we need it right away!
			trace(this,"onRootCreated");
			// game will first load resources, then start menu
			game.start(asset);
		}
	}
}