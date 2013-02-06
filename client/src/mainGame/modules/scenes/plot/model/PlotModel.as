package mainGame.modules.scenes.plot.model {
import flash.utils.Dictionary;

import mainGame.modules.scenes.plot.model.vo.IncidentVO;

import mainGame.modules.scenes.plot.model.vo.PlotVO;

import org.robotlegs.mvcs.Actor;

public class PlotModel extends Actor {
    /**
     *
     */
    private static const pageLimit:int = 400;
    /**
     *每行最大字数
     */
    private static const lineLimit:int = 30;
    private static const numLine:int = 4;
    private static const newLineChar:String = "|";

//    private var _dialogue:String = "1234567890The quic|k brown fox jumps over the lazy dog 中文中文是电风扇的发达的法师法上师大神鼎飞丹砂";
    //剧情信息
    private var __plotDic:Dictionary;
    private var __eventDic:Dictionary;

    private var _pagesToShow:Array;
    private var _currentPageIdx:int;

    public var currentPlotVO:PlotVO;

    public function PlotModel() {
        super();
        __plotDic = new Dictionary();
        __eventDic = new Dictionary();
        //test
//        layoutDialogue();
    }
    //对话内容分页
    public function layoutDialogue(dialogue:String):void {
        var line:String = "";
        var lines:Array = new Array();
        var strIdx:String = "";
        _pagesToShow = new Array();
        for (var i:int = 0; i < dialogue.length; i++) {
            strIdx = dialogue.charAt(i)
            if (strIdx != newLineChar)
                line += strIdx;
            if (line.length == lineLimit || strIdx == newLineChar) {
                line += "\n";
                lines.push(line);
                line = "";
                if (lines.length == numLine) {
                    _pagesToShow.push(lines.toString());
                    lines = new Array();
                }
            }
        }
        if (line != "") {
            lines.push(line);
            line = "";
            _pagesToShow.push(lines.concat());
            lines.length = 0;
        }
    }

    public function getNextPage():String {
        if (_pagesToShow&&_currentPageIdx<_pagesToShow.length-1) {
            return _pagesToShow[_currentPageIdx++];
        }
        else
            return null;
    }

    public function getPrePage():String {
        if (_pagesToShow&&_currentPageIdx>0) {
            return _pagesToShow[_currentPageIdx--];
        }
        else
            return null;
    }

    public function getPlotVO(pId:int):PlotVO {
        return __plotDic[pId];
    }

    public function setIncident(eId:int, eVO:IncidentVO):void {
        __eventDic[eId] = eVO;
        var pVO:PlotVO=getPlotVO(eVO.plotId);
        pVO.eventList.push(eVO);
    }

    public function setPlot(pId:int, pVO:PlotVO):void {
        __plotDic[pId] = pVO;
    }

    public function clearCurrentPlot():void {
        currentPlotVO = null;
    }
}
}