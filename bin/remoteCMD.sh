#!/bin/bash


# remoteCMD.sh : easy-to-use tool for system automation
# Version: 1.0
# License: GNU GPLv2


# Creating path variables.

home=$HOME
hostFile=$home/remoteCMD.sh/config/host.cfg
configFile=$home/remoteCMD.sh/config/config.cfg


# Creating main function.

main(){
	
	
	# Creating help function.
	
	help(){
		echo
		echo "remoteCMD.sh : easy-to-use tool for system automation."
		echo "Syntax: remoteCMD.sh [option]"
		echo 
		echo "Options:"
		echo
		echo "-h	Print help message"
		echo "-u	Update remote hosts"
		echo "-l	Install AMP stack(Apache MySQL|MariaDB Php)"
		echo "-p	Install APP stack(Apache PostgreSQL Php) "
		echo "-f	User specified command file"
		echo
		echo "License: GNU GPLv2"
		echo "End of help message."
	}
	
	
	# Creating function which will execute command(s) via SSH specified in 
	# commandFile variable on every host(s) according to hostFile variable.
	
	cmdExec(){
		mapfile -t < $commandFile
		for command in "${MAPFILE[@]}";do
			echo
			printf "%*s\n" $(tput cols) " " | tr " " "*"
			printf "%*s\n" $(($(tput cols)/2)) "Performing command"
			printf "%*s\n" $(($(tput cols)/2)) "$command on host:"
			printf "%*s\n" $(($(tput cols)/2)) "$host"
			printf "%*s\n" $(tput cols) " " | tr " " "*"
			ssh $host $command
			echo
		done
		
		}
	
	
	# Parsing positional arguments for our program.
	# If flag is chosen then the proper file containing command(s)
	# is used from within configFile.
	
	while getopts ":hulpf" option;do
		case $option in 
			h) help
			   ;;
			u) commandFile=$(awk '/Update/ {print $2}' $configFile)
			   ;;
			l) commandFile=$(awk '/AMP/ {print $2}' $configFile)
			   ;;
			p) commandFile=$(awk '/APP/ {print $2}' $configFile)
			   ;;
			f) commandFile=$2
			   ;;
			*) echo "Invalid option, use -h to view help message."
		esac
	done
	
	
	
	# Looping through hostFile variable containing list of host(s)
	# to execute on them command(s) specified in commandFile variable.
	
	for host in $(awk '{print}' $hostFile);do
		cmdExec $host $commandFile || continue
	done
	
	
}
	
# If program is used without proper flag then an error message is displayed.
	
if [ $# -eq 1 ];then
	main $1
elif [ $# -eq 2 ];then
	main $1 $2
else
	echo "Positional argument(s) required, type remoteCMD.sh -h to view help message."
fi
