#!/bin/bash

##############
# Cron Job for ROOT
# 10 * * * * /PATH TO DATA/graphs/cron.sh 2>&1
##############

abspath=$(cd ${0%/*} && echo $PWD/)

cd $abspath

./universal_report.sh network
./universal_report.sh cpu
./universal_report.sh load
./universal_report.sh memory
./universal_report.sh io
./universal_report.sh swap


# Clean up the old reports
find ./reports/ -mtime +30 -exec rm -rf {} \;
