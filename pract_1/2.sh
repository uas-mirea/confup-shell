#!/bin/sh
awk "{if (\$1 != \"#\") {print \$2, \$1}}" /etc/protocols
