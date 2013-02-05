package mainGame.modules.scenes.plot.controller
{
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class DialogueCommand extends StarlingCommand
	{
		[Inject] 
		public var model:PlotModel;
		public function DialogueCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var strPage:String=model.getNextPage();
			dispatch(new PlotEvent(PlotEvent.E_DIALOGUE,strPage));
//			model.getNext();
			trace(this,"DialogueCommand",strPage);
		}
		
	}
}