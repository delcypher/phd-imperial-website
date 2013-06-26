#!/bin/bash

DEPLOY_PATH="/homes/$( whoami)/public_html/" 
ROOT=$( cd ${BASH_SOURCE[0]%/*} ; echo "$PWD" ) # directory where this script resides

# Enforce trailing slash
ROOT="${ROOT}/"

function usage()
{

  echo "Usage $0 [ --help | --dry-run ]
      $0 [ -h | -n ]

  This script deploys the website residing at ${ROOT} to ${DEPLOY_PATH}

  -h , --help    : Show this help information
  -n , --dry-run : Do not copy files but list what would of been copied.

  "

}

# Parse command line args
while [ -n "$1" ]; do
  case "$1" in

    -h | --help)
      usage
      exit 0;
      ;;
    -n | --dry-run)
      ADDITION_OPTIONS="${ADDITION_OPTIONS} --dry-run"
      ;;
    *)
      echo "Unrecognised option $1"
      echo "Try running --help"
      exit 1
  esac
  shift
done

echo "Deploying to ${DEPLOY_PATH}"
echo "Copying from ${ROOT}"

rsync --perms \
      --times \
      --human-readable \
      --progress \
      --recursive \
      --exclude='/.git/' \
      --exclude='deploy.sh' \
      --exclude='*.swp' \
      --exclude='.gitignore' \
      ${ADDITION_OPTIONS} \
      "${ROOT}" "${DEPLOY_PATH}"
