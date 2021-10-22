# https://llvm.org/docs/CommandGuide/llvm-cov.html#llvm-cov-show

result=./result
if [[ -d $result ]]; then
	echo "$result 存在"
else
	mkdir $result
	echo "$result 不存在，已经创建"
fi

xcrun llvm-profdata merge -sparse $2.profraw -o $2.profdata

if [ $? -eq 0 ]; then
	xcrun llvm-cov show ./$1 -instr-profile=$2.profdata -use-color -format=html -output-dir result/$1
	open result/$1/index.html
else
	echo "llvm-cov faild"
fi
