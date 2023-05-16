# Change OS configuration to enable login with holberton user and open file without error
exec { '/usr/bin/env sed -i "s/holberton/foo/" /etc/security/limits.conf': }
