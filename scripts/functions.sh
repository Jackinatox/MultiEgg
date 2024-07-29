#########################################################################################################
####                                                                                                 ####
####                                        functions.sh                                             ####
####                                                                                                 ####
#########################################################################################################


contains() {
    local e compareTo="$1"
    shift
    for e; do [[ "$e" == "$compareTo" ]] && return 0; done
    return 1
}

function getPaper {
    # 1.8 to 1.11	    Java 8
    # 1.12 to 1.16.4	Java 11
    # 1.16.5	        Java 16
    # 1.17.1-1.18.1+	Java 21
    local java21=("1.21" "1.20.6" "1.20.5" "1.20.4" "1.20.3" "1.20.2" "1.20.1" "1.20" "1.19.4" "1.19.3" "1.19.2")

    echo bs
}

function getFabric {
    ## Aperantly Fabric alway requires Java 21 ...
    local minecraft_version=$1
    local Result="Java-21"

#    if [[ "$minecraft_version" < "1.12.2" || "$minecraft_version" == "1.12.2" ]]; then
#        Result="Java-8"
#    elif [[ "$minecraft_version" < "1.16" ]]; then
#        Result="Java-11"
#    elif [[ "$minecraft_version" < "1.16.5" || "$minecraft_version" == "1.16.5"  ]]; then
#        Result="Java-16"
#    else
#        Result="Java-21"
#    fi

    echo $Result
}


function getJavaPath {
    local Result="Java-21"

    if [ $java_version == "Auto" ]; then
        #for each flavour

        if [ $flavour == "Vanilla" ]; then
            Result=$(getFabric $version)
        elif [ $flavour == "Fabric" ]; then
    	    Result=$(getFabric $version)
        fi

    else
        Result=$java_version 
    fi

    echo $Result
}

function downloadJar {
    wget $downloadServer:$downloadPort/$flavour/$version/server.jar
}


function testJava {
    #TODO: This is only to see if the server starts with the java version!!!!!!!!!!!!
    $java_path -Xmx2G -jar server.jar &
    pid=$!
    sleep 40  # Adjust time as necessary to allow the server to start
    kill $pid
    
    clear
    echo "KILLED MC SERVER"
    echo ls in java test:
    ls $java_path
}