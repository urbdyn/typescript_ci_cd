#!/usr/bin/env bash

# Exit on error
set -e

help_text="
setup_env.sh

Attempts to detect Linux or Unix system and setup development environment.
"

case "$1" in
	-h|--help)
		echo "$help_text"
		exit 0
		;;
	*)
		if [[ $EUID -ne 0 ]]; then
			echo "This script must be run as root"
			exit 1
		fi
		echo "Checking Linux systems ..."
		linux_info="$(cat /etc/*release)"
		if [[ "$linux_info"  == *"ubuntu"* ]]; then
			echo "Ubuntu detected!"
			echo "Updating OS packages ..."
			apt update
			echo "Installing nodejs package server ..."
			curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
			chmod +x nodesource_setup.sh
			./nodesource_setup.sh
			echo "Installing OS packages ..."
			apt install -y nodejs
			echo "Installing NPM packages ..."
			npm install
			echo "DONE"
		fi
		;;
esac

