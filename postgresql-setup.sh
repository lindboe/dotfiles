#! /bin/bash

sudo apt-get install postgresql

as_postgres='sudo -H -u postgres bash -c'
$as_postgres createuser -s -U lizzi
$as_postgres createdb lizzi -O lizzi

config="$(psql -t -c 'show config_file' | tr -d '[:space:]')"
log_config=$(cat <<EOM
log_destination = 'stderr'
logging_collector = off
log_directory = '/var/log/postgresql'
log_filename = 'postgresql-%Y-%m-%d.log
log_file_mode = 0644
log_rotation_age = 1440
# can be set to ddl, mod, or all
log_statement = 'none'
EOM
)

echo $config
echo $log_config
echo "BREAK"
echo "echo \"${log_config}\" >> $config"

# Nothing is working D:
sudo su -c "echo \"${log_config}\" >> $config"
# I get authentication failure after pw prompt here
# su root -c "echo $log_config >> $config"
