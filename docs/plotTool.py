#-*- coding: UTF-8 -*-
import xlrd
import os
import sys
import urllib2, urllib
reload(sys)
sys.setdefaultencoding('utf-8')


def main():
	wb = xlrd.open_workbook(excelUrl)
	write2xml(wb,shSceneUnit,sceneUnit.getEcMap(),'sceneUnit',folder+"sceneUnit.xml")
	pass

def write2xml(wb,sheetName,ecMap,xmlElement,url):
	print sheetName
	sh=wb.sheet_by_name(sheetName)
	root = ET.Element("root")
	group=False
	isValue=True
	array=[]
	strTmp=''
	for index in xrange(1,sh.nrows):
		if int(sh.cell_value(index,0))==0:
			continue
			pass
		item = ET.SubElement(root, xmlElement)
		data={}
		for x in xrange(0,len(ecMap)):
		    ecMap[x]['value']=sh.cell_value(index,getIdx(ecMap[x]))
		    # isinstance(lst, (int, str, list))
		    if isinstance(ecMap[x]['value'],float):
		        ecMap[x]['value']=int(ecMap[x]['value'])
		        pass
		    # 不需要生成xml的属性留空
		    if ecMap[x]['xml']!='':
		    	item.set(ecMap[x]['xml'],str(ecMap[x]['value']))
		    	pass
		    # 不需要入数据库的属性留空
		    if ecMap[x]['column']!='':
		    	if 1:
		    		pass
		    	else:
			    	data[ecMap[x]['column']]=str(ecMap[x]['value'])
		    	pass
		if group!=True:
			postSwitch(sheetName,data)
			pass
		pass
	pass
	tree = ET.ElementTree(indent(root))
	tree.write(url, encoding="UTF-8")
	print 'write to',url
	pass

if __name__ == '__main__':
	main()