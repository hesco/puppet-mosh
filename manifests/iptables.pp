
class mosh::iptables {

  if ! $::is_docker_container {
    if $mosh::manage_firewall {
      if defined('firewall') {
        firewall { '60001 allow mosh connections':
           dport => regsubst( $mosh::port_range, ':', '-' ),
           proto => udp,
          action => accept,
        }
      } else {
        exec { 'iptables-accept-mosh-udp':
          command => "/sbin/iptables -A INPUT -p udp -m multiport --dports $mosh::port_range -j ACCEPT ",
          unless => "/sbin/iptables -L | /bin/grep $mosh::port_range | /usr/bin/wc -l",
        }
      }
    }
  }

}

