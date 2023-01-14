import QtQuick 2.12
import QtQuick.Window 2.13
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0
import "controls"


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
	
	CircularSlider {
                id: gauge
                hideProgress: true
                hideTrack: true
                width: 300
                height: 300

                interactive: true
                value: 0//(gauge2.value).toFixed()
				minValue: 0
                maxValue: 100

                Repeater {
                    model: 72

                    Rectangle {
                        id: indicator
                        width: 5
                        height: 20
                        radius: width / 2
                        color: indicator.angle > gauge.angle ? "#16171C" : "#F2055C"
                        readonly property real angle: index * 5
                        transform: [
                            Translate {
                                x: gauge.width / 2 - width / 2
                            },
                            Rotation {
                                origin.x: gauge.width / 2
                                origin.y: gauge.height / 2
                                angle: indicator.angle
                            }
                        ]
                    
					
					
					
					}
                }
				
				Text{
						anchors.horizontalCenter: parent.horizontalCenter
						anchors.verticalCenter: parent.verticalCenter
						text : gauge.value
						font.pixelSize : 30
						color : "white"
						
					}
            }

 
	
	CircularSlider {
                id: gauge2
				x: 350
				y: 0
                value: 0//gauge.value
                //onValueChanged: handlePage.newVal = value
				interactive: true
                width: 300
                height: 300
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
                        x: (gauge2.handleWidth - width) / 2
                        y: gauge2.handleHeight / 2
                    }

                    width: 10
                    height: gauge2.height / 2
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
                    color: "white"
                    text: Number(gauge2.value).toFixed()
					//font.family : "HarmoniaSansW01-Bold"
                }
            }
            
	
	
	Timer{
		id:tmgauge
		interval: 200
		repeat: true
		running: true
		onTriggered: {
			 backend.slider(gauge2.value)
			 gauge.value = (gauge2.value).toFixed()
		}
		
	}
	
	
}













