NOTE: this is an experimental development - an attempt to generalize the
scripts by using a configuration file. This development branch has been pushed 
to 'back burner' status.

Use these steps to install transmart on a "clean" ubuntu system (assumes 14.04). For
details see the instructions at
https://wiki.transmartfoundation.org/display/transmartwiki/Install+the+current+official+release

    sudo apt-get update
    sudo apt-get install -y git
    git clone https://github.com/tranSMART-Foundation/Scripts.git
    Scripts/install-ubuntu/InstallTransmart.sh 2>&1 | tee install.log
    cd Scripts/install-ubuntu/checks/
    ./checkAll.sh 2>&1 2>&1 | tee ~/checks.log

