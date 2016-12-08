#!/bin/bash

service apache2 start

crontab /mycron

while [ true ] ; 
do
/usr/bin/perl /usr/lib/cgi-bin/awstats/awstats.pl -config=linoxide -update
/usr/bin/perl /usr/lib/cgi-bin/awstats/awstats.pl -config=example.com -update
sleep 600
done
