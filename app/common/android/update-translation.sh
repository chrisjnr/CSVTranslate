#!/usr/bin/env bash
######################################################
##### iOS & Android localisation files generator #####
######################################################

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
echo "============================BEGIN=============================="
if which Babelish > /dev/null; then

	echo "Android Strings updating"
	babelish csv2android

  cd ../.. || exit
  pwd
  RESOURCES_DIR="$(pwd)/src/main/res"

	echo "Copying values-en strings to default values directory"
	cp -v "$RESOURCES_DIR/values-en/strings.xml" "$RESOURCES_DIR/values/"

	echo "Removing values-en folder"
	rm -rf "$RESOURCES_DIR/values-en/strings.xml"

#    This is a workaround to fix this issue:
#    https://github.com/netbe/Babelish/pull/88
    echo "Escaping single quote character"
    find $RESOURCES_DIR -name 'strings.xml' -exec sed -i ''  "s/'/\\\'/g" {} \;
else
    echo "warning: Babelish not installed, download from https://github.com/netbe/Babelish"
fi
echo "=============================END==============================="