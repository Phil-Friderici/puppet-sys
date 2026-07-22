# == Class: sys::curl::params
#
# Platform-dependent parameters for curl.
#
class sys::curl::params {
  case $facts['os']['family'] {
    'darwin': {
      # Curl included by default on OS X.
      $package = false
      $path = '/usr/bin/curl'
      $provider = undef
      $source = undef
    }
    'openbsd': {
      include sys::openbsd::pkg
      $package = 'curl'
      $path = '/usr/local/bin/curl'
      $source = $sys::openbsd::pkg::source
      $provider = undef
    }
    'solaris': {
      include sys::solaris
      $package = 'web/curl'
      $path = '/usr/bin/curl'
      $provider = 'pkg'
      $source = undef
    }
    default: {
      $package = 'curl'
      $path = '/usr/bin/curl'
      $provider = undef
      $source = undef
    }
  }
}
