# -*- coding: utf-8 -*-
"""
Internal module

Used to read the pyUnitConversion.conf file

example file
cat ~/pyUnitConversion.conf
[DEFAULT]
BaseURL=http://localhost:8000/magnets
"""

def __loadConfig():
    import os.path
    import ConfigParser
    dflt={'url':'http://localhost:8000/magnets'}
    cf=ConfigParser.SafeConfigParser(defaults=dflt)
#    print os.path.normpath(os.path.expanduser('~/channelfinderapi.conf'))
    cf.read([
        '/etc/pyUnitConversion.conf',
        os.path.expanduser('~/pyUnitConversion.conf'),
        'pyUnitConversion.conf'
    ])
    return cf

_conf=__loadConfig()