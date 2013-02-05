package mainGame.modules.scenes.plot {
import flash.utils.Dictionary;

import mainGame.Game;
import mainGame.model.GameModel;
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.plot.model.events.PlotEvent;
import mainGame.modules.scenes.plot.model.vo.EventVO;
import mainGame.modules.scenes.plot.view.PlotView;
import mainGame.modules.scenes.plot.view.OptionView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class PlotViewMediator extends StarlingMediator {
    [Inject]
    public var view:PlotView;
    [Inject]
    public var model:GameModel;
    [Inject]
    public var modelPlayer:PlayerModel;

    private var eventToFunc:Dictionary;

    public function PlotViewMediator() {
        super();
    }

    override public function onRegister():void {
        //event to view
        eventMap.mapListener(eventDispatcher, PlotEvent.E_DIALOGUE, onUpdateDialogue);
        //view to event
        view.addEventListener(Event.COMPLETE, onDialogueClick);
        //right click
        model.addRightClickHandle(view.dialogueMask, onRightClickBg);

        //开始最初剧情
        dispatch(new PlotEvent(PlotEvent.SELECT_OPTION, modelPlayer.currentPlot));
    }

    private function initEventDic():void {
        eventToFunc = new Dictionary();
        eventToFunc[EventVO.TYPE_DELAY] = e_Delay;
        eventToFunc[EventVO.TYPE_DIALOGUE] = e_Dialogue;
        eventToFunc[EventVO.TYPE_OPTION] = e_Option;
    }


    private function e_Delay(eVO:EventVO):void {

    }

    private function e_Dialogue(eVO:EventVO):void {

    }

    private function e_Option(eVO:EventVO):void {

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
}
}