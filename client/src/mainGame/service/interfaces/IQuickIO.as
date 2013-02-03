package mainGame.service.interfaces
{
	import flash.events.Event;
	import flash.utils.ByteArray;

	public interface IQuickIO
	{
		/**
		 * 加载url
		 * @param loadedCallback 
		 * private function onLoad(e:Event):void
		 * {
		 * 		e.target.removeEventListener(Event.COMPLETE,onLoad);
		 * 		e.target.data
		 * }
		 * 
		 */	
		function loadURL(url:String,onLoadCallback:Function):void
		/**
		 *浏览读取文件 
		 * @param loadedCallback 
		 * private function onLoad(e:Event):void
		 * {
		 * 		e.target.removeEventListener(Event.COMPLETE,onLoad);
		 * 		e.target.data
		 * }
		 */
		function browseOpen(loadedCallback:Function):void
		/**
		 *浏览保存文件 
		 * @param bytes 文件数据
		 */
		function browseSave(bytes:ByteArray):void
	}
}