#!/bin/bash

set -ux

declare -- rc=0

source make_install.inc

xmkmf
rc=${?}

if (( rc == 0 )); then
  make -e "${@}"
  rc=${?}

  if (( rc == 0 )); then
    make -e "${@}" install
    rc=${?}

    if (( rc == 0 )); then
      make -e "${@}" install.man
      rc=${?}
    fi
  fi
fi

exit ${rc}
