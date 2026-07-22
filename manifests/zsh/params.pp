# == Class: sys::zsh::params
#
# Platform-dependent parameters for the Z shell.
#
class sys::zsh::params {
  case $facts['os']['family'] {
    'darwin': {
      $package = false
      $path    = '/bin/zsh'
      $source  = undef
      $provider = undef
    }
    'openbsd': {
      include sys::openbsd::pkg
      $package = 'zsh'
      $path    = '/usr/local/bin/zsh'
      $source  = $sys::openbsd::pkg::source
      $provider = undef
    }
    'solaris': {
      include sys::solaris
      $provider = 'pkg'
      $package  = 'shell/zsh'
      $path     = '/usr/bin/zsh'
      $source  = undef
      $provider = undef
    }
    'redhat': {
      $package = 'zsh'
      $path    = '/bin/zsh'
      $source  = undef
      $provider = undef
    }
    'debian': {
      $package = 'zsh'
      $path    = '/bin/zsh'
      $source  = undef
      $provider = undef
    }
    default: {
      fail("Don't know how to install bash on ${facts['os']['family']}.\n")
    }
  }
}
