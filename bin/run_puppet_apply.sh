#!/bin/bash
puppet apply --debug --trace --verbose --modulepath=/etc/puppetlabs/code/environments/production/modules /etc/puppet/code/production/manifests
