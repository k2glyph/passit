#!/bin/sh
uwsgi \
    --module=passit.wsgi:application \
    --env DJANGO_SETTINGS_MODULE=passit.settings \
    --master --pidfile=/tmp/project-master.pid \
    --https=0.0.0.0:8080,/code/bin/passit.crt,/code/bin/passit.key \
    --processes=8 \
    --harakiri=300 \
    --max-requests=5000 \
    --die-on-term \
    --enable-threads \
    --single-interpreter \
    --post-buffering \
    --buffer-size=83146

