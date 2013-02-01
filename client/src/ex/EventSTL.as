package ex
{
	import starling.events.Event;
	
	public class EventSTL extends Event
	{
		public static const COMPLETE:String=Event.COMPLETE;
		public function EventSTL(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}