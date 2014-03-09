node default {

  class { 'timezone':
        timezone => 'Europe/London',
  }

## Maybe needed for version 2.0.0
  package { 'java-1.7.0-openjdk':
    ensure => installed,
  }

  class { 'archiva': 
          version       => '2.0.0',
          apache_mirror => 'http://mirror.gopotato.co.uk/apache',
  }
}

