class mosh {
  $package = 'mosh'
 
  case $::osfamily {
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
