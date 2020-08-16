# raspi-speed-test
Automated internet speed test for Raspberry PI

# Foreword
Adapted from https://pimylifeup.com/raspberry-pi-internet-speed-monitor/ 

# Before You Start
## Requirements
- raspberry pi or comparable nix based system
  - Tested on raspbian
  - Some adaptations may be necessary for this to work with other nix distros

## Dependencies
  The following are Installed via `install.sh`:
- python3
- speedtest-cli
- python3-pip

# Installation
- You can clone the entire repository and run `./install.sh` yourself --OR--
- Use wget to fetch and execute the install script for you
    - `$ bash <(wget -qO - https://raw.githubusercontent.com/designbystephen/raspi-speed-test/master/install.sh)>`
    - You will be prompted before the script begins
    - Replace wget with suitable curl command

## Location
`~/local/raspi-speed-test`

# Reports
`~/local/raspi-speed-test/reports`

## Initial Test Report
`~/local/raspi-speed-test/reports/initial-speedtest.txt`

## CSV Report
`~/local/raspi-speed-test/reports/speedtest.csv`

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
08/16/20,10:58,50.789,11.54,7.98
```


# Speedtest Configuration
- Script is scheduled to run every `8 hours`
- Speedtest timeout is set to `30 seconds`
- Speedtest report will use `-1` values to indicate timeout and other network / script failures
