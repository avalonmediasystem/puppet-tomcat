class tomcat::service {

  service { 'tomcat':
    name       => 'tomcat',
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => [Package['tomcat'],File['/usr/local/tomcat/conf/tomcat-users.xml'],File['/usr/local/tomcat/conf/server.xml']]
  }

}
