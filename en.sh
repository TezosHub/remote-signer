#!/bin/bash
/opt/cloudhsm/bin/key_mgmt_util<<!
loginHSM -u CU -p $2 -s $1
aesWrapUnwrap -f keys.json -w $3 -m 1 -out keys
exit
!
rm keys.json