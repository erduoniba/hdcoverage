function hecho {
    echo "<<== $1"
}

function main {
    echo "\n"
    hecho "macho & hd_parse_profraw.sh & gitdiff copy begin"

    resulePath=$SRCROOT/CoverageResult
    machoFiles=$resulePath/MachOFiles
    profrawFiles=$resulePath/Profraw
    gitDiffs=$resulePath/Gitdiffs
    
    judgeResultFolder
    copyIpaAndShellFile
    
    open $resulePath
    
    hecho "macho & hd_parse_profraw.sh & gitdiff copy end"
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

    if [[ -d $gitDiffs ]]; then
        hecho "$gitDiffs exist."
    else
        mkdir $gitDiffs
        hecho "$gitDiffs not found，already created."
    fi
}

function copyIpaAndShellFile {
    hecho "ipa_path: $CODESIGNING_FOLDER_PATH"

    cp -r $CODESIGNING_FOLDER_PATH $machoFiles

    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    parseProfrawPath="$resulePath/hd_parse_profraw.sh"
    parseProfrawGatherPath="$resulePath/hd_parse_profraw_gather.sh"
    
    cp -r ${scripts}/hd_parse_profraw.sh $resulePath
    cp -r ${scripts}/hd_parse_profraw_gather.sh $resulePath
    cp -r ${scripts}/GitdiffUtils $resulePath

    hecho "macho_copy end"
}

main
