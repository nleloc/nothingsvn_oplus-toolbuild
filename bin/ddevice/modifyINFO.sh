#!/bin/bash
# SPDX-License-Identifier: GPL-3.0

baserom="$1"
work_dir=$(pwd)
source $work_dir/functions.sh

NOTHING_VERSION=$(cat $work_dir/Version)
DEFAULT_VALUE=$(get_prop ro.build.version.oplusrom.display)
BRAND=$(cat $work_dir/bin/ddevice/brand_os.txt)
ANDROID_VER=$(cat $work_dir/bin/ddevice/androidver.txt)

# Try to change information for A16 too
if [[ $BRAND != "RealmeUI" ]]; then
  change_prop ro.build.version.oplusrom.display "$DEFAULT_VALUE | $NOTHING_VERSION"
else
  DEFAULT_VALUE_RM=$(get_prop ro.build.version.realmeui)
  change_prop ro.build.version.oplusrom.display "$DEFAULT_VALUE_RM | $NOTHING_VERSION"
fi