#!/bin/bash
# vim: set sw=2 ts=2 softtabstop=2 expandtab

# This is simple script to do deployment.
#

# Paths to try in order
HYDE="hyde"
DEPLOY_PATHS=( ~/remote_home/public_html ~/public_html)

cd "${BASH_SOURCE[0]%/*}" # Switch to directory this script is in

for p in ${DEPLOY_PATHS[*]}; do
    if [ ! -d "${p}" ]; then
        echo "Deploy path '${p}' does not exist."
        continue
    fi

    DP="${p}"
done

if [ -z ${DP} ]; then
    echo "None of the suggested deploy paths are available."
    exit 1;
fi

echo "Using deploy path '${DP}'"

if [ -z $(which ${HYDE} 2> /dev/null ) ]; then
    echo "${HYDE} is not installed. Please install it."
    exit 1
fi

# Finally do deploy
${HYDE} gen --deploy-path "${DP}"
