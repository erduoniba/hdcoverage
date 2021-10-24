function pushTagAndPodTrunk {
	git tag -m $1 $2
	git push orgin $2

	pod trunk push HDCoverage.podspec --allow-warnings
}

function main {
	echo "git commit msg: $1, tag: $2"
	git add .
	git commit -m $1
	git push orgin master

	if [ $? -eq 0 ]; then
		pushTagAndPodTrunk $1 $2
	else
		pushTagAndPodTrunk $1 $2
	fi

}

main $1 $2