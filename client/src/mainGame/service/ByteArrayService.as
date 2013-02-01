package mainGame.service
{
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import mainGame.service.interfaces.IQuickIO;
	
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * 读写二进制数据
	 * @author marnon
	 */	
	public class ByteArrayService extends Actor implements IQuickIO
	{
		public function ByteArrayService()
		{
			super();
		}
		/**
		 * 加载url
		 * @param loadedCallback 
		 * private function onLoad(e:Event):void
		 * {
		 * 		e.target.data
		 * }
		 * 
		 */		
		public function loadURL(url:String,onLoadCallback:Function):void
		{
			var loader:URLLoader=new URLLoader();
			loader.dataFormat=URLLoaderDataFormat.BINARY;
			var cpl:Function=function cpl(e:Event):void
			{
				loader.removeEventListener(Event.COMPLETE,cpl);
				loader.close();
				onLoadCallback(e);
			};
			loader.addEventListener(Event.COMPLETE,cpl);
			loader.addEventListener(IOErrorEvent.IO_ERROR,function onIOError(e:IOError):void
			{
				loader.removeEventListener(Event.COMPLETE,onIOError);
//				Alert.show(e.message,"IOError");
			});
			loader.load(new URLRequest(url));
			
		}
		/**
		 * 浏览读取文件 
		 * @param loadedCallback 
		 * private function onLoad(e:Event):void
		 * {
		 * 		e.target.removeEventListener(Event.COMPLETE,onLoad);
		 * 		e.target.data
		 * }
		 * 
		 */		
		public function browseOpen(loadedCallback:Function):void
		{
			var file:FileReference=new FileReference();
			file.addEventListener(Event.SELECT,function onSelected(e:Event):void
			{
				file.removeEventListener(Event.SELECT,onSelected);
				(e.target as FileReference).addEventListener(Event.COMPLETE,loadedCallback);
				(e.target as FileReference).load();
			});
			file.browse();
		}
		/**
		 * 浏览保存文件 
		 * @param bytes
		 * 
		 */		 
		public function browseSave(bytes:ByteArray):void
		{
			var file:FileReference=new FileReference();
			file.save(bytes);
		}
		/**
		 * 直接保存文件
		 */		
		public function save(ba:ByteArray,url:String,callback:Function=null):void
		{
//			var timer:Timer=new Timer(5,1);
//			var onTimerHandle:Function=function(e:TimerEvent):void{
//				timer.stop();
//				timer=null;
//				try
//				{
//					var fs:FileStream=new FileStream();
//					var file:File=new File(url);
////					fs.addEventListener(Event.COMPLETE,callback);
//					fs.openAsync(file,FileMode.WRITE);
//					fs.writeBytes(ba);
//					fs.close();
//				} 
//				catch(error:IOErrorEvent) 
//				{
//					trace(this,error.text);
//				}
//			}
//			timer.addEventListener(TimerEvent.TIMER,onTimerHandle);
//			timer.start();
		}
	}
}