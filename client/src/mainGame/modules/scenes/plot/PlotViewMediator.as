package mainGame.modules.scenes.plot {
import flash.utils.Dictionary;

import mainGame.Game;
import mainGame.model.GameModel;
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.model.vo.EventVO;
import mainGame.modules.scenes.plot.model.vo.OptionVO;
import mainGame.modules.scenes.plot.model.vo.PlotVO;
import mainGame.modules.scenes.plot.view.OptionView;
import mainGame.modules.scenes.plot.view.PlotView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class PlotViewMediator extends StarlingMediator {
    [Inject]
    public var view:PlotView;
    [Inject]
    public var model:GameModel;
    [Inject]
    public var modelPlayer:PlayerModel;
    [Inject]
    public var plotModel:PlotModel;

    private var eventToFunc:Dictionary;

    public function PlotViewMediator() {
        super();
    }

    override public function onRegister():void {
        //event to view
        eventMap.mapListener(eventDispatcher, PlotEvent.E_DIALOGUE, onUpdateDialogue);
        eventMap.mapListener(eventDispatcher, PlotEvent.EVENT_START, onEventStart);
        //view to event
        view.addEventListener(Event.COMPLETE, onDialogueClick);
        //right click
        model.addRightClickHandle(view.dialogueMask, onRightClickBg);
        //初始化事件处理
        initEventDic();
        //开始最初剧情
        dispatch(new PlotEvent(PlotEvent.PLOT_START, modelPlayer.currentPlot));
    }

    private function onEventStart(e:PlotEvent):void {
        var eVO:EventVO = e.payload as EventVO;
        eventToFunc[eVO.type](eVO);
    }

    private function onRightClickBg():void {
        //todo       弹出右键菜单
        trace(this, " 弹出右键菜单");
        Game.showConfig();
    }

    private function onTouchBg(e:Event):void {

    }

    private function onUpdateDialogue(e:PlotEvent):void {
        if (e.payload)
            var str:String = e.payload as String;
        view.showDialogue(str, "background");
    }

    private function onDialogueClick(e:*):void {
        dispatch(new PlotEvent(PlotEvent.DIALOGUE_END));
        trace(this, "onDialogueClick end");
    }

    //执行事件
    private function initEventDic():void {
        eventToFunc = new Dictionary();
        eventToFunc[EventVO.TYPE_DELAY] = e_Delay;
        eventToFunc[EventVO.TYPE_DIALOGUE] = e_Dialogue;
        eventToFunc[EventVO.TYPE_OPTION] = e_Option;
    }

    private function e_Delay(eVO:EventVO):void {
        trace(this, "e_Delay");
    }

    private function e_Dialogue(eVO:EventVO):void {
        trace(this, "e_Dialogue");
    }

    private function e_Option(eVO:EventVO):void {
        new OptionView(view);
        var title:String;
        var hasTitle:Boolean = !Boolean(int(eVO.params[eVO.params.length - 1]));
        if (hasTitle)
            title = eVO.params.pop();

        var optionList:Array = new Array();
        var pVO:PlotVO;
        for each(var pId:int in eVO.params) {
            pVO = plotModel.getPlotVO(pId);
            optionList.push(new OptionVO(pVO.title, pVO.id));
        }

        dispatch(new PlotEvent(PlotEvent.UPDATE_OPTION, {getTitle: title, getOptionList: optionList}))
        trace(this, "e_Option");
    }

}
}