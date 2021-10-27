function hecho {
    echo "<<== $1"
}

function main {
    echo "\n"
    hecho "macho & hd_parse_profraw.sh copy begin"

    resulePath=$SRCROOT/CoverageResult
    machoFiles=$resulePath/MachOFiles
    profrawFiles=$resulePath/Profraw
    
    judgeResultFolder
    copyIpaAndShellFile
    
    open $resulePath
    
    hecho "macho & hd_parse_profraw.sh copy end"
    echo "\n"
}

function judgeResultFolder {
    if [[ -d $resulePath ]]; then
        hecho "$resulePath exist."
    else
        mkdir $resulePath
        mkdir $machoFiles
        hecho "$machoFiles not found，already created."
    fi
    
    if [[ -d $profrawFiles ]]; then
        hecho "$profrawFiles exist."
    else
        mkdir $profrawFiles
        hecho "$profrawFiles not found，already created."
    fi
}

function copyIpaAndShellFile {
    hecho "ipa_path: $CODESIGNING_FOLDER_PATH"

    cp -r $CODESIGNING_FOLDER_PATH $machoFiles

    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    parseProfrawPath="$resulePath/hd_parse_profraw.sh"
    
    if [[ -d $parseProfrawPath ]]; then
            hecho "$parseProfrawPath exist."
    else
        cp -r ${scripts}/hd_parse_profraw.sh $resulePath
            hecho "$parseProfrawPath not found，already copyed."
    fi

    hecho "macho_copy end"
}

main
