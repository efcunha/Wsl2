#!/bin/bash

set -euo pipefail
DIR_ME=$(realpath $(dirname $0))

. ${DIR_ME}/../../install/.installUtils.sh
setUserName ${1-""}

createMainUser () {
  verifyUserName
  if [[ $(cat /etc/passwd | grep ${USERNAME} | wc -l) == 0 ]]; then
    useradd -m -s /bin/bash ${USERNAME}
  fi

  if [[ ! -d ${HOMEDIR}/Downloads ]]; then
      mkdir ${HOMEDIR}/Downloads
      chown ${USERNAME}:${USERNAME} ${HOMEDIR}/Downloads
  fi

  addSudoers "${USERNAME} ALL=(ALL) NOPASSWD:ALL" "${USERNAME}"
}
createMainUser

modifyWslConf
