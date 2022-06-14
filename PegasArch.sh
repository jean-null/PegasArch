#!/bin/bash
pegasarch="$(readlink -f "$0")"
pegasarch_path="$(dirname "$pegasarch")"
source $pegasarch_path/init/pegasarch.bash


menu="$1"

if [[ $menu == launch ]] ; then
  shift
  pegasarch_launch "$@"
  exit $?
fi


if [[ $menu == scrap ]] ; then
  shift
  pegasarch_scrap "$@"
  exit $?
fi


if [[ $menu == refresh ]] ; then
  shift
  pegasarch_cloud
  pegasarch_scrap
  exit $?
fi


if [[ $menu == pegasus ]] ; then
  shift
  flatpak run org.pegasus_frontend.Pegasus &
  exit $?
fi


if [[ $menu == cloud ]] ; then
  pegasarch_cloud
  exit $?
fi


if [[ $menu == cloudsave ]] ; then
  sync_save
  exit $?
fi


if [[ $menu == install ]] ; then
  shift
  $pegasarch_path/init/install.sh "$@"
  exit $?
fi

if [[ $menu == update ]] ; then
  shift
  $pegasarch_path/init/update.sh "$@"
  exit $?
fi
