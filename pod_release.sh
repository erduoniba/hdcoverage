function main {
	echo "git commit msg: $1, tag: $2"
	git add .
	git commit -m $1

	echo "git commit success"
	git tag -m $1 $2
	git push orgin $2

	if [ $? -eq 0 ]; then
		echo "git push tag success"
		pod trunk push HDCoverage.podspec --allow-warnings
	else
		echo "git push tag faild"
	fi
}

main $1 $2