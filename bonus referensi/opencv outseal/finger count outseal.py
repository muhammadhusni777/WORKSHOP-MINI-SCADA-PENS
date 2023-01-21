import cv2
import time
import sys
import os
import HandTrackingModule as htm
import pymodbus

from pymodbus.pdu import ModbusRequest
from pymodbus.client.sync import ModbusSerialClient as ModbusClient
from pymodbus.register_read_message import ReadInputRegistersResponse
from pymodbus.transaction import ModbusRtuFramer
import serial
import time


def serial_ports():
    
    if sys.platform.startswith('win'):
        ports = ['COM%s' % (i + 1) for i in range(256)]
    elif sys.platform.startswith('linux') or sys.platform.startswith('cygwin'):
        # this excludes your current terminal "/dev/tty"
        ports = glob.glob('/dev/tty[A-Za-z]*')
    elif sys.platform.startswith('darwin'):
        ports = glob.glob('/dev/tty.*')
    else:
        raise EnvironmentError('Unsupported platform')

    result = []
    for port in ports:
        try:
            s = serial.Serial(port)
            s.close()
            result.append(port)
        except (OSError, serial.SerialException):
            pass
    return result
print(str(serial_ports()))

port = input("modbus port : ")

baudrate = input("modbus baudrate : ")

slave_id = input("slave id : ")

client = ModbusClient(method='rtu', port=port, baudrate=int(baudrate), parity='N', timeout=4,strict=False)
connection = client.connect()


time.sleep(2)

 
cap = cv2.VideoCapture(0)


cap.set(3,1280)
cap.set(4,720)

 
folderPath = "FingerImages"
myList = os.listdir(folderPath)
print(myList)
overlayList = []
for imPath in myList:
    
    image = cv2.imread(f'{folderPath}/{imPath}')

    overlayList.append(image)
print(len(overlayList))

pTime = 0
 
detector = htm.handDetector(detectionCon=0.75)
 
tipIds = [4, 8, 12, 16, 20]
 
while True:
    success, img = cap.read()
    img = detector.findHands(img)
    lmList = detector.findPosition(img, draw=False)
 
    if len(lmList) != 0:
        fingers = []
 

        if lmList[tipIds[0]][1] > lmList[tipIds[0] - 1][1]:
            fingers.append(1)
        else:
            fingers.append(0)
 
        # 4 Fingers
        for id in range(1, 5):
            if lmList[tipIds[id]][2] < lmList[tipIds[id] - 2][2]:
                fingers.append(1)
            else:
                fingers.append(0)

        totalFingers = fingers.count(1)
        print(totalFingers)
        
        
        request = client.read_holding_registers(address=0,count=0x7,unit=int(slave_id))
        request_coil = client.read_coils(address=0,count=15,unit=int(slave_id))
        
        
        if (totalFingers == 0):
            client.write_coil(128, False, unit=int(slave_id))
            client.write_coil(129, False, unit=int(slave_id))
            client.write_coil(130, False, unit=int(slave_id))
            client.write_coil(131, False, unit=int(slave_id))
            client.write_coil(132, False, unit=int(slave_id))
            
        if (totalFingers == 1):
            client.write_coil(128, True, unit=int(slave_id))
            client.write_coil(129, False, unit=int(slave_id))
            client.write_coil(130, False, unit=int(slave_id))
            client.write_coil(131, False, unit=int(slave_id))
            client.write_coil(132, False, unit=int(slave_id))
            
        if (totalFingers == 2):
            client.write_coil(128, True, unit=int(slave_id))
            client.write_coil(129, True, unit=int(slave_id))
            client.write_coil(130, False, unit=int(slave_id))
            client.write_coil(131, False, unit=int(slave_id))
            client.write_coil(132, False, unit=int(slave_id))
        
        if (totalFingers == 3):
            client.write_coil(128, True, unit=int(slave_id))
            client.write_coil(129, True, unit=int(slave_id))
            client.write_coil(130, True, unit=int(slave_id))
            client.write_coil(131, False, unit=int(slave_id))
            client.write_coil(132, False, unit=int(slave_id))
        
        if (totalFingers == 4):
            client.write_coil(128, True, unit=int(slave_id))
            client.write_coil(129, True, unit=int(slave_id))
            client.write_coil(130, True, unit=int(slave_id))
            client.write_coil(131, True, unit=int(slave_id))
            client.write_coil(132, False, unit=int(slave_id))
        
        
        if (totalFingers == 5):
            client.write_coil(128, True, unit=int(slave_id))
            client.write_coil(129, True, unit=int(slave_id))
            client.write_coil(130, True, unit=int(slave_id))
            client.write_coil(131, True, unit=int(slave_id))
            client.write_coil(132, True, unit=int(slave_id))
        
        h, w, c = overlayList[totalFingers - 1].shape
       
    cv2.putText(img, 'OPENCV OUTSEAL PLC', (400, 70), cv2.FONT_HERSHEY_PLAIN,
                 3, (255, 0, 0), 3)
    cv2.imshow("Img", img)
    cv2.waitKey(1)