# Class: ntp
# ===========================
#
# Full description of class ntp here.
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
#    class { 'ntp':
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
class ntp {

# Define Variable
$timeserver = "server 0.centos.pool.ntp.org iburst\n"

# Installing NTP Package
        package {"ntp":
                ensure  => "installed",
        }

# Configuring NTP configuration file
        file { "/etc/ntp.conf":
        ensure  => "present",
        content => "$timeserver",
        }

# Starting NTP services
        service { "ntpd":
        ensure  => "running",
        enable  => "true",
        }


}
