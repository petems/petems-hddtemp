# == Class hddtemp::params
#
# This class is meant to be called from hddtemp.
# It sets variables according to platform.
#
class hddtemp::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'hddtemp'
      $service_name = 'hddtemp'
      $config_path = '/etc/sysconfig/hddtemp'
      $config_template = 'hddtemp/hddtemp.erb'
      $drive_db = '/usr/share/misc/hddtemp.db'
    }
    'Debian': {
      $package_name = 'hddtemp'
      $service_name = 'hddtemp'
      $config_path = '/etc/default/hddtemp'
      $config_template = 'hddtemp/hddtemp.erb'
      $drive_db = '/usr/share/misc/hddtemp.db'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  $listen_addr       = '127.0.0.1'
  $listen_port       = '7634'
  $manage_package    = true
  $manage_repo       = true
  $manage_service    = true
  $monitored_drives  = $::blockdevices
  $package_version   = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $syslog_interval   = '1800'
  $use_syslog        = false

}
