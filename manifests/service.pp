# == Class hddtemp::service
#
# This class is meant to be called from hddtemp.
# It ensure the service is running.
#
class hddtemp::service {

  if $::hddtemp::manage_service {
    service { $::hddtemp::service_name:
      ensure => $::hddtemp::service_ensure,
      enable => $::hddtemp::service_enable,
    }
  }

}
