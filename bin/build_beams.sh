#!/bin/sh

WDIR="$PWD/`dirname $0`/.."
REBAR=$WDIR/bin/rebar

fWelcome() {                                                                                                                                                                                                                                                                                                                              [0/1842]
    clear
    echo "======================================================="
    echo " _  _  _ _     _ _____    _    _______ _       _______ "
    echo "| || || | |   | (_____)  | |  (_______) |     (_______)"
    echo "| || || | |__ | |  _      \ \  _      | |      _____   "
    echo "| ||_|| |  __)| | | |      \ \| |     | |     |  ___)  "
    echo "| |___| | |   | |_| |_ _____) ) |_____| |_____| |_____ "
    echo " \______|_|   |_(_____|______/ \______)_______)_______)"
    echo " - - - Signaling the start of next generation telephony"
    echo "======================================================="
    echo
}

fExportLibs() {
    echo "# export ERL_LIBS=${WDIR}/lib/"
    export ERL_LIBS=${WDIR}/lib/
}

fCompileUtils() {
    echo "======================================================="
    echo "  Compiling Utilities"
    echo "======================================================="
    echo "# cd ${WDIR}/utils/diagnostics; ${REBAR} clean compile"

    cd ${WDIR}/utils/diagnostics; ${REBAR} clean compile
    echo
}


fCompileWhistleLibs() {
    echo "======================================================="
    echo "  Compiling Whistle Libraries"
    echo "======================================================="

    for WLIB in ${WDIR}/lib/whistle*
    do
        echo "# cd ${WLIB}; ${REBAR} clean compile"
        cd ${WLIB}; ${REBAR} clean compile
        echo
    done
}

fCompileEcallmgr() {
    echo "======================================================="
    echo "  Compiling Erlang Call Manager"
    echo "======================================================="
    echo "# cd ${WDIR}/ecallmgr; ${REBAR} clean compile"

    cd ${WDIR}/ecallmgr; ${REBAR} clean compile
    echo
}

fCompileWhApps() {
    echo "======================================================="
    echo "  Compiling WhApps"
    echo "======================================================="
    echo "# cd ${WDIR}/applications; ${REBAR} clean compile"

    cd ${WDIR}/applications; ${REBAR} clean compile
    echo
}

fWelcome

fExportLibs

fCompileUtils
fCompileWhistleLibs
fCompileEcallmgr
fCompileWhApps

cd `readlink -f $0` # realpath

exit 0
