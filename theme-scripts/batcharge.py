#!/usr/bin/env python
# coding=UTF-8

import math, subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())

charge = b_cur / b_max

#charge_threshold = int(math.ceil(10 * charge))

# Output

#total_slots, slots = 10, []
#filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
#empty = (total_slots - len(filled)) * u'▹'

percent = 100 * charge
out = ("%.2f" % percent);
out = out.encode('utf-8')
import sys
sys.stdout.write(out)
