/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 上午10:25
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.dialogue.view {
import ex.SpriteSTL;

import feathers.controls.Button;

import feathers.controls.Label;


import flash.utils.Dictionary;

import mainGame.Constants;

import mainGame.Game;
import mainGame.modules.scenes.dialogue.model.vo.OptionVO;
import mainGame.modules.scenes.dialogue.model.events.DialogueEvent;

import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.events.Event;

public class OptionView extends SpriteSTL {
    private var _optionList:Array;
    private var _bg:Image;
    private var _title:Label;
    private var _textToFunc:Dictionary;
    private var this_:OptionView;

    private const contentX:int;
    public function OptionView(parent:DisplayObjectContainer = null) {
        super(parent);
        init();
        test();
    }

    private function test():void {
        this_=this;
        _title.y=50;
        _title.x=20;
        addChild(_title);
        var option:Array=new Array();
        option.push(new OptionVO("no chocolate",10001));
        option.push(new OptionVO("no chocolate~",10002));
        option.push(new OptionVO("no chocolate~yooo",10002));
        option.push(new OptionVO("no chocolate~yooooooo",10002));
        updateOption("valentine's event",option);
    }

    private function init():void {
        _optionList=new Array();
        _textToFunc=new Dictionary();
        _title=new Label();
        addChild(_title);

        _bg=new Image(Game.assets.getTexture(Constants.UI_DIALOGUE));
        addChild(_bg);
    }

    public function updateOption(title:String,optionList:Array):void {
        _title.text="<font color='#FFeecc'><b>%s</b></font>".replace('%s',title);
        _title.width=this.width;
        var preX:int=20;
        var preY:int=100;
        var option:Button;
        for each (var optionVO:OptionVO in optionList) {
            _textToFunc[optionVO.text]=optionVO.plotId;
            option=new Button();
            option.x = preX;
            option.y = preY;
            option.label=optionVO.text;
//            option.text=optionVO.text;
            option.width=this.width;
            option.addEventListener(Event.TRIGGERED,onSelectOption);
            addChild(option);
            trace(this,"new option",optionVO.text);
            preY+=30;
        }
    }

    private function onSelectOption(e:Event):void {
//        var plotId:int = _textToFunc[(e.target as Label).text];
        var plotId:int = _textToFunc[(e.target as Button).label];
        dispatchEvent(new Event(DialogueEvent.SELECT_OPTION,false,plotId));
        clear();
    }

    private function clear():void {
        _textToFunc=null;
        this.removeChildren(0,-1,true);
        this.parent.removeChild(this_);
        this.dispose();
    }
}
}
