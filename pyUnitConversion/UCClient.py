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

class UCClient(object):
    '''
    classdocs
    '''
    __jsonheader = {'content-type':'application/json', 'accept':'application/json'}
    __systemResource = '/system'
    __deviceResource = '/devices'

    def __init__(self, url=None):
        '''
        create a client to the unitconversion service
        '''
        try:     
            requests_log = logging.getLogger("requests")
            requests_log.setLevel(logging.DEBUG)
            self.__url = self.__getDefaultConfig('url', url)
            requests.get(self.__url + self.__systemResource, verify=False, headers=self.__jsonheader).raise_for_status()
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
        resp = requests.get(self.__url + self.__systemResource, verify=False, headers=self.__jsonheader)
        resp.raise_for_status()
        return resp.json()
        
    def findDevices(self, **kwds):
        resp = requests.get(self.__url + self.__deviceResource +'?'+ urlencode(OrderedDict(kwds)))
        resp.raise_for_status()        
        return DeviceDecoder().decode(resp.content)
    
class Device(object):
    '''
    
    '''
        
    def __init__(self, 
                 name=None,
                 system=None,
                 install_id=None,
                 cmpnt_type_name=None,
                 type_description=None,
                 vendor=None):
        '''
        Create a device
        '''
        self.__name=name
        self.__system=system
        self.__install_id=install_id
        self.__cmpnt_type_name=cmpnt_type_name
        self.__type_description=type_description
        self.__vendor=vendor
    
    ## All the attributes are private and read only in an attempt to make the device object immutable
    name = property(lambda self:self.__name)
    system = property(lambda self:self.__system)
    install_id = property(lambda self:self.__install_id)
    cmpnt_type_name = property(lambda self:self.__cmpnt_type_name)
    type_description = property(lambda self:self.__type_description)
    vendor = property(lambda self:self.__vendor)
    
    def __cmp__(self, *arg, **kwargs):  
        if arg[0] == None:
            return 1 
        if self.__name:
            return cmp((self.__name),(arg[0].__name))
        if self.__system:
            return cmp((self.__system),(arg[0].__system))
        if self.__install_id:
            return cmp((self.__install_id),(arg[0].__install_id))
        if self.__cmpnt_type_name:
            return cmp((self.__cmpnt_type_name),(arg[0].__cmpnt_type_name))
        if self.__type_description:
            return cmp((self.__type_description),(arg[0].__type_description))
        if self.__vendor:
            return cmp((self.__vendor),(arg[0].__vendor))
        else:
            raise Exception, 'Invalid Device'
   
class DeviceDecoder(JSONDecoder):
    
    def __init__(self):
        JSONDecoder.__init__(self, object_hook=self.dictToLogbook)
        
    def dictToLogbook(self, d):
        if d:
            return Device(name=d.pop('name'),
                          system=d.pop('system'),
                          install_id=d.pop('install_id'),
                          cmpnt_type_name=d.pop('cmpnt_type_name'),
                          type_description=d.pop('type_description'),
                          vendor=d.pop('vendor'))
        else:
            return None