#!/bin/bash

USERNAME=$2
PASSWORD=$3

pgping() {
    ansible-playbook pgping.yml
}

pgpool_nodes() {
    ansible-playbook pgpool_nodes.yml
}

pgpool_hba() {
    ansible-playbook pgpool_hba.yml
}

pgpool_attach() {
    ansible-playbook pgpool_attach.yml
}

pgpool_conf() {
    ansible-playbook pgpool_conf.yml
}

pgpool_user() {
    ansible-playbook pgpool_user.yml --extra-var "username=${USERNAME} password=${PASSWORD}"
}

readme() {
    cat /home/atmo/pgprov/files/README 
}

case "$1" in
    pgping)
        pgping
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
    pgpool_nodes)
	pgpool_nodes
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