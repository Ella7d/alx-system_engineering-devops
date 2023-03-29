# Setup New Ubuntu server with nginx

exec { 'install system':
	command  => '/usr/bin/apt-get update ; sudo apt-get -y install nginx',
	provider => shell,

}

package { 'nginx':
	ensure  => 'installed',
	require => Exec[ 'update system']
}

exec {'Hello':
	command  => 'echo "Hello World!" | sudo tee /var/www/html/index.html',
	provider => shell,
}


exec {'redirect_me':
	command  => 'sed -i "24i\	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
	provider => 'shell'
}

exec {'run':
	command  => 'sudo service nginx restart',
	provider => shell,
}}
