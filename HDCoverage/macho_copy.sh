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
    if [[ -d $machoFiles ]]; then
        echo "$machoFiles 存在"
    else
        mkdir CoverageResult
        mkdir CoverageResult/MachOFiles
        echo "$machoFiles 不存在，已经创建"
    fi
    
    if [[ -d $profrawFiles ]]; then
        echo "$profrawFiles 存在"
    else
        mkdir $profrawFiles
        echo "$profrawFiles 不存在，已经创建"
    fi
}

function copyIpaAndShellFile {
    echo "ipa_path: $CODESIGNING_FOLDER_PATH"

    cp -r $CODESIGNING_FOLDER_PATH $machoFiles

    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    cp -r  ${scripts}/parse_profraw.sh $resulePath
    mkdir CoverageResult

    echo "macho_copy end"
}

main
