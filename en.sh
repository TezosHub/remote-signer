#!/bin/bash
/opt/cloudhsm/bin/key_mgmt_util<<!
loginHSM -u CU -p $2 -s $1
aesWrapUnwrap -m 0 -f keys -w $3 -out keys.json
exit
!