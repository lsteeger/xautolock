#!/bin/bash

set -ux

declare -- rc=0

source make_install.inc

make -e "${@}" clean
rc=${?}

exit ${rc}
