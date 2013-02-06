package mainGame.modules.scenes.plot {
import flash.utils.Dictionary;

import mainGame.Game;
import mainGame.model.GameModel;
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.plot.model.PlotModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.model.vo.IncidentVO;
import mainGame.modules.scenes.plot.model.vo.OptionVO;
import mainGame.modules.scenes.plot.model.vo.PlotVO;
import mainGame.modules.scenes.plot.view.OptionView;
import mainGame.modules.scenes.plot.view.PlotView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.display.DisplayObject;

import starling.display.Image;

import starling.events.Event;
import starling.events.TouchEvent;

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
        eventMap.mapListener(eventDispatcher, PlotEvent.DIALOGUE_SHOW_PAGE, onUpdateDialogue);
        eventMap.mapListener(eventDispatcher, PlotEvent.EVENT_START, onEventStart);
        eventMap.mapListener(eventDispatcher, PlotEvent.EVENT_END, onEventEnd);
        //view to event
//        view.addEventListener(Event.COMPLETE, onDialogueClick);
        eventMap.mapStarlingListener(view.dialogueUI,Event.TRIGGERED,onDialogueClick);
        //right click
        model.addRightClickHandle(view.dialogueUI, onRightClickBg);
        model.addLeftClickHandle(view.dialogueUI, onDialogueClick);
        //初始化事件处理
        initEventDic();
        //开始最初剧情
        dispatch(new PlotEvent(PlotEvent.PLOT_START, modelPlayer.currentPlot));
    }

    private function onRightClickBg():void {
        trace(this, "右键对话框 弹出右键菜单");
        Game.showConfig();
    }

    private function onTouchBg(e:Event):void {

    }

    private function onUpdateDialogue(e:PlotEvent):void {
        if (e.payload)
            var str:String = e.payload as String;
        view.updateDialogue(str, "background");
    }

    private function onDialogueClick():void {
        dispatch(new PlotEvent(PlotEvent.DIALOGUE_END));
        trace(this, "onDialogueClick end");
    }

    //执行事件
    private function initEventDic():void {
        eventToFunc = new Dictionary();
        eventToFunc[IncidentVO.TYPE_DELAY] = e_Delay;
        eventToFunc[IncidentVO.TYPE_DIALOGUE] = e_Dialogue;
        eventToFunc[IncidentVO.TYPE_OPTION] = e_Option;
        eventToFunc[IncidentVO.TYPE_MOTION] = e_Motion;
        eventToFunc[IncidentVO.TYPE_CG] = e_CG;
    }
    private function onEventStart(e:PlotEvent):void {
        var eVO:IncidentVO = e.payload as IncidentVO;
        eventToFunc[eVO.type](eVO);
    }

    private function onEventEnd():void {
        dispatch(new PlotEvent(PlotEvent.PLOT_START));
    }

    private function e_Delay(eVO:IncidentVO):void {
        trace(this, "e_Delay");
    }

    private function e_Dialogue(eVO:IncidentVO):void {
        var avatarId:String=eVO.params[0];
        var dialogue:String=eVO.params[1];
        plotModel.layoutDialogue(dialogue);
        view.updateAvatar(avatarId);
        dispatch(new PlotEvent(PlotEvent.DIALOGUE_END));
        trace(this, "e_Dialogue");
    }

    private function e_Option(eVO:IncidentVO):void {
        if(view.optionView)
            view.optionView.clear();

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
    private function e_Motion(eVO:IncidentVO):void {
        onEventEnd();
    }

    private function e_CG(eVO:IncidentVO):void {
           onEventEnd();
    }
}
}