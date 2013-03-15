node default{

    # MySQL configuration
    # Include the PHP - MySQL bits
    class { 'mysql::php': }
    
    # Configure the MySQL Server - generally just the root password
    class { 'mysql::server':
      config_hash => {  'root_password' => 'foo', 
                        'bind_address'  => '0.0.0.0',
                      }
    }
    
    # Configure a database - can have as many as you need
    mysql::db { 'mydb':
      user     => 'myuser',
      password => 'mypass',
      host     => '%',
      grant    => ['all'],
    }
    
    # We could just use the apache module to configure things, but we'll do it manually to show how Puppet works:
    # class {'apache::mod::php': }
    
    # Install the apache2 package (synonymous with apt-get install apache2) 
    package { 'apache2':
      ensure => latest,
    }

    # Install PHP, needs the apache2 package installed first, and will reload the apache2 service if it changes
    package {'libapache2-mod-php5':
      ensure  => latest,
      require => Package['apache2'],
      notify  => Service['apache2'],
    }
    
    # Make sure apache2 is running, and to run it needs apache2 installed
    service { 'apache2':
      ensure  => 'running',
      require => Package['apache2'],
    }
    
    # Make a symlink: /vagrant/Project_code to /var/www, and when it changes restart apache2
    file {'/var/www':
      ensure => link,
      target => '/vagrant/Project_Code',
      notify => Service['apache2'],
      force  => true,
    }
}