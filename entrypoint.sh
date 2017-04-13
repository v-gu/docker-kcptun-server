#!/usr/bin/env bash
set -e

# ====== Internal Variables ======
KCPTUN_CONF="server-config.json"
# ====== Internal Variables ======

# ====== Generate KCPTUN config ======
cat > ${KCPTUN_CONF}<<-EOF
{
    "listen": "${KCPTUN_SERVER_LISTEN_ADDR}:${KCPTUN_SERVER_LISTEN_PORT}",
    "target": "${KCPTUN_SERVER_TARGET_ADDR}:${KCPTUN_SERVER_TARGET_PORT}",
    "key": "${KCPTUN_KEY}",
    "crypt": "${KCPTUN_CRYPT}",
    "mode": "${KCPTUN_MODE}",
    "conn": ${KCPTUN_CONN},
    "autoexpire": ${KCPTUN_AUTO_EXPIRE},
    "mtu": ${KCPTUN_MTU},
    "sndwnd": ${KCPTUN_SNDWND},
    "rcvwnd": ${KCPTUN_RCVWND},
    "datashard": ${KCPTUN_DATASHARD},
    "parityshard": ${KCPTUN_PARITYSHARD},
    "dscp": ${KCPTUN_DSCP},
    "nocomp": ${KCPTUN_NOCOMP},
    "log": "${KCPTUN_LOG}"
}
EOF
# ====== Generate KCPTUN config ======


echo "Starting Kcptun server ..."
./server_linux_amd64 -v
echo "+---------------------------------------------------------+"
echo "KCP Listen     : ${KCPTUN_LISTEN_ADDR}:${KCPTUN_LISTEN_PORT}"
echo "KCP Parameter: --crypt ${KCPTUN_CRYPT} --key ${KCPTUN_KEY} --mtu ${KCPTUN_MTU} --sndwnd ${KCPTUN_SNDWND} --rcvwnd ${KCPTUN_RCVWND} --mode ${KCPTUN_MODE} --nocomp ${KCPTUN_NOCOMP} --dscp ${KCPTUN_DSCP}"
echo "+---------------------------------------------------------+"
exec "./server_linux_amd64" -c ${KCPTUN_CONF}
