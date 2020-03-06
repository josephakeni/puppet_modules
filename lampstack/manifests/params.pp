class lampstack::params {

# Required packages
	$apachepackage	= 'http'
	$mariadbpackage	= 'mariadb-server'
	$phppackage	=	['php', 'php-mysql', 'php-fpm']

# Required services
	$apacheservice  = 'http'
	$mariadbservice = 'mariadb'
	$ensureservice	=	'running'

# PHP File defaults
	$file = "/var/www/html/info.php"
	$mode = "0664"
	$owner	= "root"
	$group	= "root"
	$content =	"<?php phpinfo(); ?>"
}


	
