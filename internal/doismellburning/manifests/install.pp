# == Class doismellburning::install
#
class doismellburning::install {
  include doismellburning::params

  package { $doismellburning::params::package_name:
    ensure => present,
  }
}
