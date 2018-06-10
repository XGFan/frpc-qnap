#!/bin/sh
CONF=/etc/config/qpkg.conf
QPKG_NAME="frpc"
QPKG_ROOT=`/sbin/getcfg $QPKG_NAME Install_Path -f ${CONF}`

APACHE_ROOT=`/sbin/getcfg SHARE_DEF defVolMP -f /etc/config/def_share.info`
APACHE_WEB=`/sbin/getcfg SHARE_DEF defWeb -d web -f /etc/config/def_share.info`
WEB_PATH=$APACHE_ROOT/$APACHE_WEB
WORK_PATH=$WEB_PATH/$QPKG_NAME
LOG_PATH=$WORK_PATH/$QPKG_NAME.log 
CONF_PATH=$WORK_PATH/$QPKG_NAME.ini 

export QNAP_QPKG=$QPKG_NAME

case "$1" in
  start)
    ENABLED=$(/sbin/getcfg $QPKG_NAME Enable -u -d FALSE -f $CONF)
    if [ "$ENABLED" != "TRUE" ]; then
      echo "$QPKG_NAME is disabled."
      exit 1
    fi
    mkdir -p $WORK_PATH
    if [ -f $CONF_PATH ]; then
	   $QPKG_ROOT/frpc  -c $CONF_PATH > $LOG_PATH 2>&1 &
    else
      echo "$CONF_PATH NOT EXISTS."
      exit 1
    fi
    ;;

  stop)
    killall -9 frpc
    ;;

  restart)
    $0 stop
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}"
    exit 1
esac

exit 0
