#!/bin/ash
# MultiEgg Installation script
#
# Made by Jackinatox
#
# Server Files: /mnt/server


##Get Values From Pterodactyl
#flavour={{MC_FLAVOUR}}


##functions
source functions.sh


clear


#config
downloadServer="127.0.0.1"          #File Server
flavour="Vanilla"                   #Vanilla, Fabric, Spigot
version="1.20.4"                    # Any Valid
java_version="Auto"                 #Java-X || Auto

mkdir -p /mnt/server
cd /mnt/server

ping -c1 $downloadServer > /dev/null

if [ $? -eq 0 ]; then               # Check the exit status of the ping command
    echo "accepting eula"
    echo "eula=true" > eula.txt

    java_path=$(getJavaPath $flavour $version $java_version)       #calling functions and getting return value

    echo $java_path

    echo -e "Install Complete"    
else
    echo "Could not reach local server.jar archive"
    echo "Please contact an Administrator or open a Ticket"
    echo "Aborting Installation"
fi