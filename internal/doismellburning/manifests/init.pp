# == Class: doismellburning
#
# Full description of class doismellburning here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class doismellburning (
) inherits doismellburning::params {

  # validate parameters here

  anchor { 'doismellburning::begin': } ->
  class { 'doismellburning::install': } ->
  class { 'doismellburning::config': }
  class { 'doismellburning::service': } ->
  anchor { 'doismellburning::end': }

  Anchor['doismellburning::begin']  ~> Class['doismellburning::service']
  Class['doismellburning::install'] ~> Class['doismellburning::service']
  Class['doismellburning::config']  ~> Class['doismellburning::service']
}
