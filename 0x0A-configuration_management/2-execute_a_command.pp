# kills the process killmenow

exec { '' :
  command     => 'pkill -f "killmenow"',
  refreshonly => true,
  path	      => ['/usr/bin/'],
 }
