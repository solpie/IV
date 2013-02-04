package mainGame.modules.scenes.dialogue
{
import mainGame.Game;
import mainGame.model.GameModel;
import mainGame.modules.scenes.dialogue.model.events.DialogueEvent;
import mainGame.modules.scenes.dialogue.view.DialogueView;
import mainGame.modules.scenes.dialogue.view.OptionView;

import org.robotlegs.mvcs.StarlingMediator;

import starling.events.Event;

public class DialogueViewMediator extends StarlingMediator
{
    [Inject]
    public var view:DialogueView;
    [Inject]
    public var model:GameModel;

    public function DialogueViewMediator(){super();}

    override public function onRegister():void
    {
        //event to view
        eventMap.mapListener(eventDispatcher,DialogueEvent.E_DIALOGUE,onUpdateDialogue);
        //view to event
        view.addEventListener(Event.COMPLETE,onDialogueClick);
        //right click
        model.addRightClickHandle(view.dialogueMask,onRightClickBg);
    }



    private function onRightClickBg():void {
        //todo 弹出右键菜单
        trace(this, " 弹出右键菜单");
        Game.showConfig();
    }

    private function onTouchBg(e:Event):void {

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