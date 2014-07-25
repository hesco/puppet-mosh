
class mosh::iptables {

  $port_range = '60000:60005'
  if defined('firewall') {
    notify { 'need-to-implement':
      message => 'Still need to implement use of puppetlabs-firewall for mosh',
    }
  } else {
    exec { 'iptables-accept-mosh-udp':
      command => "/sbin/iptables -A INPUT -p udp -m multiport --dports $port_range -j ACCEPT ",
      unless => "/sbin/iptables -L | /bin/grep $port_range | /usr/bin/wc -l",
    }
  }

}

