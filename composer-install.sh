#!/bin/sh
VERSION="1.10.17"
EXPECTED_CHECKSUM="$(wget -q -O - https://getcomposer.org/download/${VERSION}/composer.phar.sha256sum | cut -d' ' -f1)"
php -r "copy('https://getcomposer.org/download/${VERSION}/composer.phar', 'composer');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha256', 'composer');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    exit 1
fi
chmod +x composer
mv composer /usr/local/bin/composer