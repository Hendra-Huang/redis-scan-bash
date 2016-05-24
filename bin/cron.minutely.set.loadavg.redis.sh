#!/bin/bash
minute=`date +%M`
while [ `date +%M` -eq $minute ]
do
  redis-cli setex 'scan:loadavg' 90 `cat /proc/loadavg | cut -d'.' -f1 | grep [0-9]` | grep -v OK
  sleep 13
done
