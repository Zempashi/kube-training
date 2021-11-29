#! /bin/sh

set -e

PWD_UID=$(stat . --printf="%u")

if [ "${PWD_UID}" -ne "0" ]; then
  getent passwd ${PWD_UID} || useradd -u ${PWD_UID} builder
  exec sudo -HEu builder -- "$@"
else
  $@
fi
