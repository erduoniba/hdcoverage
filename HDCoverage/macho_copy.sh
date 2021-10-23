echo "==== macho & profdata.sh copy begin ===="

resulePath=$SRCROOT/CoverageResult
machoFiles=$resulePath/MachOFiles
if [[ -d $machoFiles ]]; then
    echo "$machoFiles 存在"
else
    mkdir CoverageResult
    mkdir CoverageResult/MachOFiles
    echo "$machoFiles 不存在，已经创建"
fi

echo "ipa_path: $CODESIGNING_FOLDER_PATH"

cp -r $CODESIGNING_FOLDER_PATH $machoFiles

scripts="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -r  ${scripts}/profdata.sh $resulePath

echo "macho_copy end"
