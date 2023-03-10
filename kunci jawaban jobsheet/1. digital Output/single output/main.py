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


#---------------DEKLARASI VARIABEL----------------------------#
button1_status = 0






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
    
    
    #PROGRAM UNTUK MENERIMA DATA DARI QML
    @pyqtSlot(int)
    def button1(self, message):
        global button1_status
        print(message)
        button1_status = message
#----------------------------------------------------------------#

#------MEMPROSES DATA MODBUS ------------------------------------#
def modbus_data_process(num):
    while True:
        if (button1_status == 1):
            client.write_coil(128, True, unit=int(slave_id))
        else:
            client.write_coil(128, False, unit=int(slave_id))


        '''
        note : jika button bernilai 1 maka python mengirim nilai true ke alamat modbus 128 alias
        B1 untuk menyalakan lampu, begitupun sebaliknya
        '''


########## memanggil class table di mainloop######################
#----------------------------------------------------------------#    
if __name__ == "__main__":
    
    t1 = threading.Thread(target=modbus_data_process, args=(10,))
    t1.start()
    
    main = table()
    
    
#----------------------------------------------------------------#