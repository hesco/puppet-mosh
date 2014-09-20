class mosh (

    $port_range = $mosh::params::port_range

  ) inherits mosh::params {

  $package = 'mosh'
 
  case $::operatingsystem {
    'ubuntu': {
      package { $package:
         ensure => present,
         }
     }
  
    'debian': {
      package { $package:
        ensure => present,
      }
    }
  
    'redhat': {
       include epel
       # to get/enable EPEL repo
       # puppet module install stahnma-epel / zerlgi-epel
       package { $package:
         ensure => installed,
         ensure => present,
         require => Package['epel-release'],
        }
     }
  }

  include mosh::iptables

}
