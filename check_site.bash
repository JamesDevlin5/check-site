#!/usr/bin/env bash

SUCCESS_CODE="\e[32m"
FAILURE_CODE="\e[31m"
RESET_CODE="\e[0m"

NUM_ATTEMPTS=3

success() {
    echo -e "$SUCCESS_CODE""Success: $1"
}

failure() {
    echo -e "$FAILURE_CODE""Failure: $1"
}

reset() {
    echo -n -e "$RESET_CODE"
}

check_site() {
    ping -c $NUM_ATTEMPTS "$1" > /dev/null
    return $?
}

success "Hello World!"
failure "Hello World!"
if check_site 8.8.8.8
then
    success "Ping worked!"
else
    failure "Ping failed!"
fi
reset
