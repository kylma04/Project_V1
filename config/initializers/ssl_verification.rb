require 'openssl'
require 'net/http'

OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:verify_mode] = OpenSSL::SSL::VERIFY_PEER
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_file] = '/lib/ssl/cert.pem'
