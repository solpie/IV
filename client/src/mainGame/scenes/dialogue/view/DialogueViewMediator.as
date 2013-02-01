package mainGame.scenes.dialogue.view
{
	import flash.text.TextField;
	
	import mainGame.scenes.dialogue.model.DialogueModel;
	import mainGame.scenes.dialogue.model.events.DialogueEvent;
	import mainGame.scenes.dialogue.view.components.DialogueView;
	
	import org.robotlegs.mvcs.StarlingMediator;
	
	import starling.events.Event;
	
	public class DialogueViewMediator extends StarlingMediator
	{
		[Inject] 
		public var view:DialogueView;
		[Inject] 
		public var model:DialogueModel;
		
		public function DialogueViewMediator(){super();}
		
		override public function onRegister():void
		{
			//event to view
			eventMap.mapListener(eventDispatcher,DialogueEvent.E_DIALOGUE,onUpdateDialogue);
			//view to event
			view.addEventListener(Event.COMPLETE,onDialogueClick);
		}
		
		private function onUpdateDialogue(e:DialogueEvent):void
		{
			if(e.payload)
				var str:String=e.payload as String;
			view.showDialogue(str,"background");
		}
		
		private function onDialogueClick(e:*):void
		{
			dispatch(new DialogueEvent(DialogueEvent.DIALOGUE_END));
			trace(this,"onDialogueClick end");
		}
	}
}