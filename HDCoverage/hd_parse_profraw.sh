# https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-show

function main {
    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    result=$scripts/Results
    machOFiles=$scripts/MachOFiles
    profraws=$scripts/Profraw
    echo "Results: $result \nmachOFiles: $machOFiles"

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

    disposeProfrawToHtmlByLlvmcov $1 $machOFilePath
}

function disposeProfrawToHtmlByLlvmcov {
    echo "===================================\n"
    echo "disposeProfrawToHtmlByLlvmcov, machoFileName: $1 machOFilePath: $2"
    xcrun llvm-profdata merge -sparse $profraws/$1.profraw -o $profraws/$1.profdata

    if [ $? -eq 0 ]; then
#        xcrun llvm-cov show $2 -instr-profile=$profraws/$1.profdata -use-color -format=html -output-dir $result/$1
        xcrun llvm-cov show $machOFiles/$1.o -instr-profile=$profraws/$1.profdata -use-color -format=html -output-dir $result/$1
    else
        echo "llvm-cov faild"
    fi
}

main
