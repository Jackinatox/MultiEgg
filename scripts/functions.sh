#########################################################################################################
####                                                                                                 ####
####                                        functions.sh                                             ####
####                                                                                                 ####
#########################################################################################################

function getJavaPath {
    local flavour=$1
    local version=$2
    local java_version=$3
    local Result="Java-21"

    if [ $java_version == "Auto" ]; then
        #for each flavour

        #if [ $flavour == "Vanila" ]; then


        Result="Java-21"
    else
        Result=$java_version 
    fi

    echo $Result
}
