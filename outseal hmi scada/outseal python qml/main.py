######  PROGRAM MEMANGGIL WINDOWS PYQT5 ##########################

####### memanggil library PyQt5 ##################################
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


analog = 0

button1_status = "off"
button2_status = "off"
button3_status = "off"
button4_status = "off"

indicator1_status = "off"
indicator2_status = "off"
indicator3_status = "off"
indicator4_status = "off"

slider = ""
##################################################
holding_register = ""
data_send = ""
request = ""
request_coil = ""




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
        
        
    @pyqtSlot(result=int)
    def get_tiempo(self):
        date_time = QDateTime.currentDateTime()
        unixTIME = date_time.toSecsSinceEpoch()
        #unixTIMEx = date_time.currentMSecsSinceEpoch()
        return unixTIME
    
    
    
#---------------------------------#####################TOMBOL QML KE PYTHON###################
    @pyqtSlot(int)
    def button1(self, message):
        global button1_status
        #print(message)
        button1_status = message
        

        
    @pyqtSlot(int)
    def button2(self, message):
        global button2_status
        #print(message)
        button2_status = message
        
        
        
    @pyqtSlot(int)
    def button3(self, message):
        #print(message)
        global button3_status
        button3_status = message
        
    @pyqtSlot(int)
    def button4(self, message):
        #print(message)
        global button4_status
        button4_status = message
        
    
    @pyqtSlot(int)
    def slider(self, message):
        global slider
        slider = message


#---------------------------------#####################PYTHON KE QML###################
    @pyqtSlot(result=str)
    def get_holding_register(self):  return holding_register
    
    @pyqtSlot(result=int)
    def sensor(self):  return analog
    
    @pyqtSlot(result=str)
    def indicator1_status(self):  return indicator1_status
    
    @pyqtSlot(result=str)
    def indicator2_status(self):  return indicator2_status
    
    @pyqtSlot(result=str)
    def indicator3_status(self):  return indicator3_status
    
    @pyqtSlot(result=str)
    def indicator4_status(self):  return indicator4_status

def modbus_data_process(num):
    global holding_register
    global analog
    global request
    global indicator1_status
    global indicator2_status
    global indicator3_status
    global indicator4_status
    global request_coil
    while True:
        
        request = client.read_holding_registers(address=0,count=0x7,unit=int(slave_id))
        request_coil = client.read_coils(address=0,count=15,unit=int(slave_id))
        
        
        
        
        try:
            #Baca Potensiometer
            analog = request.registers[1]
            
            #Kirim nilai PWM (0-1000)
            client.write_register(0, slider*10 ,unit=int(slave_id))
            
            #untuk menampilkan holding register
            #print(request.registers)
            
            
            
            #membaca nilai dari button outseal
            if (request_coil.bits[8] == 0):
                indicator1_status = "off"
            else:
                indicator1_status = "on"
           
            if (request_coil.bits[9] == 0):
                indicator2_status = "off"
            else:
                indicator2_status = "on"
                
            if (request_coil.bits[10] == 0):
                indicator3_status = "off"
            else:
                indicator3_status = "on"
            
            if (request_coil.bits[11] == 0):
                indicator4_status = "off"
            else:
                indicator4_status = "on"
            
        except AttributeError:
            pass
        
        #mengirim nilai led yang akan menyala
        if (button1_status == 1):
            client.write_coil(128, True, unit=int(slave_id))
        else:
            client.write_coil(128, False, unit=int(slave_id))
        
        if (button2_status == 1):
            client.write_coil(129, True, unit=int(slave_id))
        else:
            client.write_coil(129, False, unit=int(slave_id))
        
        if (button3_status == 1):
            client.write_coil(130, True, unit=int(slave_id))
        else:
            client.write_coil(130, False, unit=int(slave_id))
            
        if (button4_status == 1):
            client.write_coil(131, True, unit=int(slave_id))
        else:
            client.write_coil(131, False, unit=int(slave_id))
       
       
        
        


########## memanggil class table di mainloop######################
#----------------------------------------------------------------#    
if __name__ == "__main__":
    t1 = threading.Thread(target=modbus_data_process, args=(10,))
    t1.start()
    
    main = table()
    
    
#----------------------------------------------------------------#