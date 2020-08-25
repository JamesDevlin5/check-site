#!/usr/bin/env bash

# The color code indicating success
SUCCESS_CODE="\e[32m"
# The color code indicating failure
FAILURE_CODE="\e[31m"
# The reset code
RESET_CODE="\e[0m"

# The number of attempts to reach a server before aborting
NUM_ATTEMPTS=3
# The number of seconds before timing out on a ping request
TIMEOUT=3

# The default sites to check to connectivity
DEFAULT_SITES="google.com amazon.com fail.com twitter.com reddit.com netflix.com f0xN3wZ.c0m"

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
    local count=$NUM_ATTEMPTS
    until ping -w "$TIMEOUT" -c 1 "$1" > /dev/null 2>&1; do
        if [[ $count -eq 0 ]]; then
            return 1
        else
            count=$count-1
        fi
    done
    return 0
}

# Check Site Test
for site in ${@:-$DEFAULT_SITES}; do
    if check_site "$site"
    then
        success "$site"
    else
        failure "$site"
    fi
done

# Reset
reset
