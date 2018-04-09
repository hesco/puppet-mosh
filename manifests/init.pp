class mosh (

    $port_range = $mosh::params::port_range

  ) inherits mosh::params {

  $package = 'mosh'
 
  case $::osfamily {
    'debian': {
      package { $package:
        ensure => present,
      }
    }
  
    'redhat': {
      # It's likely that another module already includes the epel module.
      # We only include it if it's not already defined to prevent 
      # duplicate declarations.
      if !defined(Class['::epel']) {
        class { 'epel': }
      }
      # to get/enable EPEL repo
      # puppet module install stahnma-epel / zerlgi-epel
      package { $package:
        ensure => present,
        require => Class['epel'],
      }
    }
  }

  include mosh::iptables

}
