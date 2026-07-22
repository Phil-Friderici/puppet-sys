# == Class: sys::openbsd::params
#
# Release-dependent parameters for OpenBSD.
#
class sys::openbsd::params {
  # kernelmajversion wasn't converted, we can rebuild it from kernelversion
  $kernelmajversion = Integer(split($facts['kernelversion'], '\.')[0])

  # The default mirror for OpenBSD packages.
  $mirror = "http://ftp3.usa.openbsd.org/pub/OpenBSD/${kernelmajversion}/packages/${facts['os']['architecture']}/"
}
