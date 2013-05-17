'''
Created on Feb 28, 2013

@author: shroffk
'''
import requests
import logging
from urllib import urlencode
from collections import OrderedDict
from json import JSONDecoder
from _conf import _conf
from copy import copy

class UCClient(object):
    '''
    classdocs
    '''
    __jsonheader = {'content-type':'application/json', 'accept':'application/json'}
    __systemResource = '/system'
    __deviceResource = '/devices'
    __conversionResource = '/conversion'

    def __init__(self, url=None):
        '''
        create a client to the unitconversion service
        '''
        try:     
            requests_log = logging.getLogger("requests")
            requests_log.setLevel(logging.DEBUG)
            self.url = self.__getDefaultConfig('url', url)
            requests.get(self.url + self.__systemResource, verify=False, headers=self.__jsonheader).raise_for_status()
        except:
            raise
        
    def __getDefaultConfig(self, arg, value):
        '''
        If Value is None, this will try to find the value in one of the configuration files
        '''
        if value == None and _conf.has_option('DEFAULT', arg):
            return _conf.get('DEFAULT', arg)
        else:
            return value
    
    def listSystems(self):
        '''
        list all the systems available
        '''
        resp = requests.get(self.url + self.__systemResource, verify=False, headers=self.__jsonheader)
        resp.raise_for_status()
        return resp.json()
        
    def findDevices(self, **kwds):
        resp = requests.get(self.url + self.__deviceResource + '?' + urlencode(OrderedDict(kwds)),
                            verify=False,
                            headers=self.__jsonheader)
        resp.raise_for_status()        
        return DeviceDecoder().decode(resp.content)
    
    def getConversionData(self, **kwds):
        resp = requests.get(self.url + self.__conversionResource + '?' + urlencode(OrderedDict(kwds)),
                            verify=False,
                            headers=self.__jsonheader)
        resp.raise_for_status()
        jsonDevices = resp.json()
        for deviceName in jsonDevices:
            device = {}
            device['name'] = deviceName
            device['conversionInfo'] = jsonDevices[deviceName]
            d = DeviceDecoder().dictToDeviceDecoder(device)
            print d
        print device
        return DeviceDecoder().decode(resp.content)
    
class Device(object):
    '''
    private String name;
    private String system;
    private int installId;
    private int inventoryId;
    private String componentTypeName;
    private String typeDescription;
    private String vendor;
    private int serialNumber;
    private Map<String, Map<String, Conversion>> conversionInfo;
    '''
        
    def __init__(self,
                 name=None,
                 system=None,
                 installId=None,
                 inventoryId=None,
                 componentTypeName=None,
                 typeDescription=None,
                 vendor=None,
                 serialNumber=None,
                 conversionInfo=None):
        '''
        Create a device
        '''
        self.__name = name
        self.__system = system
        self.__installId = installId
        self.__inventoryId = inventoryId
        self.__componentTypeName = componentTypeName
        self.__typeDescription = typeDescription
        self.__vendor = vendor
        self.__serialNumber = serialNumber
        self.__conversionInfo = conversionInfo
    
    ## All the attributes are private and read only in an attempt to make the device object immutable
    name = property(lambda self:self.__name)
    system = property(lambda self:self.__system)
    installId = property(lambda self:self.__installId)
    inventoryId = property(lambda self:self.__inventoryId)
    componentTypeName = property(lambda self:self.__componentTypeName)
    typeDescription = property(lambda self:self.__typeDescription)
    vendor = property(lambda self:self.__vendor)
    serialNumber = property(lambda self:self.__serialNumber)
    conversionInfo = property(lambda self:self.__conversionInfo)
    
    def __cmp__(self, *arg, **kwargs):  
        if arg[0] == None:
            return 1 
        if self.name:
            return cmp((self.name), (arg[0].__name))
        if self.system:
            return cmp((self.system), (arg[0].__system))
        if self.installId:
            return cmp((self.install_id), (arg[0].__installId))
        if self.inventoryId:
            return cmp((self.inventoryId), (arg[0].__inventoryId))
        if self.componentTypeName:
            return cmp((self.componentTypeName), (arg[0].__componentTypeName))
        if self.typeDescription:
            return cmp((self.typeDescription), (arg[0].__typeDescription))
        if self.vendor:
            return cmp((self.vendor), (arg[0].__vendor))
        if self.serialNumber:
            return cmp((self.serialNumber), (arg[0].__serialNumber))
        if self.conversionInfo:
            return cmp((self.conversionInfo), (arg[0].__conversionInfo))
        else:
            raise Exception, 'Invalid Device'
   
class DeviceDecoder(JSONDecoder):
    
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToDeviceDecoder)
                         
    def dictToDeviceDecoder(self, d):
        print d
        if d:
            jsonConversionInfo = d.pop('conversionInfo', {})
            conversionInfo = {}
            for a in jsonConversionInfo:
                print 'a:', a
                conversions = {}
                for b in jsonConversionInfo[a]:
                    print 'b:', b
                    print jsonConversionInfo[a][b]
                    conversions[b] = ConversionDecoder().dictToConversion(jsonConversionInfo[a][b])
                conversionInfo[a] = copy(conversions) 
            return Device(name=d.pop('name', None),
                          system=d.pop('system', None),
                          installId=d.pop('installId', None),
                          inventoryId=d.pop('inventoryId', None),
                          componentTypeName=d.pop('componentTypeName', None),
                          typeDescription=d.pop('typeDescription', None),
                          vendor=d.pop('vendor', None),
                          serialNumber=d.pop('serialNumber', None),
                          conversionInfo=conversionInfo)
        else:
            return None
        
