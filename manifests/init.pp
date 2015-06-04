class mosh {
  $package = 'mosh'
 
  case $::osfamily {
    'debian': {
      package { $package:
        ensure => present,
      }
    }
  
    'redhat': {
       class { 'epel': }
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
