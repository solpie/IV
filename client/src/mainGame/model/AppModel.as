package mainGame.model
{
	import flash.system.Capabilities;
	
	import org.robotlegs.mvcs.Actor;
	
	import starling.utils.AssetManager;
	
	public class AppModel extends Actor
	{
		public var asset:AssetManager;	
		public function AppModel()
		{
			super();
//			asset = new AssetManager();
//			asset.verbose = Capabilities.isDebugger;
//			asset.enqueue(EmbeddedAssets);
		}
	}
}