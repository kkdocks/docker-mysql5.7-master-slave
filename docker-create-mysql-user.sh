#!/bin/bash
set -eo pipefail
shopt -s nullglob

neko_process_sql() {
	mysql --protocol=socket -uroot -hlocalhost "$@"
}

_main() {
	if [ -n "$3" ]; then
		echo "Creating database $3"
		neko_process_sql --database=mysql <<<"CREATE DATABASE IF NOT EXISTS \`$3\` character set utf8mb4 collate utf8mb4_unicode_ci;"
	fi

	if [ -n "$1" ] && [ -n "$2" ]; then
		echo "Creating user $1"
		neko_process_sql --database=mysql <<<"CREATE USER '$1'@'localhost' IDENTIFIED with mysql_native_password BY '$2' ;"

		if [ -n "$3" ]; then
			echo "Giving user $1 access to schema $2"
			neko_process_sql --database=mysql <<<"GRANT ALL ON \`$3\`.* TO '$1'@'localhost' ;"
		fi

		neko_process_sql --database=mysql <<<"FLUSH PRIVILEGES ;"
	fi
}

_main "$@";