import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0


Window {
	id : root
	width: 400
	//maximumWidth : 1280
	//minimumWidth : width
    height: 400
	//maximumHeight : 800
	//minimumHeight : height
	title:"membuat MINI SCADA HMI"
	color : "#FF96C5"
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	Button{
	id : button1
	x : 50
	y : 150
	width : 90
	height : 90
	checkable : true
	checked : false
		
		Rectangle {
			id : button1_color
			width : parent.width
			height : parent.height
			color : "#340040"
		}
		
		Text{
		x: 10
		y : 10
		text : "button1"
		//font.family : "Comic Sans"
		font.pixelSize : 15
		
		}
		
		
	
	}
	
	
	
	Button{
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
		
		Text{
		x: 10
		y : 10
		text : "button2"
		//font.family : "Comic Sans"
		font.pixelSize : 15
		
		}
		
		
	
	}
	
	
	
	
	
	
	
	
	
	Timer{
		id:guitimer
		interval: 200
		repeat: true
		running: true
		onTriggered: {
		
		if (button1.checked == true){
			button1_color.color = "#F2055C"
			backend.button1("1")
		}
		
		if (button1.checked == false){
			button1_color.color = "#340040"
			backend.button1("0")
		}
		
		
		if (button2.checked == true){
			button2_color.color = "#F2055C"
			backend.button2("1")
		}
		
		if (button2.checked == false){
			button2_color.color = "#340040"
			backend.button2("0")
		}
		
		
		
		
		}
		
		
	}
	
}













