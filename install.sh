#!/bin/bash
# Install necessary files for raspi-speed-test

TOTAL_STEPS=5
INSTALL_SCRIPT_URL=https://raw.githubusercontent.com/designbystephen/raspi-net-speed/master/install.sh
REPOSITORY_URL=https://github.com/designbystephen/raspi-net-speed
REPOSITORY=https://github.com/designbystephen/raspi-net-speed.git
REPO_SHORTHAND=raspi-speed-test
INSTALL_LOCATION=$HOME/bin/$REPO_SHORTHAND

start_step()
{
    STEP=$1
    MSG=$2
    echo "[$STEP of $TOTAL_STEPS] - $MSG..."
}

stop_step()
{
    STEP=$1
    start_step $STEP COMPLETE
    echo ""
}

# pre launch
echo "Preparing '$REPO_SHORTHAND' installation..."
echo "Application files will be installed at $INSTALL_LOCATION"
echo "More information can be found at https://github.com/designbystephen/raspi-net-speed"
echo "Users are encouraged to read the install script at https://raw.githubusercontent.com/designbystephen/raspi-net-speed/master/install.sh before proceeding"
cat << EOF 
MIT License

Copyright (c) 2020 Stephen Roth

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

EOF

echo "Press any key to continue"
read -n 1 -s

# step 1
start_step 1 "Validating permissions"
if [ $EUID -ne 0 ]; then
    echo "FAILURE: $0 is not running as root. Please rerun the install using sudo."
    exit 2
fi
stop_step 1

# step 2
start_step 2 "Updating system packages"
sudo apt-get update
sudo apt-get upgrade
stop_step 2

# step 3 
start_step 3 "Checking out application source files"
git clone $REPOSITORY $HOME/bin/$REPO_SHORTHAND
echo "Application stored @ $INSTALL_LOCATION"
stop_step 3

# step 4
start_step 4 "Fetching application dependencies"
sudo apt-get install python3-pip
sudo pip3 install speedtest-cli
stop_step 4

# step 5
start_step 5 "Validiating Speedtest command"
speedtest-cli --simple > $INSTALL_LOCATION/test-result.txt
stop_step 5
