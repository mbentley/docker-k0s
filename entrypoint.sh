#!/bin/sh

# set mount propagation
if [ -n "${MOUNT_PROPAGATION}" ]
then
  for MOUNT in ${MOUNT_PROPAGATION}
  do
    echo "Mounting ${MOUNT} as 'rshared'..."
    mount --make-rshared "${MOUNT}"
  done
fi

# generate a machine-id if missing
if [ ! -f "/etc/machine-id" ]
then
  sed 's/-//g' < /proc/sys/kernel/random/uuid > /etc/machine-id
fi

exec "${@}"
