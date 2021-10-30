# 获取当前脚本的绝对路径
scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 插入代码覆盖率需要Xcode BuildSettings 的指令
#sh ${scripts}/hd_buildsetting_env.sh $PROJECT_FILE_PATH

# 执行相关拷贝操作：拷贝代码覆盖率需要的MachO文件及llvm聚合脚本到项目的根目录/CoverResult 中
sh ${scripts}/hd_macho_copy.sh
