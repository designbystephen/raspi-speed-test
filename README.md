# raspi-speed-test <!-- omit in toc -->
Automated internet speed test for Raspberry PI

- [Foreword](#foreword)
- [Before You Start](#before-you-start)
  - [Requirements](#requirements)
  - [Dependencies](#dependencies)
- [Installation](#installation)
  - [Install Location](#install-location)
- [Reports](#reports)
  - [Initial Test Report](#initial-test-report)
  - [CSV Report](#csv-report)
- [Speedtest Configuration](#speedtest-configuration)
  - [Speedtest Schedule](#speedtest-schedule)

# Foreword
Adapted from https://pimylifeup.com/raspberry-pi-internet-speed-monitor/

# Before You Start
## Requirements
- raspberry pi or comparable nix based system
- Tested on raspbian
- **NOTE: Some adaptations may be necessary for this to work with other nix distros**

## Dependencies
  The following are Installed via `install.sh`:
- git
- python3
- speedtest-cli
- python3-pip

# Installation
- You can clone the entire repository and run `./install.sh` yourself --OR--
- Use wget to fetch and execute the install script for you
    - `$ bash <(wget -qO - https://raw.githubusercontent.com/designbystephen/raspi-speed-test/master/install.sh)>`
    - You will be prompted before the script begins
    - Replace wget with suitable curl command

## Install Location
- This application is installed here: `~/local/raspi-speed-test`

# Reports
- All reports can be found here: `~/local/raspi-speed-test/reports`

## Initial Test Report
- The initial report can be found here: `~/local/raspi-speed-test/reports/initial-speedtest.txt`
- To view in command line `$ cat ~/local/raspi-speed-test/reports/initial-speedtest.txt`

## CSV Report
- CSV report can be found here: `~/local/raspi-speed-test/reports/speedtest.csv`
- To view in command line `$ cat ~/local/raspi-speed-test/reports/speedtest.csv`

```
Date,Time,Ping (ms),Download (Mbit/s),Upload (Mbit/s)
08/16/20,09:17,44.484,11.52,7.76
08/16/20,09:18,47.152,11.45,8.43
08/16/20,09:53,61.788,11.41,7.52
08/16/20,10:20,49.96,9.12,5.61
08/16/20,10:24,57.271,11.65,6.72
08/16/20,10:28,56.885,11.62,8.31
08/16/20,10:33,51.194,11.55,8.03
08/16/20,10:35,41.463,11.54,6.48
08/16/20,10:58,-1,-1,-1
```

# Speedtest Configuration
- Speedtest timeout is set to `30 seconds`
- Speedtest report will use `-1` values to indicate timeout and other network / script failures

## Speedtest Schedule
- During installation the Speedtest script will be scheduled to run every **8 hours**
- You can change this at a later time by using `crontab -e` and replacing `*/h` to the desired hourly schedule in the example below
 
```
# Run speedtest every h hours, replace */h with desired hourly schedule
# 0 */h * * * sh /home/pi/local/raspi-speed-test/speedtest.sh

```
