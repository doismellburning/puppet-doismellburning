# == Class doismellburning::params
#
# This class is meant to be called from doismellburning
# It sets variables according to platform
#
class doismellburning::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'doismellburning'
      $service_name = 'doismellburning'
    }
    'RedHat', 'Amazon': {
      $package_name = 'doismellburning'
      $service_name = 'doismellburning'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
