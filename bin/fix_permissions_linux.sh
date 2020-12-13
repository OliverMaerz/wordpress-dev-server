#!/bin/bash

# check if running on Linux
unameOut="$(uname -s)"
if [ "${unameOut}" == "Linux" ]; then
  # running under Linux ... change the permissions
  main_dir="$(dirname $(dirname $(realpath $0)))"
  cd "$main_dir" || exit

  printf "\nSetting file permissions for the wordpress and mysql_data folder. You may have to enter your password below.\n\n"
  sudo find server_files/wordpress server_files/mysql_data \( -type d -execdir chmod 2777 '{}' \; \) , \( -type f -execdir chmod 666 '{}' \; \)
  sudo chown 33:33 -R server_files/wordpress
  sudo chown 999:999 -R server_files/mysql_data
else
  # not running under Linux - do not do anything
  printf "\nSkip setting the file permissions, because not running under Linux.\n\n"
fi
