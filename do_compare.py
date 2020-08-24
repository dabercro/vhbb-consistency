#! /usr/bin/env python

import dynamo_consistency.datatypes as dt

mit = dt.get_info('var/cache/T2_US_MIT/remote.pkl')
cern = dt.get_info('var/cache/T2_CH_CERN/remote.pkl')

_ = dt.compare(inventory=cern, listing=mit, output_base='vhbb',
               missing_check=lambda x: not x.endswith('.root'))
