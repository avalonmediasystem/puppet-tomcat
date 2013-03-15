class tomcat::install {
  
  package {'tomcat':
    ensure  => present,
    require => Class['nulrepo'],
  }

}
