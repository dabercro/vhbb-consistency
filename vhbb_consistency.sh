#! /bin/bash

dest=${1:?}

consistency-dump-tree --site=T2_US_MIT --remote --info --v1
consistency-dump-tree --site=T2_CH_CERN --remote --info --v1

./do_compare.py

./list_tree.py var/cache/T2_US_MIT/remote.pkl | xargs -n1 dirname | xargs -n1 dirname | sort -u > vhbb_mit_dirs.txt
cat vhbb_orphan.txt | xargs -n1 dirname | xargs -n1 dirname | sort -u > vhbb_orphan_dirs.txt

cp -v vhbb_*.txt $dest
