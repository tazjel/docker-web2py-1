#!/bin/bash 

set -x
docker node update --label-rm web2py.tier.app `hostname`