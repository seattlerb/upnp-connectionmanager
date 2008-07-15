require 'rubygems'
require 'UPnP/service'

class UPnP::Service::ConnectionManager < UPnP::Service

  VERSION = '1.0'

  add_action 'GetProtocolInfo',
    [OUT, 'Source', 'SourceProtocolInfo'],
    [OUT, 'Sink',   'SinkProtocolInfo']

  add_action 'PrepareForConnection',
    [IN, 'RemoteProtocolInfo',    'A_ARG_TYPE_ProtocolInfo'],
    [IN, 'PeerConnectionManager', 'A_ARG_TYPE_ConnectionManager'],
    [IN, 'PeerConnectionID',      'A_ARG_TYPE_ConnectionID'],
    [IN, 'Direction',             'A_ARG_TYPE_Direction'],

    [OUT, 'ConnectionID',  'A_ARG_TYPE_ConnectionID'],
    [OUT, 'AVTransportID', 'A_ARG_TYPE_AVTransportID'],
    [OUT, 'RcsID',         'A_ARG_TYPE_RcsID']

  add_action 'ConnectionComplete',
    [IN, 'ConnectionID', 'A_ARG_TYPE_ConnectionID']

  add_action 'GetCurrentConnectionIDs',
    [OUT, 'ConnectionIDs', 'CurrentConnectionIDs']

  add_action 'GetCurrentConnectionInfo',
    [IN, 'ConnectionID', 'A_ARG_TYPE_ConnectionID'],

    [OUT, 'RcsID',                 'A_ARG_TYPE_RcsID'],
    [OUT, 'AVTransportID',         'A_ARG_TYPE_AVTransportID'],
    [OUT, 'ProtocolInfo',          'A_ARG_TYPE_ProtocolInfo'],
    [OUT, 'PeerConnectionManager', 'A_ARG_TYPE_ConnectionManager'],
    [OUT, 'PeerConnectionID',      'A_ARG_TYPE_ConnectionID'],
    [OUT, 'Direction',             'A_ARG_TYPE_Direction'],
    [OUT, 'Status',                'A_ARG_TYPE_ConnectionStatus']

  add_variable 'SourceProtocolInfo',           'string', nil, nil, true
  add_variable 'SinkProtocolInfo',             'string', nil, nil, true
  add_variable 'CurrentConnectionIDs',         'string', nil, nil, true
  add_variable 'A_ARG_TYPE_ConnectionStatus',  'string',
                %w[OK ContentFormatMismatch InsufficientBandwidth
                   UnreliableChannel Unknown]
  add_variable 'A_ARG_TYPE_ConnectionManager', 'string'
  add_variable 'A_ARG_TYPE_Direction',         'string', %w[Output Input]
  add_variable 'A_ARG_TYPE_ProtocolInfo',      'string'
  add_variable 'A_ARG_TYPE_ConnectionID',      'i4'
  add_variable 'A_ARG_TYPE_AVTransportID',     'i4'
  add_variable 'A_ARG_TYPE_RcsID',             'i4'

end

