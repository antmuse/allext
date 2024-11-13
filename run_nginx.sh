#!/bin/bash

CMDDIR=`pwd`
RUNDIR="/home/antmuse/all/app/nginx"

function Config(){
    echo "Dir = ${RUNDIR}"
    ./configure --with-debug \
        --with-stream \
        --with-file-aio \
        --with-http_v2_module \
        --with-http_v3_module \
        --with-http_ssl_module \
        --with-mail_ssl_module \
        --with-stream_ssl_module \
        --with-http_mp4_module \
        --with-http_dav_module \
        --prefix=${RUNDIR} \
        --sbin-path=${RUNDIR} \
        --modules-path=${RUNDIR}/modules \
        --conf-path=${RUNDIR}/conf/nginx.conf \
        --error-log-path=${RUNDIR}/tmp/error.log \
        --http-log-path=${RUNDIR}/tmp/access.log \
        --pid-path=${RUNDIR}/tmp/ngx.pid \
        --http-client-body-temp-path=${RUNDIR}/tmp/client-body \
        --http-proxy-temp-path=${RUNDIR}/tmp/proxy \
        --http-fastcgi-temp-path=${RUNDIR}/tmp/fastcgi \
        --http-uwsgi-temp-path=${RUNDIR}/tmp/uwsgi \
        --http-scgi-temp-path=${RUNDIR}/tmp/scgi \
        --add-dynamic-module=${CMDDIR}/../nginx-dav-ext-module-3.0.0


    # --with-openssl=${RUNDIR}/../openssl-OpenSSL_1_1_1l \
    # --add-dynamic-module=${RUNDIR}/addon \
    # --add-dynamic-module=${RUNDIR}/../nginx-http-flv-module \
    # --add-dynamic-module=${RUNDIR}/../redis2-nginx-module \
    # --add-dynamic-module=${RUNDIR}/../nginx-http-flv-module \
}


function Debug(){
    echo "Dir = ${RUNDIR}"
    gdb -tui --args ${RUNDIR}/nginx -c ${RUNDIR}/conf/nginx.conf
}


function main(){
    local cmd=${1}
    echo "Dir = ${RUNDIR}"
    echo "cmd = ${cmd}"
    case "${cmd}" in
        "config")
            Config
            ;;
        "debug")
            Debug
            ;;
        "help")
            echo "config"
            echo "debug"
            ;;
        "start")
            ${RUNDIR}/nginx -c ${RUNDIR}/conf/nginx.conf
            ;;
        "stop")
            ${RUNDIR}/nginx -s stop
            ;;
        *)
            echo "unnkown cmd"
            ;;
    esac
}


main $@
