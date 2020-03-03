# Create Nginx class
class nginxdemo {
$message = "<html>
        <body>
                <h1> Hello All, This test is to install Nginx Application</h1>
		<h2> Dami is awesome!!!!!  </h2>
		<h3> Ayo is awesome!!! </h3>
        </body>
        </html>" 
       # Install epel-repository package if not installed
       exec { 'usr/bin/yum':
#		path    => ['/usr/bin', '/usr/sbin', '/bin'],
                command => '/usr/bin/amazon-linux-extras install nginx1.12',
        }
# Nginx Package Installation Code
        package { 'nginx':
                ensure => 'present',
                before => Service['nginx'],
         }

# Configuring simple index.html file with some test content
        file {'/usr/share/nginx/html/index.html':
                ensure  => 'present',
                content => "$message",
                require => Package["nginx"],
        }

# Enable and Start Nginx service
        service {"nginx":
                ensure    => 'running',
                enable    => 'true',
                subscribe => File['/usr/share/nginx/html/index.html'],
        }

}

