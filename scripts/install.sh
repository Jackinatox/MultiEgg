#!/bin/ash
# MultiEgg Installation script
#
# Made by Jackinatox
#
# Server Files: /mnt/server

##Get Values From Pterodactyl
#flavour={{MC_FLAVOUR}}

#set -x                             #Debug
source functions.sh

clear

#config
downloadServer="192.168.0.120"      #File Server
downloadPort="8000"                 #File Server Port
flavour="Vanilla"                   #Vanilla, Fabric, Spigot
version="1.21"                      # Any Valid
java_version="Auto"                 #Java-X || Autop

mkdir -p /mnt/server
cd /mnt/server

ping -c1 $downloadServer > /dev/null

if [ $? -eq 0 ]; then               # Check the exit status of the ping command
    echo "accepting eula"
    echo "eula=true" > eula.txt


    java_path=$(getJavaPath $flavour $version $java_version)       #calling functions and getting return value

    echo downloading server jar
    downloadJar

    java_path="/var/java/$java_path/bin/java"
    echo Java_Path: $java_path
   
    testJava

    echo -e "Install Complete"    
    echo LSing:
    ls
else
    echo "Could not reach local server.jar archive"
    echo "Please contact an Administrator or open a Ticket"
    echo "Aborting Installation"
fi