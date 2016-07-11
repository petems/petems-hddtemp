# Class: hddtemp
# ===========================
#
# Full description of class hddtemp here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class hddtemp (
  $config_path      = $::hddtemp::params::config_path,
  $config_template  = $::hddtemp::params::config_template,
  $drive_db         = $::hddtemp::params::drive_db,
  $listen_addr      = $::hddtemp::params::listen_addr,
  $listen_port      = $::hddtemp::params::listen_port,
  $manage_package   = $::hddtemp::params::manage_package,
  $monitored_drives = $::hddtemp::params::monitored_drives,
  $package_name     = $::hddtemp::params::package_name,
  $package_version  = $::hddtemp::params::package_version,
  $service_enable   = $::hddtemp::params::service_enable,
  $service_ensure   = $::hddtemp::params::service_ensure,
  $manage_service   = $::hddtemp::params::manage_service,
  $service_name     = $::hddtemp::params::service_name,
  $syslog_interval  = $::hddtemp::params::syslog_interval,
  $use_syslog       = $::hddtemp::params::use_syslog,
) inherits ::hddtemp::params {

  class { '::hddtemp::install': } ->
  class { '::hddtemp::config': } ~>
  class { '::hddtemp::service': } ->
  Class['::hddtemp']
}
