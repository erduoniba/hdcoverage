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
    generateMergeOFiles=$machoFiles/GenerateMergeOFiles
    
    judgeResultFolder
    copyIpaAndShellFile
    generateMergeO
    
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
    
    mkdir -p $generateMergeOFiles
}

function copyIpaAndShellFile {
#    hecho "ipa_path: $CODESIGNING_FOLDER_PATH"
#    cp -r $CODESIGNING_FOLDER_PATH $machoFiles

    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    parseProfrawPath="$resulePath/hd_parse_profraw.sh"
    parseProfrawGatherPath="$resulePath/hd_parse_profraw_gather.sh"
    
    cp -r ${scripts}/hd_parse_profraw.sh $resulePath
    cp -r ${scripts}/hd_parse_profraw_gather.sh $resulePath
    cp -r ${scripts}/GitdiffUtils $resulePath

    hecho "macho_copy end"
}

function read_dir {
    for file in `ls $1`
    do
        hecho "read_dir file $file"
        # 如果是文件夹，则继续遍历
        if [ -d $1"/"$file ]
        then
            read_dir $1"/"$file
        else
            filePath=$1"/"$file
            hecho "read_dir filePath $filePath"
            # 判断后缀是.m或者.swift文件
            if [[ "${filePath##*.}"x = "o"x ]]; then
                hecho "macho_filePath $filePath generateMergeOFiles: $generateMergeOFiles"
                cp -r $filePath $generateMergeOFiles
            fi
        fi
    done
}

function generateMergeO {
    # 将编译插桩后的目标文件generateMergeOFiles目录
    read_dir $PROJECT_TEMP_ROOT
    # https://stackoverflow.com/questions/66245096/xcrun-llvm-cov-show-no-coverage-data-found
    # 将多个目标文件手动链接然后生成组合目标文件
    ld -r -o $machoFiles/$PROJECT.o $generateMergeOFiles/*.o
}

main
