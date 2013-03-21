class tomcat::install {
  
  package {'tomcat':
    ensure  => present,
    require => Class['nulrepo'],
  }

  file { ['/usr/local/tomcat/conf/Catalina','/usr/local/tomcat/conf/Catalina/localhost']:
  	ensure => directory,
  	require => Package['tomcat']
	}
}
