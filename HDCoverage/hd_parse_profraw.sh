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
        # 获取文件后缀名，兼容多个点号
        format=${file##*.}
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
        
        # 目标文件转移脚本，用于其他设备生成代码覆盖率
        # https://releases.llvm.org/9.0.0/docs/CommandGuide/llvm-cov.html#llvm-cov-show
        # https://juejin.cn/post/6996596951969955853
        # xcrun llvm-cov show $machOFiles/$1.o -instr-profile=$profraws/$1.profdata -use-color -format=html -output-dir -path-equivalence=/Users/denglibing/HDProject/JDSpace/CodeProject/pgIntroductionModule/pgIntroductionModule/,/Users/denglibing/Desktop/Coverage0408/pgIntroductionModule/ $result/$1
    else
        echo "llvm-cov faild"
    fi
}

main
