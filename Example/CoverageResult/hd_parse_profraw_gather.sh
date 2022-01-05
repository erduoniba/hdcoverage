# https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-show

function main {
    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    result=$scripts/CoverageResult
    machOFiles=$scripts/MachOFiles
    profraws=$scripts/Profraw
    echo "CoverageResult: $result \nmachOFiles: $machOFiles"

    judgeResultFolder
    disposeProfrawFiles
    
    open $result
}

function judgeResultFolder {
    if [[ -d $result ]]; then
        echo "$result 存在"
    else
        mkdir $result
        echo "$result 不存在，已经创建"
    fi
}

function disposeProfrawFiles() {
    echo "disposeProfrawFiles profraws: $profraws"
    # 获取当前路径下的文件
    files=$(ls $profraws)
    for file in $files; do
        echo "disposeProfrawFiles profraw file: $file"
        format=${file#*.}
        if [[ "$format" = "profraw" ]]; then
            # 截取 .后缀名 获取得到文件名
            fileName=${file%.profraw}
            findMachOFile $fileName
        fi
    done
}

function findMachOFile {
    echo "===================================\n"
    echo "findMachOFileName: $1"
    machOFilePath=$(find $machOFiles -name $1)
    echo "findMachOFilePath: $machOFilePath"

    disposeProfrawToHtmlByGenhtml $1 $machOFilePath
}

function disposeProfrawToHtmlByGenhtml {
    echo "===================================\n"
    echo "disposeProfrawToHtmlByGenhtml, machoFileName: $1 machOFilePath: $2"
    # profraw to profdata
    xcrun llvm-profdata merge -sparse $profraws/$1.profraw -o $profraws/$1.profdata

    if [ $? -eq 0 ]; then
        # profdata to info
        xcrun llvm-cov export $2 -instr-profile=$profraws/$1.profdata -format=lcov > $profraws/$1.info

        # 通过info 生成覆盖率
        coverageGather="$1_gather"
        genhtml -o $result/$coverageGather $profraws/$1.info
    else
        echo "llvm-cov faild"
    fi
}

main
