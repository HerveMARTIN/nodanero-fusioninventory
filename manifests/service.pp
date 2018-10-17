
#include fusion inventory

class fusioninventory::service {
  $no_proxy   = $::fusioninventory::no_proxy
  $server_url = $::fusioninventory::server_url

  file { '/etc/fusioninventory/agent.cfg':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('fusioninventory/agent.cfg.erb'),
    notify  => Service[$::fusioninventory::pkgfusion],
  }

  service { $::fusioninventory::pkgfusion :
    ensure =>  $::fusioninventory::service_ensure,
    enable =>  $::fusioninventory::service_enable,
  }
}
