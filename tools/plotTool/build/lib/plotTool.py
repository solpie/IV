#-*- coding: UTF-8 -*-
import xlrd
import os
import sys
import plotSheet
import eventSheet
import urllib2, urllib
import binascii
import xml.etree.ElementTree as ET

reload(sys)
sys.setdefaultencoding('utf-8')

# excel配置
excelUrl = u"剧情配置表 2.5.xls"
shPlot = "剧情表"
shEvent = "事件表"
folder = "out/"


def main():
    wb = xlrd.open_workbook(excelUrl)
    write2xml(wb, shPlot, 1, plotSheet.getEcMap(), 'plot', folder + "plot.xml")
    write2xml(wb, shEvent, 22, eventSheet.getEcMap(), 'event', folder + "event.xml")
    pass


def a2idx(ascii):
    length = len(ascii) - 1
    return int(binascii.b2a_hex(ascii.lower()[length]), 16) - 0x61 + 26 * length
    pass


def getIdx(dic):
    return a2idx(str(dic['idx']))
    pass


def indent(elem, level=0):
## Get pretty look
    i = "\n" + level * "  "
    if len(elem):
        if not elem.text or not elem.text.strip():
            elem.text = i + "  "
        for e in elem:
            indent(e, level + 1)
        if not e.tail or not e.tail.strip():
            e.tail = i
    if level and (not elem.tail or not elem.tail.strip()):
        elem.tail = i
    return elem


def write2xml(wb, sheetName, startRow, ecMap, xmlElement, url):
    print sheetName
    sh = wb.sheet_by_name(sheetName)
    root = ET.Element("root")
    group = False
    isValue = True
    array = []
    strTmp = ''
    for index in xrange(startRow, sh.nrows):
        valueIdx0 = sh.cell_value(index, 0)
        if not isinstance(valueIdx0, float):
            break
            pass
        if int(valueIdx0) == 0:
            continue
            pass
        item = ET.SubElement(root, xmlElement)
        data = {}
        for idx in xrange(0, len(ecMap)):
            ecMap[idx]['value'] = sh.cell_value(index, getIdx(ecMap[idx]))
            # isinstance(lst, (int, str, list))
            if isinstance(ecMap[idx]['value'], float):
                ecMap[idx]['value'] = int(ecMap[idx]['value'])
                pass
                # 不需要生成xml的属性留空
            if ecMap[idx]['xml'] != '':
                item.set(ecMap[idx]['xml'], str(ecMap[idx]['value']))
                pass
            if ecMap[idx]['column'] != '':
                pass
            if 0:
                pass
            else:
                data[ecMap[idx]['column']] = str(ecMap[idx]['value'])
            pass
        if group is not True:
        #            postSwitch(sheetName,data)
            pass
        pass
    pass
    tree = ET.ElementTree(indent(root))
    if url is not "":
        tree.write(url, encoding="UTF-8")
        print 'write to', url
        pass
    return tree
    pass


if __name__ == '__main__':
    main()