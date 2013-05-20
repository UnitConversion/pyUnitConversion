'''
Created on Feb 28, 2013

@author: shroffk
'''
import unittest
from pyUnitConversion import *
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
                        {"direction": ['na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na'], 
                        "currentUnit": "A", 
                        "magneticLength": ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], 
                        "serialNumber": 53, 
                        "current": [0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0], 
                        "field": [-0.000132, -0.001228, -0.002381, -0.003523, -0.004655, -0.005798, -0.00693, -0.00806, -0.009285, -0.010423, -0.011546, -0.012694, -0.013817, -0.014941, -0.016098, -0.017217, -0.018358, -0.019476, -0.020613, -0.021764, -0.022898], 
                        "fieldError": ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], 
                        "currentError": ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''], 
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
        devices = client.getConversionData(name='LN-SO5')
        self.assertEqual(len(devices), 1, 'getConversionData returned invalid number of devices')
        self.assertEqual(devices[0].name, 'LN-SO5', 'getconversionData returned incorrect device information')
        conversionInfo = devices[0].conversionInfo
        '''
        Conversion Info should have 2 Conversion entries 
        1 for municonv
        2 for municonvChain
        '''
        self.assertEqual(len(conversionInfo), 2, 'ConversionInfo does not have the correct number of Conversions')
        conversionMuniconv = conversionInfo['municonv']
        expectedConversionMuniconv = {'standard':Conversion(measurementData=MeasurementData(direction=['na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na'],
                                                                                currentUnit="A",
                                                                                magneticLength=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                                                serialNumber=53,
                                                                                current=[0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0],
                                                                                field=[-0.000132, -0.001228, -0.002381, -0.003523, -0.004655, -0.005798, -0.00693, -0.00806, -0.009285, -0.010423, -0.011546, -0.012694, -0.013817, -0.014941, -0.016098, -0.017217, -0.018358, -0.019476, -0.020613, -0.021764, -0.022898],
                                                                                fieldError=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                                                currentError=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                                                fieldUnit="T"),
                                                algorithms={'i2b':ConversionAlgorithm(function="0.000228046038239*input + 0.000113748",
                                                                               initialUnit="A",
                                                                               algorithmId=0,
                                                                               resultUnit="T",
                                                                               auxInfo=0)},
                                                description='individual solenoid measurement data')}
        self.assertEqual(conversionMuniconv, expectedConversionMuniconv, 'Converion for municonv does not match expected value')
        conversionMuniconvChain = conversionInfo['municonvChain']
        
        
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
        
class TestConversionAlgorithm(unittest.TestCase):
    
    def testConversionAlgorithmEqaulity(self):
        '''
        Test the equality for Conversion Algorithm, two instances should be equal if they have the same values for all fields.
        The equal should be true even if the two objects are different objects
        '''
        expectedConversionAlgorithm = ConversionAlgorithm(function="0.000228046038239*input + 0.000113748", initialUnit="A", algorithmId=0, resultUnit="T", auxInfo=0)
        conversionAlgorithm = ConversionAlgorithmDecoder().dictToConversionAlgorithm({'function':"0.000228046038239*input + 0.000113748", 'initialUnit':"A", 'algorithmId':0, 'resultUnit':"T", 'auxInfo':0})
        self.assertEqual(conversionAlgorithm, expectedConversionAlgorithm, 'Failed to parse the conversion algorithm correctly')

class TestConversionData(unittest.TestCase):
    
    def testCreateConversionData(self):
        '''
        '''
        
    def testConversionDataEquality(self):
        '''
        '''
        

class TestMeasurementData(unittest.TestCase):
    
    def testCreateMeasurementData(self):
        '''
        '''
        
    def testMeasurementDataEquality(self):
        '''
        '''
        expectedMeasurementData = MeasurementData(
                                                direction=['na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na', 'na'],
                                                currentUnit="A",
                                                magneticLength=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                serialNumber=53,
                                                current=[0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0],
                                                field=[-0.000132, -0.001228, -0.002381, -0.003523, -0.004655, -0.005798, -0.00693, -0.00806, -0.009285, -0.010423, -0.011546, -0.012694, -0.013817, -0.014941, -0.016098, -0.017217, -0.018358, -0.019476, -0.020613, -0.021764, -0.022898],
                                                fieldError=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                currentError=['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''],
                                                fieldUnit="T")
        measurementData = MeasurementDataDecoder().dictToMeasurementData({u'direction': [u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na', u'na'], u'currentUnit': u'A', u'magneticLength': [u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u''], u'serialNumber': 53, u'current': [0.0, 5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0, 55.0, 60.0, 65.0, 70.0, 75.0, 80.0, 85.0, 90.0, 95.0, 100.0], u'field': [-0.000132, -0.001228, -0.002381, -0.003523, -0.004655, -0.005798, -0.00693, -0.00806, -0.009285, -0.010423, -0.011546, -0.012694, -0.013817, -0.014941, -0.016098, -0.017217, -0.018358, -0.019476, -0.020613, -0.021764, -0.022898], u'fieldError': [u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u''], u'currentError': [u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u'', u''], u'fieldUnit': u'T'})
        if expectedMeasurementData == measurementData:
            print 'equal'
        self.assertEqual(measurementData, expectedMeasurementData, 'failed to parse MeasurementData')      


if __name__ == "__main__":
    #import sys;sys.argv = ['', 'Test.testName']
    unittest.main()
