class tomcat::install(
	$user       = $tomcat::params::user,
	$group      = $tomcat::params::group,
	$admin_user = $tomcat::params::admin_user,
	$admin_pass = $tomcat::params::admin_pass,
	$http_port  = $tomcat::params::http_port
) inherits tomcat::params {
  
  package {'tomcat':
    ensure  => present,
    require => Class['nulrepo'],
  }

  file { ['/usr/local/tomcat/conf/Catalina','/usr/local/tomcat/conf/Catalina/localhost']:
  	ensure  => directory,
  	owner   => $user,
  	group   => $group,
  	mode    => '0755',
  	require => Package['tomcat']
	}

	file { '/usr/local/tomcat/conf/server.xml':
		ensure  => present,
		content => template('tomcat/server.xml.erb'),
		owner   => $user,
		group   => $group,
  	require => Package['tomcat']
	}

	file { '/usr/local/tomcat/conf/tomcat-users.xml':
		ensure  => present,
		content => template('tomcat/tomcat-users.xml.erb'),
		owner   => $user,
		group   => $group,
  	require => Package['tomcat']
	}

}
