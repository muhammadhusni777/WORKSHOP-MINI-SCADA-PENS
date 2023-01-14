######  PROGRAM MEMANGGIL WINDOWS PYQT5 ##########################

####### memanggil library PyQt5 untuk Graphical User Interface ##################################
#----------------------------------------------------------------#
from PyQt5.QtCore import * 
from PyQt5.QtGui import * 
from PyQt5.QtQml import * 
from PyQt5.QtWidgets import *
from PyQt5.QtQuick import *  
import sys
import threading
#----------------------------------------------------------------#
import pymodbus
from pymodbus.pdu import ModbusRequest
from pymodbus.client.sync import ModbusSerialClient as ModbusClient
from pymodbus.register_read_message import ReadInputRegistersResponse
from pymodbus.transaction import ModbusRtuFramer
import serial
import time
##########################################
slider = ""




#---------------SCAN AVAILABLE MODBUS PORT -------------------#

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



########## mengisi class table dengan instruksi pyqt5#############
#----------------------------------------------------------------#
class table(QObject):    
    def __init__(self, parent = None):
        super().__init__(parent)
        self.app = QApplication(sys.argv)
        self.engine = QQmlApplicationEngine(self)
        self.engine.rootContext().setContextProperty("backend", self)    
        self.engine.load(QUrl("main.qml"))
        sys.exit(self.app.exec_())
        
    @pyqtSlot(int)
    def slider(self, message):
        #print(message)
        global slider
        slider = message
#----------------------------------------------------------------#

def modbus_data_process(num):
    global request
    global request_coil
    global analog
    
    
    while True:
        request = client.read_holding_registers(address=0,count=0x7,unit=int(slave_id))
        request_coil = client.read_coils(address=0,count=15,unit=int(slave_id))
        
        try:
            client.write_register(0, slider*10 ,unit=int(slave_id))
            
        except:
            pass


########## memanggil class table di mainloop######################
#----------------------------------------------------------------#    
if __name__ == "__main__":
    
    t1 = threading.Thread(target=modbus_data_process, args=(10,))
    t1.start()
    
    main = table()
    
    
#----------------------------------------------------------------#