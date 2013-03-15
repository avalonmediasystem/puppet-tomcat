class tomcat::service {

  service { 'tomcat':
    name       => 'tomcat',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['tomcat'],
  }

}
