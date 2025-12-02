#! /usr/bin/python3
# rename.py - Programma che rinomina i file di una cartella usando espressioni
# regolari

import sys, os, re

if len(sys.argv) != 3:
    print('Usage: rename source-regex target-regex')
    print('Refer to the Python re module for the syntax of regular expressions.')
    sys.exit(1)

source = re.compile(sys.argv[1])
target = sys.argv[2]

for name in os.listdir():
    if re.search(source, name):
        new_name = re.sub(source, target, name)
        print(name, '=>', new_name)
        os.rename(name, new_name)
