package mainGame.modules.scenes.plot.model.events
{
import ex.EventFLA;

public class PlotEvent extends EventFLA
	{
		public static const DIALOGUE_SHOW_PAGE:String="显示对话";
		public static const DIALOGUE_END:String="对话完成";
		public static const RIGHT_CLICK_ON_BG:String="右键对话框";
		public static const CLICK_ON_BG:String="左键键对话框";
		public static const SELECT_OPTION:String="选择选项";
		public static const UPDATE_OPTION:String="更新选项";
		public static const PLOT_START:String="剧情开始";
		public static const PLOT_END:String="剧情结束";
		public static const EVENT_START:String="事件开始";
		public static const EVENT_END:String="事件结束";

		public function PlotEvent(type:String,data:Object=null)
		{
			super(type,data);
		}
	}
}