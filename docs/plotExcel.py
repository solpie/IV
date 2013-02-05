#-*- coding: UTF-8 -*-
import xlrd
import os
import sys
import urllib2, urllib
reload(sys)
sys.setdefaultencoding('utf-8')
# 服务端接口
postUrlPlot='http://192.168.1.245/client_test/game_admin/base_script_to_db.php?action=from_client'
postUrlEvent='http://192.168.1.245/client_test/game_admin/base_script_event_to_db.php?action=from_client'
sceneId=0
# Excel表配置
paramsSplit='-'
excelUrl=u"剧情配置表new.xls"
def post2php(url_,data_):
	print data_
	f = urllib2.urlopen(
        url     = url_,
        data    = urllib.urlencode(data_)
		)
	txt=f.read()
	log=file("log.txt",'w+b')
	log.write(txt)
	print txt
	pass

# 事件表开始excel行数
rowEventStart=23
rowPlotStart=3
def writePlot(filename,xml):
	f=open(filename,'w')
	f.write(xml)
	f.close()
	xml=''
	pass

def getEvent(reqId):
	reqId=int(reqId)
	wb = xlrd.open_workbook(excelUrl)
	shEvent = wb.sheet_by_name(u'事件表')
	print '获取',reqId,rowEventStart,shEvent.nrows
	for index in xrange(rowEventStart-1,shEvent.nrows):
		eventId=shEvent.cell(index,0).value
		eventType=shEvent.cell(index,1).value
		eventType=str(int(eventType))
		if isinstance(shEvent.cell(index,2).value,float):
			params=str(shEvent.cell(index,2).value)
			pass
		else:
			params=shEvent.cell(index,2).value.decode()
		# params=params.replace('{','').replace('}','')
		# print eventId
		# print cell.value
		if (eventId==reqId):
			
			eventId=str(int(eventId))
			# params=str(params)
			print '事件id',eventId,'参数',params
			# print 'found!'
			#-------------------post plot data to php----------------------------------
			data={'id':eventId,'type':eventType,'content':params}
			post2php(postUrlEvent,data)
			#-------------------post plot data to php----------------------------------
			return '<event type="'+eventType+'" params="'+params+'"/>\n'
			pass
		pass
	pass

def addTimeline(tl):
	xmlTL='<timeline>\n'
	eventList=tl.split(paramsSplit)
	print '事件个数',len(eventList)
	for i in xrange(0,len(eventList)):
		# getEvent(1001)
		event=eventList[i].replace('{','').replace('}','')
		print '时间线',i,'事件id',event
		xmlTL+=getEvent(event)
		pass
	return xmlTL+'</timeline>\n'
	pass

if __name__ == '__main__':

	wb = xlrd.open_workbook(excelUrl)
	shPlot=wb.sheet_by_name(u'剧情表')
	# nrows = sh.nrows
	# ncols = sh.ncols
	numPlot=shPlot.nrows-1
	print '剧情个数',numPlot
	#--------------------- 构造xml -------------------
	xml=0
	for index in xrange(rowPlotStart-1,shPlot.nrows):
		plotId=shPlot.cell(index,0).value
		plotId=str(int(plotId))
		plotName=shPlot.cell(index,1).value
		rect=shPlot.cell(index,2).value
		skipable=shPlot.cell(index,3).value
		skipable=str(int(skipable))
		timelineCell=shPlot.cell(index,4).value
		if shPlot.cell(index,5).value!='':
			postAction=int(shPlot.cell(index,5).value)
			pass
		else:
			postAction=''
			pass
		if isinstance(shPlot.cell(index,6).value,float):
			postActionParam='['+str(int(shPlot.cell(index,6).value))+']'
			pass
		else:
			postActionParam='['+str(shPlot.cell(index,6).value)+']'
			postActionParam=postActionParam.replace('-',',')
		# 不同场景
		if sceneId!=str(int(plotId))[0:4]:
			if xml!=0:
				xml+='</plot>\n</root>'
				writePlot('plot_'+str(sceneId)+'.xml',xml)
				print xml
				pass
			xml='<root>\n<plot id="'+plotId+'" name="'+plotName+'" rect="'+rect+'"'+' skipable="'+skipable+'">\n'
			sceneId=str(int(plotId))[0:4]
			pass
		else:
			xml+='</plot>\n'+'<plot id="'+plotId+'" name="'+plotName+'" rect="'+rect+'"'+' skipable="'+skipable+'">\n'
		#-------------------post plot data to php----------------------------------
		data={'id':plotId,'name':plotName,'condition':rect,'skip':skipable,'event_ids':str(timelineCell),'end_effect':postAction,'end_effect_param':postActionParam}
		post2php(postUrlPlot,data)
		#-------------------post plot data to php----------------------------------
		timeline=timelineCell.split('|')
		# pprint timeline
		# print timeline[0],len(timeline[0])
		for j in xrange(0,len(timeline)):
			xml+=addTimeline(timeline[j])
			pass

		if index==shPlot.nrows-1:
			xml+='</plot>\n</root>'
			writePlot('plot_'+str(sceneId)+'.xml',xml)
			sceneId=str(int(plotId))[0:4]
			print xml
			pass
		pass