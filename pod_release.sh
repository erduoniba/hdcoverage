function main {
	echo "git commit msg: $1, tag: $2"
	git add .
	git commit -m $1
	git push orgin master

	echo "git commit success"
	git tag -m $1 $2
	git push orgin $2

	pod trunk push HDCoverage.podspec --allow-warnings
}

main $1 $2