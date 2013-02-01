package mainGame.scenes.dialogue.controller
{
	import mainGame.scenes.dialogue.model.DialogueModel;
	import mainGame.scenes.dialogue.model.events.DialogueEvent;
	import mainGame.scenes.dialogue.view.components.DialogueView;
	
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
			// TODO Auto Generated method stub
			var strPage:String=model.getNext();
			dispatch(new DialogueEvent(DialogueEvent.E_DIALOGUE,strPage));
//			model.getNext();
			trace(this,"DialogueCommand",strPage);
		}
		
	}
}