#!/bin/bash
cd /etc/puppetlabs/code/environments/production
r10k puppetfile install --verbose debug2
