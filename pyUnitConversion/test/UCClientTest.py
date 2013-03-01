'''
Created on Feb 28, 2013

@author: shroffk
'''
import unittest
from pyUnitConversion import UCClient, Device
from exceptions import AttributeError

class TestClientCreation(unittest.TestCase):


    def setUp(self):
        pass


    def tearDown(self):
        pass


    def testClientCreation(self):
        client = UCClient(url='http://localhost:8000/magnets')
        self.assertIsNotNone(client, 'Failed to create simple client')
        pass

class TestAPI(unittest.TestCase):
    
    def testSystemQuery(self):
        client = UCClient(url='http://localhost:8000/magnets')
        systems = client.listSystems();
        self.assertEqual(systems, ['Linac', 'LBT', 'Booster', 'BST', 'Storage Ring'], 'Failed to retieve list of systems')
        
    def testFindDevices(self):
        '''
        Search for devices using the device name
        '''
        client = UCClient(url='http://localhost:8000/magnets')
        devices = client.findDevices(name='SH1G2C30A')
        self.assertEqual(len(devices), 1, 'expected 1 match for device with name SH1G2C30A found ' + str(len(devices)))
        self.assertIn(Device(type_description='68mm, SHORT SEXTUPOLE',
                                            vendor='Danfysik, Denmark',
                                            name='SH1G2C30A',
                                            install_id='172',
                                            system='Storage Ring',
                                            cmpnt_type_name='Sext A'),
                      devices,
                      'Failed to find Device')
        devices = client.findDevices(name='SH%G2C30A')
        self.assertEqual(len(devices), 3, 'expected 3 match for device with name SH1G2C30A found ' + str(len(devices)))
        '''
        Search for devices using system
        '''
        devices = client.findDevices(system='BST')
        self.assertEqual(len(devices), 20, 'expected 20 match for device with name SH1G2C30A found ' + str(len(devices)))
        for device in devices:
            self.assertEqual(device.system, 'BST', 'Device system does not match search criteria')
        
class TestDevice(unittest.TestCase):
    '''
    Example list of Devices
    [{"type_description": "68mm, SHORT SEXTUPOLE", 
    "vendor": "Danfysik, Denmark", 
    "name": "SH1G2C30A", 
    "install_id": 172, 
    "system": "Storage Ring", 
    "cmpnt_type_name": "Sext A"}, 
    {"type_description": "66mm, DBL COIL, SHORT QUAD", 
    "vendor": "Tesla, England", 
    "name": "QH1G2C30A", 
    "install_id": 173, 
    "system": "Storage Ring", 
    "cmpnt_type_name": "Quad D"}]
    '''
    def testCreateImmutableDevice(self):
        '''
        ensure that the device object cannot be modified
        '''
        device = Device(name='SH1G2C30A',
                        system='Storage Ring',
                        install_id='172',
                        cmpnt_type_name='Sext A',
                        type_description='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        with self.assertRaises(AttributeError) :
            device.name = 'new'
        with self.assertRaises(AttributeError) :
            device.system = 'new'
        with self.assertRaises(AttributeError) :
            device.install_id = 'new'
        with self.assertRaises(AttributeError) :
            device.cmpnt_type_name = 'new'
        with self.assertRaises(AttributeError) :
            device.type_description = 'new'
        with self.assertRaises(AttributeError) :
            device.vendor = 'new'
            
    def testDeviceEquality(self):
        '''
        2 Devices are equal if all their attributes are equal
        '''
        device1 = Device(name='SH1G2C30A',
                        system='Storage Ring',
                        install_id='172',
                        cmpnt_type_name='Sext A',
                        type_description='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        device2 = Device(name='SH1G2C30A',
                        system='Storage Ring',
                        install_id='172',
                        cmpnt_type_name='Sext A',
                        type_description='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        self.assertEqual(device1, device2, 'Device equality failed')
        
        
        

if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()
