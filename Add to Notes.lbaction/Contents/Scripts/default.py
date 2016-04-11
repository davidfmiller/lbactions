#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Create a new note from LaunchBar

@see https://github.com/davidfmiller/apples/blob/master/note
"""

import sys
import os
import getopt
import tempfile
import subprocess


def esc(arg):
  """
  Escapes a string's characters

  @param arg (string)
  @return string
  """


  buf = ''
  for i in arg:
    if (i == '\\'):
      buf += '\\\\'
    elif (i == '\n'):
      buf += '<br/>'
    elif (i == '"'):
      buf += '\\"'
    elif (i == ' '):
      buf += '&nbsp;'
    elif (i == '>'):
      buf += '&gt;'
    elif (i == '<'):
      buf += '&lt;'
    else:
      buf += i

  return buf


if __name__ != '__main__':
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

try:
  opts, args = getopt.getopt(sys.argv[1:], 'v')
except getopt.GetoptError:
  sys.stderr.write("🚫  Incorrect usage\n")
  sys.exit(2)

if not args:
  args = []

body = ''
verbose = False

for opt, arg in opts:
  if opt == '-v':
    verbose = True

cmd = ''

if len(sys.argv) < 2:
  sys.stderr.write("🚫  Nothing to make note of\n")
  sys.exit(2)

body = sys.argv[1]

cmd += " set r to make new note at folder \"Notes\" with properties { name: \"LaunchBar Note\", body:\"" + esc(body) + "\" }\n"

cmd = "tell application \"Notes\"\n" + cmd + "end tell\n"
f = tempfile.NamedTemporaryFile(delete=False)
f.write(cmd)

if verbose:
  f.seek(0)
  sys.stdout.write("🍎")
  sys.stdout.write("  " + f.read().replace("\n", "\n   ").rstrip() + "\n")

f.close()

out,err = subprocess.Popen(["osascript", f.name], stdout=subprocess.PIPE).communicate()


