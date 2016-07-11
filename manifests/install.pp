# == Class hddtemp::install
#
# This class is called from hddtemp for install.
#
class hddtemp::install {

  if $::operatingsystem == 'CentOS' {
    # HDDTemp is in EPEL repo on CentOS
    include ::epel
    Class['::epel'] -> Package[$::hddtemp::package_name]
  }

  if $::hddtemp::manage_package {
    package { $::hddtemp::package_name:
      ensure => $::hddtemp::package_version,
    }
  }

}
