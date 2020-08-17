import os
import re
import subprocess
import time
from pathlib import Path

home = str(Path.home())
appName = 'raspi-speed-test'
outfile = home + '/local/' + appName + '/reports/speedtest.csv'

print('[INFO] Attempting Speedtest')

def get_speedtest_results():
    ping = -1
    download = -1
    upload = -1

    try:
        response = subprocess.Popen(
            '/usr/local/bin/speedtest-cli --simple --timeout 30',
            shell=True,
            stdout=subprocess.PIPE
        )
        results = response.stdout.read().decode('utf-8')

        if int(response.returncode or 0) <= 1:
            print('[SUCCESS] Speedtest successful')
            ping = re.findall('Ping:\s(.*?)\s', results, re.MULTILINE)
            download = re.findall('Download:\s(.*?)\s', results, re.MULTILINE)
            upload = re.findall('Upload:\s(.*?)\s', results, re.MULTILINE)

            ping = ping[0].replace(',', '.')
            download = download[0].replace(',', '.')
            upload = upload[0].replace(',', '.')
        else:
            print('[FAILURE] Speedtest failure')
    except Exception as e:
        print('[FAILURE] Speedtest CLI failure', e)
    finally:
        return ping, download, upload

try:
    print('[INFO] Writing results to csv file')

    f = open(outfile, 'a+')
    if os.stat(outfile).st_size == 0:
        f.write('Date,Time,Ping (ms),Download (Mbit/s),Upload (Mbit/s)\r\n')

    ping, download, upload = get_speedtest_results()

    f.write('{},{},{},{},{}\r\n'.format(time.strftime('%m/%d/%y'), time.strftime('%H:%M'), ping, download, upload))

    print('[SUCCESS] Report written to file ')
except Exception as e:
    print('[FAILURE] Error writting report results to file', e)
finally:
    print('[INFO] Report available @ ', outfile)
