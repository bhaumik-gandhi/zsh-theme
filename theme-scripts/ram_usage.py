#!/usr/bin/env python
# coding=UTF-8

import math, subprocess, sys

p = subprocess.Popen(["vm_stat"], stdout=subprocess.PIPE)
output = p.communicate()[0]

lines = output.split('\n')

pages_free = 0
pages_used = 0

for line in lines:
    if "Pages" in line:
        arr = line.split(':')
        value = float(arr[1].split('.')[0])
        if "free" in line:
            pages_free = value
        elif "active" in line or "inactive" in line or "speculative" in line:
            pages_used += value



#sys.stdout.write('Pages Used ' + str(pages_used))
# Output

percent = 100 * (pages_used/(pages_free+pages_used))
out = ("%.2f" % percent)
# out = (str(percent) + '%').encode('utf-8')
sys.stdout.write(out)


'''
Mach Virtual Memory Statistics: (page size of 4096 bytes)
Pages free:                               83542.
Pages active:                            371110.
Pages inactive:                          240731.
Pages speculative:                         7053.
Pages throttled:                              0.
Pages wired down:                        229107.
Pages purgeable:                          31460.
"Translation faults":                1615966019.
Pages copy-on-write:                   84209900.
Pages zero filled:                    623745642.
Pages reactivated:                    244719687.
Pages purged:                         116565311.
File-backed pages:                       103234.
Anonymous pages:                         515660.
Pages stored in compressor:             1144231.
Pages occupied by compressor:            116378.
Decompressions:                       202845892.
Compressions:                         236922163.
Pageins:                               82338951.
Pageouts:                               1807209.
Swapins:                               36319997.
Swapouts:                              39863503.
'''
