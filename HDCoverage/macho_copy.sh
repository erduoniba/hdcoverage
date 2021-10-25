function main {
    echo "==== macho & parse_profraw.sh copy begin ===="

    resulePath=$SRCROOT/CoverageResult
    machoFiles=$resulePath/MachOFiles
    profrawFiles=$resulePath/Profraw
    
    judgeResultFolder
    copyIpaAndShellFile
    
    open $resulePath
    
    echo "==== macho & parse_profraw.sh copy end ===="
}

function judgeResultFolder {
    if [[ -d $resulePath ]]; then
        echo "$resulePath exist."
    else
        mkdir $resulePath
        mkdir $machoFiles
        echo "$machoFiles not found，already created."
    fi
    
    if [[ -d $profrawFiles ]]; then
        echo "$profrawFiles exist."
    else
        mkdir $profrawFiles
        echo "$profrawFiles not found，already created."
    fi
}

function copyIpaAndShellFile {
    echo "ipa_path: $CODESIGNING_FOLDER_PATH"

    cp -r $CODESIGNING_FOLDER_PATH $machoFiles

    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cp -r  ${scripts}/parse_profraw.sh $resulePath

    echo "macho_copy end"
}

main
