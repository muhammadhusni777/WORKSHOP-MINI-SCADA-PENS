import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtCharts 2.1

Window {
	id : root
	width: 400
	//maximumWidth : 1280
	//minimumWidth : width
    height: 400
	//maximumHeight : 800
	//minimumHeight : height
	title:"membuat MINI SCADA HMI"
	color : "black"
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	
	Rectangle {
                    
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.height
					color:"#47B5FF"
					
					ChartView {
						id : cv
						//title: "PAYOUT ROPE"
						antialiasing: true
						legend.visible: false
						height: parent.height
						anchors.right: parent.right
						anchors.left: parent.left
						//theme: ChartView.ChartThemeLight
						backgroundColor:"#1089FF"
						property int  timcnt: 0
						property double  valueCH1: 0
						property double  valueCH2: 0
						property double  valueCH3: 0
						property double  valueCH4: 0
						//property double  valueTM1: 0        
						property double  periodGRAPH: 30 // Seconds
						property double  startTIME: 0
						property double  intervalTM: 200 // miliseconds
						
						
						ValueAxis{
						id:yAxis1
						min: 0
						max : 100
						tickCount: 1
						//labelFormat: "%d"
						labelsColor: "yellow"
					}
						
						
						LineSeries {
						//name: "LineSeries"
						name: "AIN 0"
						id:lines1
						width: 4
						color: "#21209C"
						axisY: yAxis1
						axisX: 	DateTimeAxis {
							id: eje4
							//format: "yyyy MMM"
							format:"HH:mm:ss.z"
							//format:"mm:ss.z"
							
						
						}
					}
						
				}
			}
			
	
	Timer{
			id:tm
			interval: cv.intervalTM
			repeat: true
			running: true
			onTriggered: {
				cv.timcnt = cv.timcnt + 1
				cv.valueCH1 = backend.sensor()
				
				if (lines1.count>cv.periodGRAPH*100/cv.intervalTM){
					lines1.remove(0)
					
					}
				
				lines1.append(cv.startTIME+cv.timcnt*cv.intervalTM ,cv.valueCH1)
				lines1.axisX.min = new Date(cv.startTIME-cv.periodGRAPH*100 + cv.timcnt*cv.intervalTM)
				lines1.axisX.max = new Date(cv.startTIME + cv.timcnt*cv.intervalTM)
				
				}
	  
			}
		
		
	
	Component.onCompleted: {
		cv.startTIME = backend.get_tiempo()*1000
	}
	
	
	
	
	
	
}













