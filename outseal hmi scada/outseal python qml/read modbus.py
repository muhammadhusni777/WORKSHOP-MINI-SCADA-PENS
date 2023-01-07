import pymodbus
from pymodbus.pdu import ModbusRequest
from pymodbus.client.sync import ModbusSerialClient as ModbusClient
from pymodbus.register_read_message import ReadInputRegistersResponse
from pymodbus.transaction import ModbusRtuFramer
import serial
import time

client = ModbusClient(method='rtu', port="COM5", baudrate=57600, parity='N', timeout=4,strict=False)
connection = client.connect()

time_on = 0
time_on_prev = 0

while True:
    
    #print(connection)

    #request = client.read_holding_registers(1,1,unit=1)
    #request = client.read_holding_registers(1, 10, unit=1)
    
    
    #READ coil start from 0 to 127
    request = client.read_coils(address=0,count=0x6,unit=0x1)
    
    request_register = client.read_holding_registers(0, 10, unit=1)
    try:
        print(request.bits[0], request_register.registers[1])
        
        
        
    except AttributeError:
        pass
    # write registers
    #client.write_register(5,212,unit=1)# address = 1, value to set = 425, slave ID = 1
    
    
    time_on = time.time() - time_on_prev
    
    #write coil start from 128
    if (time_on < 1):
        client.write_coil(128, True, unit=1)
        
    else:
        client.write_coil(128, False, unit=1)
        
    if (time_on > 2):
        time_on_prev = time.time()
        