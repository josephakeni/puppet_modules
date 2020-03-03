class apachedemo {
$message = "<html>
	        <body>
        	        <h1> Hello All, This test is to install Apache Webserver</h1>
			<h4> This is Awesome!!!! </h4>
        	</body>
     	</html>"

  # Install epel-repository package if not installed 
  exec { 'Install EPEL-Repo':
    command => '/usr/bin/yum -y install epel-release',
  }

# Apache Package Installation Code 
  package { 'httpd':
    ensure => 'present',
    before => Service['httpd'],
   }

# Configuring simple index.html file with some test content
  file {'/var/www/html/index.html':
    ensure  => 'present',
    content => "$message",
    require => Package['httpd'],
  }

# Enable and Start apache service 
  service {'httpd':
    ensure    => 'running',
    enable    => 'true',
    subscribe => File['/var/www/html/index.html'],
  }

}

