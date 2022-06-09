# https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-show

function main {
    gitCommitid1=$1
    gitCommitid2=$2
    scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    result=$scripts/Results
    machOFiles=$scripts/MachOFiles
    profraws=$scripts/Profraw
    # git diff 结果目录
    gitDiffs=$scripts/Gitdiffs
    # 解析git diff的ruby工具类目录
    gitdiffUtils=$scripts/GitdiffUtils
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
    machOFilePath=$(find $machOFiles -name "$1.o")
    echo "findMachOFilePath: $machOFilePath"

    disposeProfrawToHtmlByGenhtml $1 $machOFilePath
}

function disposeProfrawToHtmlByGenhtml {
    echo "===================================\n"
    echo "disposeProfrawToHtmlByGenhtml, machoFileName: $1 machOFilePath: $2"
    # profraw to profdata
    xcrun llvm-profdata merge -sparse $profraws/$1.profraw -o $profraws/$1.profdata

    if [ $? -eq 0 ]; then
        coverage_info=$profraws/$1.info
        # profdata to info
        xcrun llvm-cov export $2 -instr-profile=$profraws/$1.profdata -format=lcov > $coverage_info

        # git diff，修改info文件，得到增量info数据
        disposeGitDiff $gitCommitid1 $gitCommitid2 $coverage_info

        # 通过info 生成覆盖率
        coverage_gather="$1_gather"
        genhtml -o $result/$coverage_gather $profraws/$coverage_gather.info
    else
        echo "llvm-cov faild"
    fi
}

# 解析gitdiff数据
function disposeGitDiff {
    # 生成原始的diff文件
    diff_file=$gitDiffs/$1.diff
    # 这里也可以通过tag来diff
    # git diff tag1 tag2 --unified=0 > $diff_file
    git diff $1 $2 --unified=0 > $diff_file
    echo "diff_file: $diff_file"
    echo "coverage_info_file: $3"
    # 提取可用（json化）的diff文件，根据原始info文件，重新生成增量的info数据
    ruby $gitdiffUtils/diffParser.rb --diff-file=$diff_file --coverage-info-file=$3
}

# 第一、二个参数为git的commitid
main $1 $2
