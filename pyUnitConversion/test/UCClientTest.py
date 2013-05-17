'''
Created on Feb 28, 2013

@author: shroffk
'''
import unittest
from pyUnitConversion import UCClient, Device, MeasurementData
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
        
        [{
        "installId": 172, 
        "vendor": "Danfysik, Denmark", 
        "name": "SH1G2C30A", 
        "serialNumber": "79", 
        "system": "Storage Ring", 
        "componentType": "Sext A", 
        "inventoryId": 599, 
        "typeDescription": "68mm, SHORT SEXTUPOLE"
        }]
        '''
        deviceSH1G2C30A = Device(name='SH1G2C30A',
                                 installId=172,
                                 vendor='Danfysik, Denmark',
                                 serialNumber=79,
                                 system='Storage Ring',
                                 componentTypeName='Sext A',
                                 inventoryId=599,
                                 typeDescription='68mm, SHORT SEXTUPOLE')        
        client = UCClient(url='http://localhost:8000/magnets')
        devices = client.findDevices(name='SH1G2C30A')
        self.assertEqual(len(devices), 1, 'expected 1 match for device with name SH1G2C30A found ' + str(len(devices)))
        self.assertIn(deviceSH1G2C30A, devices, 'Failed to find Device')

        '''
        Search for devices using system
        '''
        devices = client.findDevices(system='BST')
        self.assertEqual(len(devices), 20, 'expected 20 match for device with name SH1G2C30A found ' + str(len(devices)))
        for device in devices:
            self.assertEqual(device.system, 'BST', 'Device system does not match search criteria')
            
    def testFindDevicesByName(self):
        '''[
        {"installId": 172, 
        "vendor": "Danfysik, Denmark", 
        "name": "SH1G2C30A", 
        "serialNumber": "79", 
        "system": "Storage Ring", 
        "componentType": "Sext A", 
        "inventoryId": 599, 
        "typeDescription": "68mm, SHORT SEXTUPOLE"}, 
        {"installId": 176, 
        "vendor": "Danfysik, Denmark", 
        "name": "SH3G2C30A", 
        "serialNumber": "83", 
        "system": "Storage Ring", 
        "componentType": "Sext A", 
        "inventoryId": 603, 
        "typeDescription": "68mm, SHORT SEXTUPOLE"}, 
        {"installId": 178, 
        "vendor": "Danfysik, Denmark", 
        "name": "SH4G2C30A", 
        "serialNumber": "85", 
        "system": "Storage Ring", 
        "componentType": "Sext A", 
        "inventoryId": 605, 
        "typeDescription": "68mm, SHORT SEXTUPOLE"}
        ]'''
        
        client = UCClient(url='http://localhost:8000/magnets')
        
        deviceSH1G2C30A = Device(name='SH1G2C30A',
                                 installId=172,
                                 vendor='Danfysik, Denmark',
                                 serialNumber=79,
                                 system='Storage Ring',
                                 componentTypeName='Sext A',
                                 inventoryId=599,
                                 typeDescription='68mm, SHORT SEXTUPOLE')        
        deviceSH3G2C30A = Device(name='SH3G2C30A',
                                 installId=176,
                                 vendor='Danfysik, Denmark',
                                 serialNumber=83,
                                 system='Storage Ring',
                                 componentTypeName='Sext A',
                                 inventoryId=603,
                                 typeDescription='68mm, SHORT SEXTUPOLE')        
        deviceSH4G2C30A = Device(name='SH4G2C30A',
                                 installId=178,
                                 vendor='Danfysik, Denmark',
                                 serialNumber=85,
                                 system='Storage Ring',
                                 componentTypeName='Sext A',
                                 inventoryId=605,
                                 typeDescription='68mm, SHORT SEXTUPOLE')        
        expectedDevices = [deviceSH1G2C30A, deviceSH3G2C30A, deviceSH4G2C30A]
        devices = client.findDevices(name='SH%G2C30A')
        self.assertEqual(len(devices), 3, 'expected 3 match for device with name SH1G2C30A found ' + str(len(devices)))
        self.assertListEqual(expectedDevices, devices, 'Failed to query for devices by name pattern')

class TestConversion(unittest.TestCase):
    
    def testConversion(self):
        '''
        {"LN-SO5": 
            {"municonv": 
                {"standard": 
                    {"measurementData": 
                        {"direction": ["na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na", "na"], 
                        "currentUnit": "A", 
                        "magneticLength": ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""], 
                        "serialNumber": 53, 
                        "current": [0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0], 
                        "field": [-0.000132, -0.001228, -0.002381, -0.003523, -0.004655, -0.005798, -0.00693, -0.00806, -0.009285, -0.010423, -0.011546, -0.012694, -0.013817, -0.014941, -0.016098, -0.017217, -0.018358, -0.019476, -0.020613, -0.021764, -0.022898], 
                        "fieldError": ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""], 
                        "currentError": ["", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", ""], 
                        "fieldUnit": "T"}, 
                    "algorithms": 
                        {"i2b": 
                            {"function": "0.000228046038239*input + 0.000113748", 
                            "initialUnit": "A", 
                            "algorithmId": 0, 
                            "resultUnit": "T", 
                            "auxInfo": 0}
                        }, 
                    "description": "individual solenoid measurement data"}
                },
                "municonvChain": 
                    {"standard": 
                        {"algorithms": 
                            {"i2b": 
                                {"function": "-0.000423222575196*input -0.00021717376728", 
                                "initialUnit": "A", 
                                "algorithmId": 0, 
                                "resultUnit": "T", 
                                "auxInfo": 0}
                            }, 
                        "description": "average solenoid measurement data"}
                    }
                }
            }
        '''
        client = UCClient(url='http://localhost:8000/magnets')
        converionData = client.getConversionData(name='LN-SO5')
        print converionData
        
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
                        installId='172',
                        componentTypeName='Sext A',
                        typeDescription='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        with self.assertRaises(AttributeError) :
            device.name = 'name'
        with self.assertRaises(AttributeError) :
            device.system = 'system'
        with self.assertRaises(AttributeError) :
            device.installId = 'installId'
        with self.assertRaises(AttributeError) :
            device.componentTypeName = 'componentTypeName'
        with self.assertRaises(AttributeError) :
            device.typeDescription = 'typeDescription'
        with self.assertRaises(AttributeError) :
            device.vendor = 'vendor'
            
    def testDeviceEquality(self):
        '''
        2 Devices are equal if all their attributes are equal
        '''
        device1 = Device(name='SH1G2C30A',
                        system='Storage Ring',
                        installId='172',
                        componentTypeName='Sext A',
                        typeDescription='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        device2 = Device(name='SH1G2C30A',
                        system='Storage Ring',
                        installId='172',
                        componentTypeName='Sext A',
                        typeDescription='68mm, SHORT SEXTUPOLE',
                        vendor='Danfysik, Denmark')
        self.assertEqual(device1, device2, 'Device equality failed')
        
        
class TestConversionData(unittest.TestCase):
    
    def testCreateConversionData(self):
        '''
        '''

class TestMeasurementData(unittest.TestCase):
    
    def testCreateMeasurementData(self):
        '''
        '''
        current = [4.99619, 9.99787, 14.9953,
        19.99719, 29.99279, 39.99175, 49.99177, 59.99112, 69.98786,
        79.98677, 89.9856, 99.98575, 109.98234, 119.98134, 129.98055,
        139.97986, 149.97671, 159.97629, 164.97395, 169.97598,
        174.97374, 179.97451, 184.97307, 184.97331, 179.97483,
        174.97416, 169.97644, 164.97447, 159.97667, 149.97713,
        139.98046, 129.9809, 119.982, 109.98274, 99.98262, 89.98605,
        79.98715, 69.98771, 59.98827, 49.99177, 39.9919, 29.99267,
        19.99405, 14.99525, 9.99781, 4.99612]
        field = [0.006010210477162501,
        0.01037091727400225, 0.014952996384287503,
        0.019652527931825252, 0.02922136869282225,
        0.038904351322243756, 0.048631397704142765, 0.058366488481056,
        0.06809398675870351, 0.07781522917796252, 0.08751049433027999,
        0.097182549513, 0.10681568997290102, 0.1163986521945975,
        0.12591185008119374, 0.13531951052102, 0.14454029422523604,
        0.15345847200230403, 0.1577250523778825, 0.16182213025381198,
        0.16570048172748, 0.16937280553178302, 0.17283865625925676,
        0.17283998110621726, 0.16996242076436174, 0.16685922153058202,
        0.163474594704162, 0.15974051058658875, 0.15565475228153028,
        0.14678675275035977, 0.1374723356113695, 0.1279484244114475,
        0.11832390575145, 0.10864271304540851, 0.09892675354149001,
        0.08919255076144877, 0.079438526136865, 0.0696759812402745,
        0.05989820061200851, 0.05012107621269351, 0.04032921268034751,
        0.030530575789565254, 0.020726159132717505, 0.0158212603472,
        0.01091867053736725, 0.006011142231052001]
        direction = ["Up", "Up", "Up", "Up", "Up",
        "Up", "Up", "Up", "Up", "Up", "Up", "Up", "Up", "Up", "Up",
        "Up", "Up", "Up", "Up", "Up", "Up", "Up", "Up", "Dn", "Dn",
        "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn",
        "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn", "Dn",
        "Dn"]
        magneticLength = []
        measurementData = MeasurementData(
                                          current=current,
                                          currentUnit="A",
                                          field=field,
                                          fieldUnit="T-m",
                                          direction=direction,
                                          magneticLength=magneticLength
                                          )
        


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()
