package mainGame.service
{
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;

import org.robotlegs.mvcs.Actor;

public class ScriptService extends Actor
	{
		private var process:NativeProcess;
		private var _callback:Function;
		private var _errorCallback:Function;
		
		
		public function ScriptService()
		{
			super();
		}
		
		public function callExe(url:String,args:Vector.<String>,callback:Function,errorCallback:Function=null):void
		{
			var file:File=new File(url);
			var nativeProcessStartupInfo:NativeProcessStartupInfo;
			NativeApplication.nativeApplication.autoExit=true;
			trace("file :",file.nativePath);
			nativeProcessStartupInfo = new NativeProcessStartupInfo();
			nativeProcessStartupInfo.executable = file;
			nativeProcessStartupInfo.arguments=args;
			
			_callback=callback;
			if(_errorCallback!=null)
				_errorCallback=errorCallback;
			
			process = new NativeProcess();
			process.start(nativeProcessStartupInfo);
			process.addEventListener(ProgressEvent.STANDARD_OUTPUT_DATA, onOutput);
			process.addEventListener(ProgressEvent.STANDARD_ERROR_DATA, onErrorData);
			process.addEventListener(NativeProcessExitEvent.EXIT, onExit);
			process.addEventListener(IOErrorEvent.STANDARD_OUTPUT_IO_ERROR, onIOError);
			process.addEventListener(IOErrorEvent.STANDARD_ERROR_IO_ERROR, onIOError);
			process.closeInput();
		}
		
		public function onOutput(event:ProgressEvent):void
		{
			_callback();
			trace("Got - ", process.standardOutput.readUTFBytes(process.standardOutput.bytesAvailable));
		}
		
		public function onErrorData(event:ProgressEvent):void
		{
			var eTxt:String=process.standardError.readUTFBytes(process.standardError.bytesAvailable);
			if(_errorCallback!=null)
				_errorCallback();
			trace("ERROR -", eTxt);
		}
		
		public function onExit(event:NativeProcessExitEvent):void
		{
			trace(this,"exit");
		}
		
		public function onIOError(event:IOErrorEvent):void
		{
			trace("ERROR -",event.toString());
		}
	}
}