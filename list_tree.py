#! /usr/bin/env python

import sys
import dynamo_consistency.datatypes as dt

tree = dt.get_info(sys.argv[1])

for f in tree.get_files():
    print f
