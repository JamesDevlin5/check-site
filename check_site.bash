#!/usr/bin/env bash

# The color code indicating success
SUCCESS_CODE="\e[32m"
# The color code indicating failure
FAILURE_CODE="\e[31m"
# The reset code
RESET_CODE="\e[0m"

# The number of attempts to reach a server before aborting
NUM_ATTEMPTS=3

# Prints a message indicating success, along with accompanying text
# Argument: The message following the indication of success
# The argument will be colored along with the message
success() {
    echo -e "$SUCCESS_CODE""Success: $1"
}

# Prints a message indicating failure, along with accompanying text
# Argument: The message following the indication of failure
# The argument will be colored along with the message
failure() {
    echo -e "$FAILURE_CODE""Failure: $1"
}

# Resets the terminal printing scheme to default
# This should be used after printing to the terminal is done, since we are altering text colors
reset() {
    echo -n -e "$RESET_CODE"
}

# Checks the provided server address by sending a ping ICMP message
# The server will be reached out to the globally specified number of times
# Argument: The server address to ping
# The return value incidates whether the server was successfully reached
check_site() {
    ping -c $NUM_ATTEMPTS "$1" > /dev/null
    return $?
}

# Success Test
success "Hello World!"

# Failure Test
failure "Hello World!"

# Check Site Test
if check_site 8.8.8.8
then
    success "Ping worked!"
else
    failure "Ping failed!"
fi

# Reset
reset
