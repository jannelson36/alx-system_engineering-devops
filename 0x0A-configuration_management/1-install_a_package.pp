# Installs flask from pip3 using Puppett.

package { 'python3-pip':
  ensure => installed,
}

exec { 'install-flask':
  command => '/usr/bin/pip3 install flask',
  path    => ['/usr/bin', '/usr/local/bin'],
  require => Package['python3-pip'],
}
