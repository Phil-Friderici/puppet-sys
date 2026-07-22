# == Class: sys::git::params
#
# Platform-dependent parameters for git.
#
class sys::git::params {
  case $facts['os']['family'] {
    'openbsd': {
      include sys::openbsd::pkg
      $package  = 'git'
      $source   = $sys::openbsd::pkg::source
      $provider = undef
      $install_options = undef
      $base_url = undef
      $win_path = undef
    }
    'solaris': {
      include sys::solaris
      $package  = 'developer/versioning/git'
      $provider = 'pkg'
      $source   = undef
      $install_options = undef
      $base_url = undef
      $win_path = undef
    }
    'debian': {
      $package  = 'git-core'
      $provider = undef
      $source   = undef
      $install_options = undef
      $base_url = undef
      $win_path = undef
    }
    'redhat': {
      $package  = 'git-core'
      $provider = undef
      $source   = undef
      $install_options = undef
      $base_url = undef
      $win_path = undef
    }
    'windows': {
      $version = '2.5.0'
      $release_tag = "v${version}.windows.1"
      $base_url = "https://github.com/git-for-windows/git/releases/download/${release_tag}/"

      if $facts['os']['architecture'] == 'x64' {
        $basename = "Git-${version}-64-bit.exe"
      } else {
        $basename = "Git-${version}-32-bit.exe"
      }

      $package = "Git version ${version}"
      $install_options = ['/VERYSILENT']
      $win_path = 'C:\Program Files\Git\cmd'
      $provider = undef
      $source   = undef
    }
    default: {
      fail("Do not know how to install git on ${facts['os']['family']}.\n")
    }
  }
}
