#!/usr/bin/env python
# -*- coding: utf-8 -

# Python script to retrieve item corresponding to the 'newest' file 
#
# https://github.com/davidfmiller/lbactions


import os
import glob
import json
import sys
import pwd

# get user's home folder
home = pwd.getpwuid( os.getuid())[5]

# add search paths here
dirs = [
  os.path.join(home, 'Desktop'),
  os.path.join(home, 'Downloads')
]

newest = None

for i in dirs:

  f = max(glob.iglob(i + '/*.*'), key=os.path.getctime)
  if not f:
    continue

  if not newest or os.path.getctime(f) > os.path.getctime(newest):
    newest = f

if not newest:
  sys.stderr.write('🚫  No file')
  sys.exit(2)

print json.dumps({ 'path' : newest })