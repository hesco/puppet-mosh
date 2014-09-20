
class mosh::iptables {

  $port_range = '60000:60005'
  $port_range_puppet_firewall = '60000-60005'
  if defined('firewall') {

    firewall { '100 allow mosh connections':
       dport => $port_range_puppet_firewall,
       proto => udp,
      action => accept,
    }

    # notify { 'need-to-implement':
    #   message => 'Still need to implement use of puppetlabs-firewall for mosh',
    # }

  } else {
    exec { 'iptables-accept-mosh-udp':
      command => "/sbin/iptables -A INPUT -p udp -m multiport --dports $port_range -j ACCEPT ",
      unless => "/sbin/iptables -L | /bin/grep $port_range | /usr/bin/wc -l",
    }
  }

}

