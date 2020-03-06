# Class: apache
# ===========================
#
# Full description of class apache here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'apache':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2020 Your name here, unless otherwise noted.
#
class apache {

# execute 'apt-get update'
#       exec { 'yum update':                    # exec resource named 'apt-update'
 #              command => '/usr/bin/yum get update'  # command this resource will run
#}

# install httpd package
#        package { 'httpd':
  #             require => Exec['yum update'],        # require 'yum update' before installing
#                ensure => installed,
#        }

# ensure httpd service is running
#       service { 'httpd':
#               ensure => running,
#       }

# Variables for apache Module

$pkg	 = "httpd"
$html_file = "/var/www/html/index.html"
$httpd_ser	= "httpd" 
$message = "<html>
                <body>
                        <h1> Hello All, This test is to install Apache Webserver</h1>
                        <h4> This is Awesome!!!! </h4>
                </body>
        </html>"

  # Install epel-repository package if not installed
  exec { "Install EPEL-Repo":
    command => "/usr/bin/yum -y install epel-release",
  }

# Apache Package Installation Code
  package { "${pkg}":
    ensure => 'present',
    before => Service["${httpd_ser}"],
   }

# Configuring simple index.html file with some test content
  file {"${html_file}":
    ensure  => 'present',
    source => "puppet:///modules/apache/index.html",
    require => Package["${pkg}"],
  }

# Enable and Start apache service
  service {"${httpd_ser}":
    ensure    => 'running',
    enable    => 'true',
    subscribe => File["${html_file}"],
  }

}

