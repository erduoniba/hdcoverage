#!/bin/bash

function hecho {
    echo "<<== $1"
}

# # # # # # # # # # # # biu_env # # # # # # # # # # # # # # #
# ibiu环境下的工程，无法使用Xcodeproj去修改项目的buildsettings，直接使用 PlistBuddy 去对 pdxproj 进行修改
# 这个在cocoapods或者其他工程都生效，但是语法和维护成本较高
export PATH=$PATH:/usr/libexec

function disposeScheme {
    PRODUCT_BUNDLE_IDENTIFIER=`PlistBuddy -c "Print :objects:$1:buildSettings:PRODUCT_BUNDLE_IDENTIFIER" "$pbxproj"`
        name=`PlistBuddy -c "Print :objects:$1:name" "$pbxproj"`
    swiftCoverageValue="-profile-generate -profile-coverage-mapping"
    ocCoverageValue="-fprofile-instr-generate -fcoverage-mapping"
    ldFlagsCoverageValue="-fprofile-instr-generate"
    PlistBuddy -c "Set :objects:$1:buildSettings:OTHER_SWIFT_FLAGS $coverageValue" "$pbxproj"
    PlistBuddy -c "Set :objects:$1:buildSettings:OTHER_CFLAGS $ocCoverageValue" "$pbxproj"
    PlistBuddy -c "Set :objects:$1:buildSettings:OTHER_LDFLAGS $ldFlagsCoverageValue" "$pbxproj"
}

function disposeTarget {
        buildConfigurationList=`PlistBuddy -c "Print :objects:$1:buildConfigurationList" "$pbxproj"`
    hecho "buildConfigurationLis: $buildConfigurationList"

    schemeList=`PlistBuddy -c "Print :objects:${buildConfigurationList}:buildConfigurations" "$pbxproj" | sed -e '/Array {/d' -e '/}/d' -e 's/^[ \t]*//'`
    schemes=(`echo $schemeList`)

    for schemeID in $(echo ${schemes[*]})
    do
        hecho "schemeID : $schemeID"
        disposeScheme $schemeID
    done
}

function disposePBXcodej {
    # https://www.daimajiaoliu.com/daima/60f6a594e6e6806
    pbxproj=$PROJECT_FILE_PATH/project.pbxproj
    hecho "pbxproj: $pbxproj"
    rootObjectID=$( PlistBuddy -c "Print :rootObject" "$pbxproj" )
    hecho "rootObjectID: ${rootObjectID}"

    targetList=`PlistBuddy -c "Print :objects:${rootObjectID}:targets" "$pbxproj" | sed -e '/Array {/d' -e '/}/d' -e 's/^[ \t]*//'`
    targets=(`echo $targetList`)
    hecho "targets: ${targets[*]}"

    for targetID in $(echo ${targets[*]})
    do
        echo "\n"
        hecho "targetID : $targetID"
        disposeTarget $targetID
    done
}

function biu_env {
    hecho "this is biu env"
    
    disposePBXcodej
}
# # # # # # # # # # # # biu_env # # # # # # # # # # # # # # #


# # # # # # # # # # # # cocoaspods_env # # # # # # # # # # # # # # #
# Xcodeproj去修改项目的buildsettings
function cocoaspods_env {
    hecho "this is cocoaspods env"
    ruby ${scripts}/hd_coverage_buildsettings.rb $1
}
# # # # # # # # # # # # cocoaspods_env # # # # # # # # # # # # # # #

function main {
    echo "\n\n"
    if [ -x "$(command -v biu)" ]; then
        cocoaspods_env $1
    else
        biu_env $1
    fi
    echo "\n\n"
}


main $1
