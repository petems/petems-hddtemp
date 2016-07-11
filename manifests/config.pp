# == Class hddtemp::config
#
# This class is called from hddtemp for service config.
#
class hddtemp::config {

  file { $::hddtemp::config_path:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::hddtemp::config_template),
  }

}
