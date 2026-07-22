# == Class: sys::screen::params
#
# Platform-dependent parameters for installing screen.
#
class sys::screen::params {
  case $facts['os']['family'] {
    'openbsd': {
      include sys::openbsd::pkg
      $package = 'screen'
      $source = undef

      # kernelmajversion wasn't converted, we can rebuild it from kernelversion
      $kernelmajversion = Integer(split($facts['kernelversion'], '\.')[0])

      if versioncmp($kernelmajversion, '5.5') >= 0 {
        $ensure = '4.0.3p4'
      } elsif versioncmp($kernelmajversion, '5.3') >= 0 {
        $ensure = '4.0.3p3'
      } else {
        $ensure = '4.0.3p2'
      }
    }
    'solaris': {
      include sys::solaris
      $ensure = 'installed'
      $package = 'terminal/screen'
      $provider = 'pkg'
      $source = undef
    }
    default: {
      $ensure = 'installed'
      $package = 'screen'
      $provider = undef
      $source = undef
    }
  }
}
