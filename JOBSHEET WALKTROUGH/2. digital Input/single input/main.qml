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
	
	Rectangle {
		id : indicator1_color
		x: 50
		y : 100
		
		width : 250
		height : 40
		color : "#340040"
		
		Text {
			id : indicator1
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.verticalCenter: parent.verticalCenter
			font.family : "HarmoniaSansW01-Bold"
			font.pixelSize : 20
			text : "R9"
			color : "#07F2F2"
		}
		
		
		}
	
	
	
	
	
	
	
	Timer{
		id:guitimer
		interval: 200
		repeat: true
		running: true
		onTriggered: {
		
		if (backend.indicator1_status() == "off"){
			indicator1.text = "R9 : 0"
			indicator1_color.color = "#340040"
		}
		
		if (backend.indicator1_status() == "on"){
			indicator1.text = "R9 : 1"
			indicator1_color.color = "#F2055C"
		}
		
		
		
		
		
		}
		
		
	}
	
}













