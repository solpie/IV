package mainGame.model
{
	import flash.system.Capabilities;
	
	import org.robotlegs.mvcs.Actor;
	
	import starling.utils.AssetManager;
	
	public class AppModel extends Actor
	{
		public var asset:AssetManager;
        public var rightTouchList:Array;
		public function AppModel()
		{
			super();
            rightTouchList=new Array();
//			asset = new AssetManager();
//			asset.verbose = Capabilities.isDebugger;
//			asset.enqueue(EmbeddedAssets);
		}
	}
}