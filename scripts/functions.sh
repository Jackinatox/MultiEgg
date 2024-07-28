#########################################################################################################
####                                                                                                 ####
####                                        functions.sh                                             ####
####                                                                                                 ####
#########################################################################################################

java21=("1.20.4" "1.20.3" "1.20.2" "1.20.1" "1.20")
java17=("1.19.2" "19.1")

contains() {
    local e compareTo="$1"

    echo "$compareTo" > compare.txt
    shift
    for e; do [[ "$e" == "$compareTo" ]] && return 0; done
    return 1
}

function getFabric {
    local version=$1
    local Result=""

    if contains "$version" "${java21[@]}"; then
        Result="Java-21"
    elif contains "$version" "${java17[@]}"; then
        Result="Java-17"
    fi

    echo $Result
}


function getJavaPath {
    local flavour=$1
    local version=$2
    local java_version=$3
    local Result="Java-21"

    if [ $java_version == "Auto" ]; then
        #for each flavour

        if [ $flavour == "Vanilla" ]; then
            Result=$(getFabric $version)
        fi

    else
        Result=$java_version 
    fi

    echo $Result
}
