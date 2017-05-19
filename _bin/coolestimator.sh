#!/bin/bash
set -e
LOGFILE=/opt/development/coolestimator/_logs/gunicorn.log
LOGDIR=$(dirname $LOGFILE)
NUM_WORKERS=2
USER=root
GROUP=root
cd /opt/development/coolestimator/coolestimator
source ../env/bin/activate
test -d $LOGDIR || mkdir -p $LOGDIR
exec gunicorn portal.wsgi:application -b unix:/tmp/coolestimator.sock -w $NUM_WORKERS -u $USER -g $GROUP --log-file=$LOGFILE
