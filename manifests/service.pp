
#include fusion inventory

class fusioninventory::service inherits fusioninventory {
  file { '/etc/fusioninventory/agent.cfg':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('fusioninventory/agent.cfg.erb'),
  }
  notify { 'Template Fusion agent.cfg done': }

  service { $::pkgfusion :
    ensure =>  $::service_ensure,
    enable =>  $::service_enable,
  }
}
