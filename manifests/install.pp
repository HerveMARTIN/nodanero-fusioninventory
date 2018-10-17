
#include fusioninventory

class fusioninventory::install {
  case $facts['os']['family'] {
    'Windows': {
      $install_options = [
        '/acceptlicense=yes',
        '/add-firewall-exception=yes',
        '/execmode=service',
        '/installtasks=Full',
        "/server=${::fusioninventory::params::server_url}",
      ]
      package { $::fusioninventory::pkgfusion:
        ensure          => installed,
        source          => 'https://github.com/tabad/fusioninventory-agent-windows-installer/releases/download/2.3.18/fusioninventory-agent_windows-x86_2.3.18.exe',
        install_options => $install_options,
      }
    }
    /^(RedHat|CentOS)$/: {
      package {  $::fusioninventory::pkgfusion:
        ensure => $::fusioninventory::version,
      }
    }
    /^(Debian|Ubuntu)$/: {
      package {  $::fusioninventory::pkgfusion:
        ensure => $::fusioninventory::version,
      }
    }
    default: {
      warning('This fusioninventory module does not yet work on your OS.')
    }
}

}
