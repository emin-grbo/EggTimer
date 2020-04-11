#!/bin/sh
#
# IncrementBuildVersion
# v1.0.0
#
# Created by Andrew Benson (db@nuclearcyborg.com)
# Copyright (C) 2017-2018 Nuclear Cyborg Corp

oldBuild=$(/usr/libexec/PListBuddy -c "Print CFBundleVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}")
shortVersion=$(/usr/libexec/PListBuddy -c "Print CFBundleShortVersionString" "${PROJECT_DIR}/${INFOPLIST_FILE}")

tmp="`echo $oldBuild | tr -d -c '.'`"
if [ "${tmp}"x = "x" ]; then
	dotCount=0
else
	dotCount="`echo $tmp | awk '{ print length }'`"
fi

echo "Old Build ->>$oldBuild<<-"
echo "Short Version ->>$shortVersion<<-"

if [ $dotCount -eq 0 ]; then
	minorVersion=$oldBuild
else
	baseBuild="`echo $oldBuild | cut -f 1-$dotCount -d .`"
	minorVersion="`echo $oldBuild | awk -F. '{print $NF}'`"
fi

if [ "$minorVersion"x = "x" ]; then
	baseBuild="$shortVersion"
	minorVersion="0"
fi
minorVersion=$(($minorVersion + 1))

if [ "$baseBuild"x = "x" ]; then
	newVersion="${minorVersion}"
else
    if [ "$baseBuild" != "$shortVersion" ]; then
        minorVersion=1
    fi
	newVersion="${shortVersion}.${minorVersion}"
fi

echo "New build number/version: $newVersion"
/usr/libexec/PListBuddy -c "Set CFBundleVersion $newVersion" "${PROJECT_DIR}/${INFOPLIST_FILE}" && exit 0

exit 1
