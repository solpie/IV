/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-2-4
 * Time: 上午10:25
 * To change this template use File | Settings | File Templates.
 */
package mainGame.modules.scenes.dialogue.view {
import ex.SpriteSTL;

import feathers.controls.Label;


import flash.utils.Dictionary;

import mainGame.Constants;

import mainGame.Game;
import mainGame.modules.scenes.dialogue.model.OptionVO;

import starling.display.DisplayObjectContainer;
import starling.display.Image;
import starling.events.Event;

public class OptionView extends SpriteSTL {
    private var _optionList:Array;
    private var _bg:Image;
    private var _title:Label;
    private var _textToFunc:Dictionary;
    public function OptionView(parent:DisplayObjectContainer = null) {
        super(parent);
        init();
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
        _title.text=title;
        var preX:int=20;
        var preY:int=40;
        var option:Label;
        for each (var optionVO:OptionVO in optionList) {
            _textToFunc[optionVO.text]=optionVO.plotId;
            option=new Label();
            option.x = preX;
            option.y = preY+30;
            option.text=optionVO.text;
            option.addEventListener(Event.TRIGGERED,onSlectOption);
            addChild(option);
        }
    }

    private function onSlectOption(e:Event):void {
        var plotId:int = _textToFunc[(e.target as Label).text];
        dispatchEvent(new Event(Event.COMPLETE,false,plotId));
    }
}
}
