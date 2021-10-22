echo "macho_copy begin"

machoFiles=HDCoverageResult/MachOFiles
if [[ -d $machoFiles ]]; then
	echo "$machoFiles 存在"
else
	mkdir $machoFiles
	echo "$machoFiles 不存在，已经创建"
fi

echo "ipa_path: $CODESIGNING_FOLDER_PATH"

cp -r $CODESIGNING_FOLDER_PATH $machoFiles

echo "macho_copy end"