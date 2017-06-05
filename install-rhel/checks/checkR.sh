#!/bin/bash

# ******************************************************************************
# This script checks for and reports missing items in the context of R
#
# Checks for exactly version 3.1.2 downloaded and installed
# ******************************************************************************

# # ------------------ helper function -------------------
. ./versionCompare.sh

base="$INSTALL_BASE/transmart-data"
pathForRBin="$base/R/root/bin"

echo "-------------------------------------"
echo "|  Checking for basics and packages required by R;"
echo "|    if anything is reproted as missing, then recheck"
echo "|    the detailed instructions to installing the missing items"
echo "-------------------------------------"

echo "Checking for R bin on path"
pathToExecutable=$(which R)
if [ -x "$pathToExecutable" ] ; then
    echo "It's here: $pathToExecutable"
else
    echo "Warning: R not on path; setting PATH temporarily to perform checks."
    echo "Add to PATH: $pathForRBin"
    export PATH=$pathForRBin:$PATH
    pathToExecutable=$(which R)
    if [ -x "$pathToExecutable" ] ; then
        echo "It's here: $pathToExecutable"
    else
        echo "The R command is not reachable"
        echo "Check details of install step for installing R"
        echo "Checking can not continue."
        echo 1
    fi
fi

# check R version, exactly 3.1.2
desiredRVersion="3.1.2"
RVersion=$(R --version | awk -F '^R version ' '{print $2}')
reportCheckExact "R" $desiredRVersion $RVersion
returnFlag=$?
if [ returnFlag = 1 ]; then
    echo "R version problems; aborting check of R and Rpackages"
    exit 1
fi

R --vanilla --slave < probeRserve.R > /dev/null
results=$?

if (( ! $results )); then
    echo "OK; Rserve and the other packages required appear to be available"
else
    echo "One or more required package is missing from R;"
    echo "  see probeRserve.R for a method of checking the details."
fi 

exit $results
