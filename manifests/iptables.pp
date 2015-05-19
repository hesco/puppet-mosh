
class mosh::iptables {

  $port_range = '60000:60005'
  if defined('firewall') {
    firewall { '101 - Allow mosh':
      port   => '60000-61000',
      proto  => udp,
      action => accept,
    }
  } else {
    exec { 'iptables-accept-mosh-udp':
      command => "/sbin/iptables -A INPUT -p udp -m multiport --dports $port_range -j ACCEPT ",
      unless => "/sbin/iptables -L | /bin/grep $port_range | /usr/bin/wc -l",
    }
  }

}

