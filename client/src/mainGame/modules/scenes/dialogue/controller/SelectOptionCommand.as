/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 下午2:10
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.dialogue.controller {
import mainGame.modules.player.model.PlayerModel;
import mainGame.modules.scenes.dialogue.model.events.DialogueEvent;

import org.robotlegs.mvcs.StarlingCommand;

public class SelectOptionCommand extends StarlingCommand {
    [Inject]
    public var model:PlayerModel;

    [Inject]
    public var event:DialogueEvent;
    public function SelectOptionCommand() {
        super();
    }

    override public function execute():void {
        model.endPlotList.push(event.payload);
        trace(this, "select option command");
    }
}
}
