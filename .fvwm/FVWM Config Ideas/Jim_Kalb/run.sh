#!/bin/sh
rxvt +sb -name fvwm-run-dialog -title "run" -geometry 80x1+420+640 --keysym.0xFF0D: " &\n exit\n" -e bash --init-file $FVWM_USERDIR/run-dialog.bash-init
