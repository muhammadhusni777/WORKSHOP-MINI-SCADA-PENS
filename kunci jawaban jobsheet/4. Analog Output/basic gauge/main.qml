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
	color : "black"
    visible: true
    //flags: Qt.WindowMaximized //Qt.Dialog
	
	Slider {
		id : slider
		x: 10
		y: 70
		height : 250
		width : 250
		value: 0
		from: 0
		to: 100
		
	}
	
	Timer{
		id:tmgauge
		interval: 200
		repeat: true
		running: true
		onTriggered: {
			 backend.slider(slider.value)
		}
		
	}
	
	
}













