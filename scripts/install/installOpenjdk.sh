#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

. ${DIR_ME}/.installUtils.sh
setUserName ${1-"$(whoami)"}

sudo apt install -y openjdk-11-jdk

copyConfigureScript "configureJvmEnv.sh"
modifyBashrc "configureJvmEnv.sh" ". ${HOMEDIR}/.local/bin/env/configureJvmEnv.sh"
