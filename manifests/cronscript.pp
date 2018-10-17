
#include fusion inventory

class fusioninventory::cronscript {
  $no_proxy   = $::fusioninventory::no_proxy
  $server_url = $::fusioninventory::server_url

  file { $::crondest:
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('fusioninventory/fusioninventory.erb'),
  }
}
