#!/bin/bash

# start a shell
/bin/bash && vi ./tmp.sh

# start up supervisord, all daemons should launched by supervisord.
/usr/bin/supervisord -c /etc/supervisord.conf

#bash -c /usr/bin/startxfce4
