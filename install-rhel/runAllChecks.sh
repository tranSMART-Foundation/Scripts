#!/bin/bash
cd $HOME/Scripts/install-ubuntu/checks/
./checkAll.sh 2>&1 2>&1 | tee ~/checks.log