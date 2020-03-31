#!/bin/bash

git stash
git pull origin master --tags
git stash pop

VersionString=`grep -E 's.version.*=' __ProjectName___Extension.podspec`
VersionNumber=`tr -cd 0-9 <<<"$VersionString"`

NewVersionNumber=$(($VersionNumber + 1))
LineNumber=`grep -nE 's.version.*=' __ProjectName___Extension.podspec | cut -d : -f1`
sed -i "" "${LineNumber}s/${VersionNumber}/${NewVersionNumber}/g" __ProjectName___Extension.podspec

echo "current version is ${VersionNumber}, new version is ${NewVersionNumber}"

git add .
git commit -am Extension-${NewVersionNumber}
git tag Extension-${NewVersionNumber}
git push origin master --tags
pod repo push DUSpecs __ProjectName___Extension.podspec --verbose --allow-warnings --use-libraries --use-modular-headers

