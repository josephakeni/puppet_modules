# Class: dockerengine
# ===========================
#
# Full description of class dockerengine here.
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
#    class { 'dockerengine':
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
class dockerengine {

	yumrepo { 'docker-ce-stable':
		ensure => 'present',
		baseurl => 'https://download.docker.com/linux/centos/7/$basearch/stable',
		descr => 'Docker CE Stable - $basearch',
		enabled => '1',
		gpgcheck => '1',
		gpgkey => 'https://download.docker.com/linux/centos/gpg',
	}
	package { ['yum-utils', 'device-mapper-persistent-data','lvm2','deltarpm','docker-ce']:
		ensure => 'present', 
	}
	
	service {'docker':
		ensure => 'running',
		enable => 'true',
	}

	exec { 'docker run hello-world':
		path => [ '/usr/bin', '/usr/sbin',],
		logoutput => 'true',
	}
	
}
