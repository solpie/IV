package mainGame.modules.scenes.dialogue.model.events
{
	import ex.EventFLA;
	
	public class DialogueEvent extends EventFLA
	{
		public static const E_DIALOGUE:String="对话事件";
		public static const DIALOGUE_END:String="对话完成";
		
		public function DialogueEvent(type:String,data:Object=null)
		{
			super(type,data);
		}
	}
}