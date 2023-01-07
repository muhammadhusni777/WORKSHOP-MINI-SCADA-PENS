import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import QtQuick.Shapes 1.14
import QtCharts 2.1
import "controls"


Window {
	id : root
	width: 800
	maximumWidth : 800
	minimumWidth : width
    height: 650
	maximumHeight : 650
	minimumHeight : height
	title:"Outseal SCADA Display"
	color : "#05F26C" //#340040
	//color : "transparent"
	opacity : 1
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	Rectangle{
		x: 50
		y : 10
		width : 680
		height : 130
		border.width : 5
		color : "#F2055C"
		border.color : "#340040"
		opacity: 1
		
		
	Rectangle {
		width : 100
		height : parent.height
		color : "#340040"
		
	Image {
		x: 10
		anchors.verticalCenter: parent.verticalCenter
		width : 70
		height : 70
		source : "image/outseal_red.png"
		
	}
	}
	
	Text{
		x: 130
		//anchors.horizontalCenter: parent.horizontalCenter
		y : 10
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 39
		text : "PyQt5 outseal hmi-scada"
		color : "#340040"
	}
	
	Text{
		x:130
		//anchors.horizontalCenter: parent.horizontalCenter
		y : 70
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "written by : Muhammad Husni"
		color : "#340040"
	}
	
	
	
	
	}
	///////////////////////////////////////////////////////////
	Button {
		id : button1
		x : 50
		y : 150
		width : 90
		height : 90
		checkable : true
		checked : true
		Rectangle {
		id : button1_color
		
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		Image {
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		width : parent.width - 10
		height : parent.height - 10
		source : "image/micro.png"
		
		}
		
		
		onClicked:{
		
		if (button1.checked == true){
			button2.checked = false
			button3.checked = false
			
		}
		
		
		
		
		}
	
	}
	
	Button {
		id : button2
		x : 50
		y : 250
		width : 90
		height : 90
		checkable : true
		checked : false
		Rectangle {
		id : button2_color
		
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		
		Image {
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		width : parent.width - 10
		height : parent.height - 10
		source : "image/gauge.png"
		
		}
		
		onClicked:{
		
		if (button2.checked == true){
			button1.checked = false
			button3.checked = false
			
		}
		
		}
		
	
	}
	
	Button {
		id : button3
		x : 50
		y : 350
		width : 90
		height : 90
		checkable : true
		checked : false
		Rectangle {
		id : button3_color
		
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		
		Image {
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		width : parent.width - 10
		height : parent.height - 10
		source : "image/graph.png"
		
		}
		
		onClicked:{
		
		if (button3.checked == true){
			button2.checked = false
			button1.checked = false
			
		}
	
	}
	
	}
	
	Button {
		id : button4
		x : 50
		y : 450
		width : 90
		height : 90
		visible : false
		Rectangle {
		id : button4_color
		
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		
	}
	Button {
		x : 50
		y : 550
		width : 90
		height : 90
		visible : false
	
	}
	
	///////////////////////////////////////////////////////////
	Rectangle{
		id : page1
		x: 150
		y : 150
		width : 580
		height : 490
		border.width : 5
		color : "#07F2F2"
		border.color : "#340040"
		opacity: 1
		visible : button1.checked
		
		
		Text{
		anchors.horizontalCenter: parent.horizontalCenter
		y : 10
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "Outseal Digital I/O"
		color : "#340040"
		}
		
		
		
		
		
		
		Rectangle{
		x : 0
		y : 60
		width : 580
		height : 5
		color : "#340040"
		}
		
		Rectangle{
		x : 280
		y : 65
		width : 5
		height : 425
		color : "#340040"
		}
		
		Text{
		x: 10
		y : 70
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "PC -> outseal plc"
		color : "#340040"
		}
		
		
		Button {
		id : button_outseal1
		x : 10
		y : 120
		width : 250
		height : 40
		checkable : true
		checked : false
		
		Rectangle {
		id : button_outseal1_color
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		onClicked:{
	
		}
		
		Text {
			id : button_outseal1_status
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "B1 : "
			color : "#07F2F2"
		}
	
	}
	
		
		
		Button {
		id : button_outseal2
		x : 10
		y : 180
		width : 250
		height : 40
		checkable : true
		checked : false
		
		Rectangle {
		id : button_outseal2_color
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		onClicked:{
	
		}
		
		Text {
			id : button_outseal2_status
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "B2 : "
			color : "#07F2F2"
		}
	
	}
	
		
		Button {
		id : button_outseal3
		x : 10
		y : 240
		width : 250
		height : 40
		checkable : true
		checked : false
		
		Rectangle {
		id : button_outseal3_color
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		onClicked:{
	
		}
		
		Text {
			id : button_outseal3_status
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "B3 : "
			color : "#07F2F2"
		}
	
	}
	
		Button {
		id : button_outseal4
		x : 10
		y : 300
		width : 250
		height : 40
		checkable : true
		checked : false
		
		Rectangle {
		id : button_outseal4_color
		width : parent.width
		height : parent.height
		color : "#340040"
		}
		
		onClicked:{
	
		}
		
		Text {
			id : button_outseal4_status
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "B4 : "
			color : "#07F2F2"
		}
	
	}
	
		
		
		Rectangle {
		id : indicator1_color
		x: 300
		y : 120
		
		width : 250
		height : 40
		color : "#340040"
		
		Text {
			id : indicator1
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "R9 : "
			color : "#07F2F2"
		}
		
		
		}
		
		Rectangle {
		id : indicator2_color
		x: 300
		y : 180
		
		width : 250
		height : 40
		color : "#340040"
		
		Text {
			id : indicator2
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "R10 : "
			color : "#07F2F2"
		}
		
		
		}
		
		Rectangle {
		id : indicator3_color
		x: 300
		y : 240
		
		width : 250
		height : 40
		color : "#340040"
		
		Text {
			id : indicator3
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "R11 : "
			color : "#07F2F2"
		}
		
		
		}
		
		Rectangle {
		id : indicator4_color
		x: 300
		y : 300
		
		width : 250
		height : 40
		color : "#340040"
		
		Text {
			id : indicator4
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "R12 : "
			color : "#07F2F2"
		}
		
		
		}
		
		
		Text{
		x: 300
		y : 70
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "PC <- outseal plc"
		color : "#340040"
		}
		
		
		Text{
		id : discrete_input
		x: 10
		y : 400
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 23
		text : ""
		color : "#340040"
		}
		
		
		Text{
		id : coil_relay_address
		x: 300
		y : 400
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 23
		text : ""
		color : "#340040"
		}
		
		
		
		
		
		
		
		
		
		
		
		
		}
		
		
	Rectangle{
		id : page2
		x: 150
		y : 150
		width : 580
		height : 490
		border.width : 5
		color : "#07F2F2"
		border.color : "#340040"
		opacity: 1
		visible : button2.checked
		
		
		Text{
		anchors.horizontalCenter: parent.horizontalCenter
		y : 10
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "Outseal Analog I/O"
		color : "#340040"
		}
		
		Rectangle{
		x : 0
		y : 60
		width : 580
		height : 5
		color : "#340040"
		}
		//////////////////////////////////////////
		Text{
		x : 10
		y : 130
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 23
		text : "PC -> Outseal PLC \nMemory Address : I.1 \nHolding Register : 40001"
		color : "#340040"
		}
		
		
		Rectangle{
		x : 330
		y : 80
		
		CircularSlider {
                id: slider_input
                value: 0
                //onValueChanged: handlePage.newVal = value
                width: 200
                height: 200
                startAngle: 40
                endAngle: 320
                rotation: 180
                trackWidth: 5
                progressWidth: 20
                minValue: 0
                maxValue: 100
                progressColor: "#F2055C"
                capStyle: Qt.FlatCap

                handle: Rectangle {
                    transform: Translate {
                        x: (slider_input.handleWidth - width) / 2
                        y: slider_input.handleHeight / 2
                    }

                    width: 10
                    height: slider_input.height / 2
                    color: "#05F26C"
                    radius: width / 2
                    antialiasing: true
					border.width : 3
					border.color : "#340040"
                }

                Text {
                    anchors.centerIn: parent
                    anchors.verticalCenterOffset: -40
                    rotation: 180
                    font.pointSize: 20
                    color: "#340040"
                    text: Number(slider_input.value).toFixed()
					font.family : "HarmoniaSansW01-Bold"
                }
            }
            
			
		}
		///////////////////////////////////////////////////////
		Rectangle{
		x : 0
		y : 270
		width : 580
		height : 5
		color : "#340040"
		}
		
		
		///////////////////////////////////////////////////////
		Rectangle{
			x: 30
			y : 290
			width : 180
			height : 180
			color : "transparent"
			
			Text{
				x : 200
				y : 20
				font.family : "HarmoniaSansW01-Bold"
				font.pixelSize : 23
				text : "PC <- Outseal PLC \nMemory Address : I.2 \nHolding Register : 40002"
				color : "#340040"
		}
			
			Text {
                    anchors.centerIn: parent
                    font.pointSize: 20
                    color: "#340040"
                    text: Number(progressIndicator.value).toFixed()
					font.family : "HarmoniaSansW01-Bold"
                }
			
		
		CircularSlider {
                id: progressIndicator
                hideProgress: true
                hideTrack: true
                width: parent.width
                height: parent.height

                interactive: false
                value: 75
				minValue: 0
                maxValue: 100

                Repeater {
                    model: 72

                    Rectangle {
                        id: indicator
                        width: 5
                        height: 20
                        radius: width / 2
                        color: indicator.angle > progressIndicator.angle ? "#16171C" : "#F2055C"
                        readonly property real angle: index * 5
                        transform: [
                            Translate {
                                x: progressIndicator.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: progressIndicator.width / 2
                                origin.y: progressIndicator.height / 2
                                angle: indicator.angle
                            }
                        ]
                    }
                }
            }

 
		}
		}
		
		
	Rectangle{
		id : page3
		x: 150
		y : 150
		width : 580
		height : 490
		border.width : 5
		color : "#07F2F2"
		border.color : "#340040"
		opacity: 1
		visible : button3.checked
		
	Text{
		anchors.horizontalCenter: parent.horizontalCenter
		y : 10
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 25
		text : "Analog Graph"
		color : "#340040"
		}
		
		
	Text{
		x:10
		y : 50
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 20
		text : "PC -> Outseal PLC"
		color : "#340040"
		}
		
	Text{
		x:10
		y : 270
		font.family : "HarmoniaSansW01-Bold"
		font.pixelSize : 20
		text : "PC <- Outseal PLC"
		color : "#340040"
		}
	
	
	
	Rectangle {
                    id: pc_to_outseal_graph
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 70
                    width: parent.width
                    height:200
					color:"transparent"
					
					ChartView {
						id : cv
						//title: "PAYOUT ROPE"
						antialiasing: true
						legend.visible: false
						height: parent.height
						anchors.right: parent.right
						anchors.left: parent.left
						//theme: ChartView.ChartThemeLight
						backgroundColor:"#340040"
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
						labelsColor: "#07F2F2"
					}
						
						
						LineSeries {
						//name: "LineSeries"
						name: "AIN 0"
						id:lines1
						width: 4
						color: "#07F2F2"
						axisY: yAxis1
						axisX: 	DateTimeAxis {
							id: eje4
							//format: "yyyy MMM"
							format:"HH:mm:ss.z"
							//format:"mm:ss.z"
							labelsColor: "#07F2F2"
							
						
						}
					}
						
				}
			}
			
	
	
	Rectangle {
                    id: outseal_to_pc_graph
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: 290
                    width: parent.width
                    height:200
					color:"transparent"
					
					ChartView {
						id : cv1
						//title: "PAYOUT ROPE"
						antialiasing: true
						legend.visible: false
						height: parent.height
						anchors.right: parent.right
						anchors.left: parent.left
						//theme: ChartView.ChartThemeLight
						backgroundColor:"#340040"
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
						id:yAxis2
						min: 0
						max : 100
						tickCount: 1
						//labelFormat: "%d"
						labelsColor: "#07F2F2"
					}
						
						
						LineSeries {
						//name: "LineSeries"
						name: "AIN 0"
						id:lines2
						width: 4
						color: "#eaf205"
						axisY: yAxis2
						axisX: 	DateTimeAxis {
							id: eje5
							//format: "yyyy MMM"
							format:"HH:mm:ss.z"
							//format:"mm:ss.z"
							labelsColor: "#07F2F2"
							
						
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
				cv.valueCH1 = slider_input.value
				cv1.valueCH1 = progressIndicator.value
				
				if (lines1.count>cv.periodGRAPH*500/cv.intervalTM){
					lines1.remove(0)
					lines2.remove(0)
					}
				
				lines1.append(cv.startTIME+cv.timcnt*cv.intervalTM ,cv.valueCH1)
				lines1.axisX.min = new Date(cv.startTIME-cv.periodGRAPH*500 + cv.timcnt*cv.intervalTM)
				lines1.axisX.max = new Date(cv.startTIME + cv.timcnt*cv.intervalTM)
				
				
				lines2.append(cv.startTIME+cv.timcnt*cv.intervalTM ,cv1.valueCH1)
				lines2.axisX.min = new Date(cv.startTIME-cv.periodGRAPH*500 + cv.timcnt*cv.intervalTM)
				lines2.axisX.max = new Date(cv.startTIME + cv.timcnt*cv.intervalTM)
				
				}
	  
			}
		
		
	
	
	
	Component.onCompleted: {
		cv.startTIME = backend.get_tiempo()*1000
	}
	
	
		
	}
		
	Rectangle{
		id : page4
		x: 150
		y : 150
		width : 580
		height : 490
		border.width : 5
		color : "#07F2F2"
		border.color : "#340040"
		opacity: 1
		visible : false
		
		}
	
	
	Timer{
		id:tmgauge
		interval: 200
		repeat: true
		running: true
		onTriggered: {
		
		if (button1.checked == true){
			button1_color.color = "#F2055C"
		}
		
		if (button1.checked == false){
			button1_color.color = "#340040"
		}
		
		
		if (button2.checked == true){
			button2_color.color = "#F2055C"
		}
		
		if (button2.checked == false){
			button2_color.color = "#340040"
		
		}
		
		if (button3.checked == true){
			button3_color.color = "#F2055C"
		}
		
		if (button3.checked == false){
			button3_color.color = "#340040"
		
		}
		
		
		var b1 = button_outseal1.checked ? 1 :0;
		var b2 = button_outseal2.checked ? 1 :0;
		var b3 = button_outseal3.checked ? 1 :0;
		var b4 = button_outseal4.checked ? 1 :0;
		

		if (backend.indicator1_status() == "off"){
			indicator1.text = "R9 : 0"
			var status1 = "0"
			indicator1_color.color = "#340040"
		}
		
		if (backend.indicator1_status() == "on"){
			indicator1.text = "R9 : 1"
			var status1 = "1"
			indicator1_color.color = "#F2055C"
		}
		
		if (backend.indicator2_status() == "off"){
			indicator2.text = "R10 : 0"
			var status2 = "0"
			indicator2_color.color = "#340040"
		}
		
		if (backend.indicator2_status() == "on"){
			indicator2.text = "R10 : 1"
			var status2 = "1"
			indicator2_color.color = "#F2055C"
		}
		
		if (backend.indicator3_status() == "off"){
			indicator3.text = "R11 : 0"
			var status3 = "0"
			indicator3_color.color = "#340040"
		}
		
		if (backend.indicator3_status() == "on"){
			indicator3.text = "R11 : 1"
			var status3 = "1"
			indicator3_color.color = "#F2055C"
		}
		
		if (backend.indicator4_status() == "off"){
			indicator4.text = "R12 : 0"
			var status4 = "0"
			indicator4_color.color = "#340040"
		}
		
		if (backend.indicator4_status() == "on"){
			indicator4.text = "R12 : 1"
			var status4 = "1"
			indicator4_color.color = "#F2055C"
		}
		
		
		discrete_input.text = "coils address 128 - 131 : \n" + "["+ b1 + "," + b2 + ","+ b3 + "," + b4 + "]"

		coil_relay_address.text = "coils address 9 - 12 : \n" + "["+status1+"," + status2 +"," +status3 +"," + status4+ "]"

		if (button_outseal1.checked == true){
			button_outseal1_color.color = "#F2055C"
			button_outseal1_status.text = "B1 : 1"
			backend.button1("1")
			
		}
		
		if (button_outseal1.checked == false){
			button_outseal1_color.color = "#340040"
			button_outseal1_status.text = "B1 : 0"
			backend.button1("0")
		}
		
		if (button_outseal2.checked == true){
			button_outseal2_color.color = "#F2055C"
			button_outseal2_status.text = "B2 : 1"
			backend.button2("1")
		}
		
		if (button_outseal2.checked == false){
			button_outseal2_color.color = "#340040"
			button_outseal2_status.text = "B2 : 0"
			backend.button2("0")
		}
		
		if (button_outseal3.checked == true){
			button_outseal3_color.color = "#F2055C"
			button_outseal3_status.text = "B3 : 1"
			backend.button3("1")
		}
		
		if (button_outseal3.checked == false){
			button_outseal3_color.color = "#340040"
			button_outseal3_status.text = "B3 : 0"
			backend.button3("0")
		}
		
		if (button_outseal4.checked == true){
			button_outseal4_color.color = "#F2055C"
			button_outseal4_status.text = "B4 : 1"
			backend.button4("1")
		}
		
		if (button_outseal4.checked == false){
			button_outseal4_color.color = "#340040"
			button_outseal4_status.text = "B4 : 0"
			backend.button4("0")
		}
		
		progressIndicator.value = backend.sensor()
		backend.slider((slider_input.value).toFixed())
		
		
		}
	}
	
	

	
}













