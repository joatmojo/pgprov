#!/bin/bash

USERNAME=$2
PASSWORD=$3

pgpool_user() {
    ansible-playbook /home/atmo/pgprov/pgpool_user.yml --extra-var "username=${USERNAME} password=${PASSWORD}" --ask-become-pass
}

case "$1" in
    ping)
        ping
        ;;
    pgpool_hba)
        pgpool_hba
        ;;
    pgpool_attach)
        pgpool_attach
        ;;
    pgpool_user)
	if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]
	then
        	echo "command tidak lengkap, pastikan masukan username dan password"
		exit 2
	else
		pgpool_user
	fi
        ;;
    pgpool_node)
	pgpool_node
	;;
    pgpool_conf)
        pgpool_conf
        ;;
#    postgres_hba)
#        postgres_hba
#        ;;
    postgres_pgconf)
	postgres_pgconf
	;;
    postgres_pgbackup)
        postgres_pgbackup
        ;;
    help)
        readme
        ;;	
    *)
        echo "command tidak tersedia, harap baca readme"
	readme
	exit 2
        ;;
esac