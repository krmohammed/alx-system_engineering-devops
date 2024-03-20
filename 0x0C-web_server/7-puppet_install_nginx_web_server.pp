#install and congigure an nginx web server

package {'nginx':
  ensure => installed,
}

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
}

file {'/var/www/html/my_404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
}

file {'/etc/nginx/sites-available/default':
  ensure  => file,
  content => "server {
	listen 80;
	listen [::]:80 default_server;
	root /var/www/html;
	error_page 404 /my_404.html;

	location /redirect_me {
		return 301;
	}

	location /404 {
		root /var/www/html;
		internal;
	}
}",
  require => Package['nginx'],
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
