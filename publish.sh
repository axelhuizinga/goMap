rsync -rav --size-only -e "ssh -p 666 -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress ../httpdocs/* root@econet4.me:/var/www/econet4.me/web/wp-content/
