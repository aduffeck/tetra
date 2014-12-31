#!/bin/bash

# A crude integration test that tries OBS building
# assumes an OpenSUSE host is set up with passwordless SSH access
# assumes this host has osc installed and properly configured in sudoers
# assumes that a project directory exists

set -e

OBS_HOST=obs-client
OBS_PROJECT_DIR=/home/silvio/obs/home\:SilvioMoioli\:tetra-test

scp -r commons-collections/packages/* $OBS_HOST:/$OBS_PROJECT_DIR
ssh -t $OBS_HOST <<EOF
  cd $OBS_PROJECT_DIR/commons-collections-kit &&\
  osc build -k../../rpms -p../../rpms &&\
  cd $OBS_PROJECT_DIR/commons-collections &&\
  osc build -k../../rpms -p../../rpms
EOF
