
#!/bin/bash
################################
# Author: Nidhi
# Version: v1
#
#
#
# This script will help users to communicate and retrieve information from GitHub
# Usage:
#   Please provide your github token and rest api to the script as input
#
################################

if [ ${#@} -lt 2 ]; then
    echo "usage: $0 [your github token] [REST expression]"
    exit 1;
fi

GITHUB_TOKEN=$1
GITHUB_API_REST=$2

GITHUB_API_HEADER_ACCEPT="Accept: application/vnd.github.v3+json"

temp=`basename $0`
TMPFILE=`mktemp /tmp/${temp}.XXXXXX` || exit 1


function rest_call {
    curl -s $1 -H "${GITHUB_API_HEADER_ACCEPT}" -H "Authorization: token $GITHUB_TOKEN" >> $TMPFILE
}

rest_call "https://api.github.com${GITHUB_API_REST}"

cat $TMPFILE
