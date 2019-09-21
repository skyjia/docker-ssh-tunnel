#!/usr/bin/env sh

if [ "$SSH_HOST" = "" ]; then
    echo "Please set host via \`-e \"SSH_HOST=<remote host>\"\`"
    exit 1
fi

if [ "$*" = "" ]; then
    echo "Please specify tunnel options and other options via args, eg:"
    echo
    echo "  # docker run skyjia/ssh-tunnel -R 1234:172.17.0.1:4321"
    echo
    exit 1
fi

ssh -p $SSH_PORT -i $SSH_ID_FILE -gnNT -o "StrictHostKeyChecking=false" -o GatewayPorts=true $* $SSH_USER@$SSH_HOST