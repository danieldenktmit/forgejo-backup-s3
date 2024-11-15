#! /bin/sh

# exit if a command fails
set -e

apk update

# install s3 tools
apk add python3 pipx

# install go-cron
curl -L --insecure https://github.com/odise/go-cron/releases/download/v0.0.7/go-cron-linux.gz | zcat > /usr/local/bin/go-cron
chmod u+x /usr/local/bin/go-cron

# make backup directory and change owner to git
mkdir /backup
chown git /backup

# cleanup
rm -rf /var/cache/apk/*export PATH="$PATH:$HOME/.local/bin"
