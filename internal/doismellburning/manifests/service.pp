# == Class doismellburning::service
#
# This class is meant to be called from doismellburning
# It ensure the service is running
#
class doismellburning::service {
  include doismellburning::params

  service { $doismellburning::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
