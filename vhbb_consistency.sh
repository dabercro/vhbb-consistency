#! /bin/bash

consistency-dump-tree --site=T2_US_MIT --remote --info --v1
consistency-dump-tree --site=T2_CH_CERN --remote --info --v1

./do_compare.py
