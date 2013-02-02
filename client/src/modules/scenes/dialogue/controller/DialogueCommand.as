package modules.scenes.dialogue.controller
{
	import modules.scenes.dialogue.model.DialogueModel;
	import modules.scenes.dialogue.model.events.DialogueEvent;
	import modules.scenes.dialogue.view.DialogueView;
	
	import org.robotlegs.mvcs.StarlingCommand;
	
	public class DialogueCommand extends StarlingCommand
	{
		[Inject] 
		public var model:DialogueModel;
		public function DialogueCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			var strPage:String=model.getNext();
			dispatch(new DialogueEvent(DialogueEvent.E_DIALOGUE,strPage));
//			model.getNext();
			trace(this,"DialogueCommand",strPage);
		}
		
	}
}