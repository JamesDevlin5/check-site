#!/usr/bin/env bash

SUCCESS_CODE="\e[32m"
FAILURE_CODE="\e[31m"
RESET_CODE="\e[0m"

success() {
    echo -e "$SUCCESS_CODE""Success: $1"
}

failure() {
    echo -e "$FAILURE_CODE""Failure: $1"
}

reset() {
    echo -n -e "$RESET_CODE"
}

success "Hello World!"
failure "Hello World!"
reset
echo "Hello World!"
