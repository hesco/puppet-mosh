class mosh-rhel {
  $package = 'mosh'
 
case $::operatingsystem {
  'ubuntu': {
    package { $package:
       ensure => installed,
       ensure => present,
       }
   }

  'redhat': {
     include epel
  # to get/enable EPEL repo
  # puppet module install stahnma-epel / zerlgi-epel
     require => Package['epel-release'],
     package { $package:
       ensure => installed,
       ensure => present,
      }
   }
}