class MeasurementData(object):

    def __init__(self,
                 direction=[],
                 current=[],
                 currentError=[],
                 currentUnit=None,
                 field=[],
                 fieldError=[],
                 fieldUnit=None,
                 magneticLength=None,
                 averageLength=None,
                 runNumber=[],
                 serialNumber=None,
                 referenceDraw=None,
                 aliasName=None,
                 vendor=None,
                 integralTransferFunction=None,
                 referenceRadius=None,
                 description=None,
                 magneticRigidity=None,
                 magneticRigidityUnit=None,
                 conditionCurrent=None):
        self.direction = direction
        self.current = current
        self.currentError = currentError
        self.currentUnit = currentUnit
        self.field = field
        self.fieldError = fieldError
        self.fieldUnit = fieldUnit
        self.averageLength = averageLength
        self.runNumber = runNumber
        self.serialNumber = serialNumber
        self.referenceDraw = referenceDraw
        self.aliasName = aliasName
        self.vendor = vendor
        self.integralTransferFunction = integralTransferFunction
        self.referenceRadius = referenceRadius
        self.description = description
        self.magneticRigidity = magneticRigidity
        self.magneticRigidityUnit = magneticRigidityUnit
        self.conditionCurrent = conditionCurrent

class MeasurementDataDecoder(JSONDecoder):
    
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToMeasurementData)
        
    def dictToMeasurementData(self, d):
        if d:
            return MeasurementData(
                                      direction=d.pop('direction', None),
                                      current=d.pop('current', None),
                                      currentError=d.pop('currentError', None),
                                      currentUnit=d.pop('currentUnit', None),
                                      field=d.pop('field', None),
                                      fieldError=d.pop('fieldError', None),
                                      fieldUnit=d.pop('fieldUnit', None),
                                      averageLength=d.pop('averageLength', None),
                                      runNumber=d.pop('runNumber', None),
                                      serialNumber=d.pop('serialNumber', None),
                                      referenceDraw=d.pop('referenceDraw', None),
                                      aliasName=d.pop('aliasName', None),
                                      vendor=d.pop('vendor', None),
                                      integralTransferFunction=d.pop('integralTransferFunction', None),
                                      referenceRadius=d.pop('referenceRadius', None),
                                      description=d.pop('description', None),
                                      magneticRigidity=d.pop('magneticRigidity', None),
                                      magneticRigidityUnit=d.pop('magneticRigidityUnit', None),
                                      conditionCurrent=d.pop('conditionCurrent', None)
                                      )
        else:
            return None
        
class ConversionAlgorithm():
    '''
    private int algorithmId;
    private String function;
    private int auxInfo;
    private String initialUnit;
    private String resultUnit;
    '''
    
    def __init__(self,
                 algorithmId=None,
                 function=None,
                 auxInfo=None,
                 initialUnit=None,
                 resultUnit=None
                 ):
        self.algorithmId = algorithmId
        self.function = function
        self.auxInfo = auxInfo
        self.initialUnit = initialUnit
        self.resultUnit = resultUnit
        
class ConversionAlgorithmDecoder(JSONDecoder):
    '''
    '''
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToConversionAlgorithm)
    
    def dictToConversionAlgorithm(self, d):
        if d:
            return ConversionAlgorithm(
                                   algorithmId=d.pop('algorithmId', None),
                                   function=d.pop('function', None),
                                   auxInfo=d.pop('auxInfo', None),
                                   initialUnit=d.pop('initialUnit', None),
                                   resultUnit=d.pop('resultUnit', None)
                                   )
        else:
            return None
        
class ConversionResult():
    
    def __init__(self, message=None, value=None, unit=None):
        '''
        private String message;
        private double value;
        private String unit;
        '''
        self.message = message
        self.value = value
        self.unit = unit

class ConversionResultDecoder(JSONDecoder):    
    
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToConversionResult)
    
    def dictToConversionResult(self, d):
        if d:
            return ConversionResult(
                                   message=d.pop('message', None),
                                   value=d.pop('value', None),
                                   unit=d.pop('unit', None)
                                   )
        else:
            return None
        
class Conversion():
    '''
    private MeasurementData measurementData;
    // These are design values    
    private Double designLength;
    private Double defaultEnergy;
    private Double realEnergy;
    private Map<String, ConversionAlgorithm> algorithms = Collections
        .emptyMap();
    private String description;
    private ConversionResult conversionResult;
    '''
    
    def __init__(self,
                 measurementData=None,
                 designLength=None,
                 defaultEnergy=None,
                 realEnergy=None,
                 algorithms=None,
                 description=None,
                 conversionResult=None
                 ):
        self.measurementData = measurementData
        self.designLength = designLength
        self.defaultEnergy = defaultEnergy
        self.realEnergy = realEnergy
        self.algorithms = algorithms
        self.description = description
        self.conversionResult = conversionResult
        
class ConversionDecoder(JSONDecoder):
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToConversion)
    
    def dictToConversion(self, d):
        if d:
            print d.get('conversionResult')
            return Conversion(
                                   measurementData=MeasurementDataDecoder().dictToMeasurementData(d.pop('measurementData', None)),
                                   designLength=d.pop('designLength', None),
                                   defaultEnergy=d.pop('defaultEnergy', None),
                                   realEnergy=d.pop('realEnergy', None),
                                   algorithms=ConversionAlgorithmDecoder().dictToConversionAlgorithm(d.pop('algorithms', None)),
                                   description=d.pop('description', None),
                                   conversionResult=ConversionResultDecoder().dictToConversionResult(d.pop('conversionResult', None))
                                   )
        else:
            return None
